def heuristic_seating(students, friends, same_city):
    def count_constraints(student):
        friend_count = sum(1 for f in friends if student in f)
        city = same_city.get(student)
        city_peers = sum(1 for s in students
                        if same_city.get(s) == city and s != student)
        return friend_count + city_peers

    sorted_students = sorted(students,
                            key=count_constraints, reverse=True)
    arrangement = []

    for student in sorted_students:
        placed = False
        for pos in range(len(arrangement) + 1):
            test = arrangement[:pos] + [student] + arrangement[pos:]
            valid = True
            if pos > 0:
                prev = test[pos - 1]
                if ((prev, student) in friends or
                    (student, prev) in friends or
                    same_city.get(prev) == same_city.get(student)):
                    valid = False
            if pos < len(test) - 1 and valid:
                nxt = test[pos + 1]
                if ((student, nxt) in friends or
                    (nxt, student) in friends or
                    same_city.get(student) == same_city.get(nxt)):
                    valid = False
            if valid:
                arrangement = test
                placed = True
                break
        if not placed:
            arrangement.append(student)  # fallback
    return arrangement

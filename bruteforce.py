from itertools import permutations

def check_arrangement(arrangement, friends, same_city):
    for i in range(len(arrangement) - 1):
        s1 = arrangement[i]
        s2 = arrangement[i + 1]
        if (s1, s2) in friends or (s2, s1) in friends:
            return False  # friends sitting next to each other
        if same_city.get(s1) == same_city.get(s2):
            return False  # same city students next to each other
    return True

def brute_force_seating(students, friends, same_city):
    count = 0
    for arrangement in permutations(students):
        count += 1
        if check_arrangement(arrangement, friends, same_city):
            print(f'Valid arrangement found after {count} tries: {arrangement}')
            return arrangement
    print(f'No valid arrangement found after {count} attempts')
    return None

# Example
students = ['Ram', 'Shyam', 'Hari', 'Sita', 'Gita']
friends = {('Ram','Shyam'), ('Hari','Sita'), ('Shyam','Gita')}
same_city = {'Ram':'Kathmandu','Shyam':'Pokhara','Hari':'Kathmandu',
             'Sita':'Butwal','Gita':'Pokhara'}
result = brute_force_seating(students, friends, same_city)

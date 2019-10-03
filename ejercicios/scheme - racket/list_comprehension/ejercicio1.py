""" Examples of list comprehension in Python """

def squares(data):
    result = []
    for i in data:
        if i % 2 == 0:#only returns result when the numer is pair
            result.append(i * i)
    return result

def sqr(num):
    return num * num

#this function does not return a list, returns an iterable that can be converted into a list
def squares_map(data):
    return list(map(lambda x: x*x, data))
    #return map (sqr, data)#equivalent to the lambda function

def squares_comprehension(data):
    #return [x*x for x in data if x % 2 == 0]#only returns result when the numer is pair
    return [x*x if x%2 == 0 else x*x*x for x in data]#returns square when pair and cube when odd

data = [3, 4, 5, 6, 7, 8, 9]

print(squares(data))
print(squares_map(data))
print(squares_comprehension(data))


"""print(squares([3, 4, 5, 6]))
print(squares_map([3, 4, 5, 6]))
print(squares_comprehension([3, 4, 5, 6]))"""
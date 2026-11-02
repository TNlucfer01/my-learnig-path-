def uppercase(func):
    def wrapper():
        return func().upper()
    return wrapper

def exclaim(func):
    def wrapper():
        return func() + "!!!"
    return wrapper

@exclaim
@uppercase
 #hello world
def greet():
    return "hello"

print(greet.__qualname__)  # Output: HELLO!!!

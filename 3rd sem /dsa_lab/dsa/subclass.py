class Aathi:
    def __init__(self):
        print("hello world")
    i = int(10)


class Sub(Aathi):
    def print_value(self):
        print(super().i)


a = Aathi()  # Initializes and prints "hello world"
sub_instance = Sub()
sub_instance.print_value()  # Outputs 10

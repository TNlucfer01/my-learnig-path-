class Conversion:
    def __init__(self, capacity):
        self.top = -1
        self.capacity = capacity
        self.array = []
        self.output = []
        self.precedence = {'+': 1, '-': 1, '*': 2, '/': 2, '^': 3}

    def isEmpty(self):
        return self.top == -1

    def peek(self):
        return self.array[-1]

    def pop(self):
        if not self.isEmpty():
            self.top -= 1
            return self.array.pop()
        else:
            return "$"

    def push(self, op):
        self.top += 1
        self.array.append(op)

    def isOperand(self, ch):
        return ch.isalpha()

    def notGreater(self, i):
        try:
            a = self.precedence[i]
            b = self.precedence[self.peek()]
            return True if a <= b else False
        except KeyError:
            return False

    def infix_to_postfix(self, exp):
        for i in exp:
            # If the character is an operand, add it to the output
            if self.isOperand(i):
                self.output.append(i)
            # If the character is '(', push it to the stack
            elif i == '(':
                self.push(i)
            # If the character is ')', pop and output from the stack until '(' is found
            elif i == ')':
                while not self.isEmpty() and self.peek() != '(':
                    self.output.append(self.pop())
                if not self.isEmpty() and self.peek() != '(':
                    return -1  # invalid expression
                else:
                    self.pop()
            # An operator is encountered
            else:
                while not self.isEmpty() and self.notGreater(i):
                    self.output.append(self.pop())
                self.push(i)

        # Pop all the operators from the stack
        while not self.isEmpty():
            self.output.append(self.pop())

        print("".join(self.output))


# Example usage
exp = "a+b*(c^d-e)^(f+g*h)-i"
obj = Conversion(len(exp))
obj.infix_to_postfix(exp)

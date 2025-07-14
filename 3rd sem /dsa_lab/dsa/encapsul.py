class aathi():
    def __init__(self,age):
        self._age=age
    def printF(self):
        print(self._age)
        self.__at()
    def _aath(self):
        print(10)
    
    def __at(self):
        self._age=20

a=aathi(10)
a.printF()
a._aath()
a._aathi__at()
a.printF()
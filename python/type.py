from types import FunctionType

f_code = compile("def gfg(a,b): return a+b ", "<int>","exec" )
f_func = FunctionType(f_code.co_consts[0], globals(),"gfg")

val1=2000
vla=3211
print(f_func(val1,vla))
if __name__ == "__main__": 

	# Importing a module random 
	import random 

	# Using randint function of random 
	# module as r 
	r = getattr(random, 'randint') 

	# calling the function and storing 
	# the value in res 
	res = r(1, 9) 

	# Printing the result 
	print(res) 
print(__name__)

def add(a:int ,b:int)-> int :
    return a+b


add(1,2)
type(add)

import sys
import numpy as np 
def my_hook(event, *args):
    print(f"Audit event: {event}, Args: {args}")

a=np.linspace(100, 101)
sys.set_asyncgen_hooks(my_hook)
sys.audit("test_event", "data")
sys.implementation
my_hook("hello","hello")
sys.p

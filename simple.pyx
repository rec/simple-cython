import cython

from libcpp.string cimport string
from libcpp.vector cimport vector

include "sub1.pyx"

# What settings can I put in setup.py to be able to uncomment the next line?
# include "sub2.pyx"

cdef extern from "simple.h":
    struct Simple:
        int x
    float infinity()
    float nan()

    vector[string] vectorFunction()

def infinite():
    return infinity()

def notanumber():
    return nan()

cdef class ForwardReference:
    def foo(self, x):
        return _make(x)

cdef ForwardReference _make(object x):
    if isinstance(x, ForwardReference):
        return <ForwardReference> x
    else:
        return ForwardReference(x)


cdef class Wrapper:
    cdef Simple simple;

    cdef int foo(self):
        return 1

    def __cinit__(self):
        self.simple = Simple()

    def bar(self):
        return self.foo()

    cdef test(self):
        cdef Simple* s
        s = cython.address(self.simple)

    property x:
        def __get__(self):
            return self.simple.x
        def __set__(self, int x):
            self.simple.x = x

    def __radd__(self, int x):
        print('__radd__')

    def __iadd__(self, int x):
        print('__iadd__')

    def __add__(self, object x):
        print('__add__')


cdef class Child(Wrapper):
    cdef int foo(self):
        return 2


cdef class Wrapper2:
    cdef int x
    def __init__(self, int x):
        self.x = x


cpdef do_more(x):
    cdef Wrapper2 w
    w = <Wrapper>(x) if isinstance(x, Wrapper2) else Wrapper2(x)
    return w

def do_it():
    return vectorFunction()

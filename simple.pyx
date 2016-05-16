cdef extern from "simple.h":
    struct Simple:
        int x
    float infinity()
    float nan()


def infinite():
    return infinity()

def notanumber():
    return nan()

cdef class Test:
    def foo(self, x):
        return _make(x)

cdef Test _make(object x):
    if isinstance(x, Test):
        return <Test> x
    else:
        return Test(x)


cdef class Wrapper:
    cdef Simple simple;

    cdef int foo(self):
        return 1

    def __cinit__(self):
        self.simple = Simple()

    def bar(self):
        return self.foo()

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

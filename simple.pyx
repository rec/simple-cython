import cython

from libcpp.string cimport string

cdef extern from "simple.h":
    void test(char*)

def foo(bytearray x):
    test(x)
    return x

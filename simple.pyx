cdef extern from "simple.h":
    struct Simple:
        int x

cdef class Wrapper:
    cdef Simple simple;

    def __cinit__(self):
        self.simple = Simple()

    property x:
        def __get__(self):
            return self.simple.x
        def __set__(self, int x):
            self.simple.x = x

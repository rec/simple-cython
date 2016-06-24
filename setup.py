#!/usr/bin/env python3

import platform, setuptools, setuptools, Cython.Build

EXTENSION = setuptools.extension.Extension(
    name='simple',
    sources=['simple.pyx'],
    extra_compile_args=['-Wno-unused-function', '-std=c++11',
                        '-mmacosx-version-min=10.9',
                        ],
    language='c++',
    )

EXT_MODULES=Cython.Build.cythonize(
    [EXTENSION],
    language='c++',
    )

setuptools.setup(
    name='simple',
    ext_modules=EXT_MODULES,
    )

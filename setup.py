#!/usr/bin/env python3

import platform, distutils.core, distutils.extension, Cython.Build

EXTENSION = distutils.extension.Extension(
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

distutils.core.setup(
    name='simple',
    ext_modules=EXT_MODULES,
    )

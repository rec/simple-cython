Problem fixed!

See https://stackoverflow.com/questions/36960587

Generated Cython code

    $ rm -Rf build *.so && python setup.py build_ext
    running build_ext
    building 'simple' extension
    creating build
    creating build/temp.macosx-10.6-intel-3.4
    /usr/bin/clang -fno-strict-aliasing -Werror=declaration-after-statement -fno-common -dynamic -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -arch i386 -arch x86_64 -g -Isrc -I/Library/Frameworks/Python.framework/Versions/3.4/include/python3.4m -c simple.cpp -o build/temp.macosx-10.6-intel-3.4/simple.o -Wno-unused-function -std=c++11
    In file included from simple.cpp:289:
    ./simple.h:2:10: fatal error: 'array' file not found
    #include <array>
             ^
    1 error generated.
    error: command '/usr/bin/clang' failed with exit status 1

    $ /usr/bin/clang -fno-strict-aliasing -Werror=declaration-after-statement -fno-common -dynamic -DNDEBUG -g -fwrapv -O3 -Wall -Wstrict-prototypes -arch i386 -arch x86_64 -g -Isrc -I/Library/Frameworks/Python.framework/Versions/3.4/include/python3.4m -c simple.cpp -o build/temp.macosx-10.6-intel-3.4/simple.o -Wno-unused-function -std=c++11

    # no error!

    $  /usr/bin/clang --version
    Apple LLVM version 5.1 (clang-503.0.40) (based on LLVM 3.4svn)
    Target: x86_64-apple-darwin13.4.0
    Thread model: posix

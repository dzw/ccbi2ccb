SET PATH=D:\msys64\ucrt64\bin;%PATH%
D:\msys64\ucrt64\bin\cmake.exe -S . -B build\release -G Ninja -D CMAKE_BUILD_TYPE=Release -D CMAKE_CXX_COMPILER=D:/msys64/ucrt64/bin/g++.exe
D:\msys64\ucrt64\bin\cmake.exe --build build\release
pause
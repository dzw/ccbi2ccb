SET PATH="D:\Program Files\JetBrains\CLion 2021.2.1\bin\cmake\win\bin\";%PATH%
cmake -B build -A Win32
cmake --build build --config Release
pause
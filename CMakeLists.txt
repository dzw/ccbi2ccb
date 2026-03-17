cmake_minimum_required(VERSION 3.16)
project(ccbi2ccb LANGUAGES CXX)

set(SOURCES
    src/ccbi2ccb.cpp
    src/ccbiReader.cpp
    src/common.cpp
    src/plistHelper.cpp
    src/stdafx.cpp
)

set(TINYXML_SOURCES
    src/tinyxml/tinystr.cpp
    src/tinyxml/tinyxml.cpp
    src/tinyxml/tinyxmlerror.cpp
    src/tinyxml/tinyxmlhelper.cpp
    src/tinyxml/tinyxmlparser.cpp
)

set(HEADERS
    src/ccbiReader.h
    src/common.h
    src/plistHelper.h
    src/stdafx.h
    src/tinyxml/tinystr.h
    src/tinyxml/tinyxml.h
    src/tinyxml/tinyxmlhelper.h
    src/utf8/checked.h
    src/utf8/core.h
    src/utf8/unchecked.h
)

add_executable(ccbi2ccb ${SOURCES} ${TINYXML_SOURCES} ${HEADERS})

target_include_directories(ccbi2ccb PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)

target_compile_definitions(ccbi2ccb PRIVATE
    WIN32
    _CONSOLE
    UNICODE
    _UNICODE
    $<$<CONFIG:Debug>:_DEBUG>
    $<$<CONFIG:Release>:NDEBUG>
)

target_precompile_headers(ccbi2ccb PRIVATE src/stdafx.h)

set_source_files_properties(${TINYXML_SOURCES}
    PROPERTIES SKIP_PRECOMPILE_HEADERS ON
)

if(MSVC)
    target_compile_options(ccbi2ccb PRIVATE /wd4996)
endif()

if(MINGW)
    target_link_options(ccbi2ccb PRIVATE -municode)
endif()

set_target_properties(ccbi2ccb PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<CONFIG>"
)

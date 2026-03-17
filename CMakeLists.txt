cmake_minimum_required(VERSION 3.16)
project(ccbi2ccb LANGUAGES CXX)

set(SOURCES
    ccbi2ccb.cpp
    ccbiReader.cpp
    common.cpp
    plistHelper.cpp
    stdafx.cpp
)

set(TINYXML_SOURCES
    tinyxml/tinystr.cpp
    tinyxml/tinyxml.cpp
    tinyxml/tinyxmlerror.cpp
    tinyxml/tinyxmlhelper.cpp
    tinyxml/tinyxmlparser.cpp
)

set(HEADERS
    ccbiReader.h
    common.h
    plistHelper.h
    stdafx.h
    tinyxml/tinystr.h
    tinyxml/tinyxml.h
    tinyxml/tinyxmlhelper.h
)

add_executable(ccbi2ccb ${SOURCES} ${TINYXML_SOURCES} ${HEADERS})

target_include_directories(ccbi2ccb PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

target_compile_definitions(ccbi2ccb PRIVATE
    WIN32
    _CONSOLE
    UNICODE
    _UNICODE
    $<$<CONFIG:Debug>:_DEBUG>
    $<$<CONFIG:Release>:NDEBUG>
)

target_precompile_headers(ccbi2ccb PRIVATE stdafx.h)

set_source_files_properties(${TINYXML_SOURCES}
    PROPERTIES SKIP_PRECOMPILE_HEADERS ON
)

if(MSVC)
    target_compile_options(ccbi2ccb PRIVATE /wd4996)
endif()

set_target_properties(ccbi2ccb PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/$<CONFIG>"
)

# set minimum cmake version
cmake_minimum_required(VERSION 3.5 FATAL_ERROR)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# project name and language
project(ds_408 LANGUAGES CXX)
add_executable(main main.cpp)

# generate a library from sources
# target_sources(parser
  # PRIVATE
    # parser.cpp
    # parser.hpp
  # )

if(APPLE)
set(platform mac)
else()
set(platform ubuntu)
endif()
target_include_directories(main
  PUBLIC
  $ENV{MHOME}/Playground/lib/${platform}/header/
  )

# Your-external "mylib", add GLOBAL if the imported library is located in directories above the current.
add_library(mylib SHARED IMPORTED)
# You can define two import-locations: one for debug and one for release.
set_target_properties(mylib PROPERTIES IMPORTED_LOCATION $ENV{MHOME}/Playground/lib/${platform}/liblog_c.a)
target_link_libraries(main mylib)

# not work
# link_directories(/Users/quebec/Playground/lib/mac/)
# target_link_libraries(main log_c_lib)


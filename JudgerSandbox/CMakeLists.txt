cmake_minimum_required(VERSION 3.9)
project(JudgerSandbox C)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/output)

set(CMAKE_C_FLAGS "-g -Wall -Werror -O3 -std=gnu99 -pie -fPIC")

# make judger lib
file(GLOB SOURCE "src/*.c")
add_executable(libJudgerSandbox.so ${SOURCE})
target_link_libraries(libJudgerSandbox.so pthread seccomp)

install(FILES output/libJudgerSandbox.so
        PERMISSIONS OWNER_EXECUTE OWNER_READ
        DESTINATION /usr/lib/JudgerSandbox)


cmake_minimum_required(VERSION 3.5)
project(Libraries)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

include_directories(
    ${PROJECT_SOURCE_DIR}/TUTools
    ${PROJECT_SOURCE_DIR}/TUv
    ${PROJECT_SOURCE_DIR}/TUIIDC
    ${PROJECT_SOURCE_DIR}/TUvIIDC
    ${PROJECT_SOURCE_DIR}/TUV4L2
    ${PROJECT_SOURCE_DIR}/TUvV4L2
    ${PROJECT_SOURCE_DIR}/TUvOgl
    ${PROJECT_SOURCE_DIR}/TUQt
    ${PROJECT_SOURCE_DIR}/TUCuda
)

add_subdirectory(TUTools)
add_subdirectory(TUv)
add_subdirectory(TUIIDC)
add_subdirectory(TUvIIDC)
if(CMAKE_SYSTEM_NAME MATCHES "Linux")
  add_subdirectory(TUV4L2)
  add_subdirectory(TUvV4L2)
  add_subdirectory(TUCuda)
  add_subdirectory(TUUSB)
endif()
add_subdirectory(TUvOgl)
add_subdirectory(TUXv)
add_subdirectory(TUQt)
add_subdirectory(cmake_modules)

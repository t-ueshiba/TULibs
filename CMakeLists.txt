cmake_minimum_required(VERSION 3.0)
project(Libraries)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

set(CMAKE_MODULE_PATH
    ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/TUTools++/cmake_modules")
include(FindSIMD)
FindSIMD()

if(AVX2_FOUND)
  add_definitions(-DAVX2)
  set(CMAKE_CXX_FLAGS -mavx2)
elseif(AVX_FOUND)
  add_definitions(-DAVX)
  set(CMAKE_CXX_FLAGS -mavx)
elseif(SSE4_2_FOUND)
  add_definitions(-DSSE4)
  set(CMAKE_CXX_FLAGS "-msse4.2 -mpopcnt")
elseif(SSSE3_FOUND)
  add_definitions(-DSSSE3)
  set(CMAKE_CXX_FLAGS "-msse3 -mssse3")
elseif(SSE3_FOUND)
  add_definitions(-DSSE3)
  set(CMAKE_CXX_FLAGS -msse3)
elseif(SSE2_FOUND)
  add_definitions(-DSSE2)
  set(CMAKE_CXX_FLAGS -msse2)
elseif(NEON_FOUND)
  add_definitions(-DNEON)
  set(CMAKE_CXX_FLAGS "-mcpu=cortex-a7 -mtune=cortex-a7 -mfpu=neon -funsafe-math-optimizations")
endif()

include_directories(
    ${PROJECT_SOURCE_DIR}/TUTools++
#    ${PROJECT_SOURCE_DIR}/TUv++
    ${PROJECT_SOURCE_DIR}/TUIIDC++
#    ${PROJECT_SOURCE_DIR}/TUvIIDC++
    ${PROJECT_SOURCE_DIR}/TUV4L2++
#    ${PROJECT_SOURCE_DIR}/TUvV4L2++
#    ${PROJECT_SOURCE_DIR}/TUOgl++
    ${PROJECT_SOURCE_DIR}/TUQt++
    ${PROJECT_SOURCE_DIR}/TUCuda++
)

add_subdirectory(TUTools++)
#add_subdirectory(TUv++)
add_subdirectory(TUIIDC++)
#add_subdirectory(TUvIIDC++)
if(CMAKE_SYSTEM_NAME MATCHES "Linux")
  add_subdirectory(TUV4L2++)
#  add_subdirectory(TUvV4L2++)
  add_subdirectory(TUCuda++)
endif()
#add_subdirectory(TUOgl++)
#add_subdirectory(TUXv++)
#add_subdirectory(TUUSB++)
add_subdirectory(TUQt++)
add_subdirectory(cmake_modules)

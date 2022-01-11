project(log_c)
add_library(${CMAKE_PROJECT_NAME} STATIC "")

target_sources(${CMAKE_PROJECT_NAME}
  PRIVATE
    src/log.c
    src/log.h
  )

target_compile_options(${CMAKE_PROJECT_NAME}  
  PRIVATE  
    "-DLOG_USE_COLOR"  
  )  

# 如果是project内部的library, 可以加上这个
# target_include_directories(parser
#   PUBLIC
#     ${CMAKE_CURRENT_LIST_DIR}
#   )

add_custom_target(cp ALL
  COMMAND  cp $<TARGET_FILE:${CMAKE_PROJECT_NAME}> $ENV{MHOME}/Playground/lib/$<IF:$<BOOL:${APPLE}>,mac,ubuntu>/
)

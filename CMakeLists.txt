cmake_minimum_required(VERSION 3.0)

project(calculator)

add_custom_command(
  OUTPUT calc.tab.c calc.tab.h
  COMMAND bison -d ${CMAKE_CURRENT_SOURCE_DIR}/calc.y
  COMMENT "Running bison command on ${CMAKE_CURRENT_SOURCE_DIR}/calc.y"
  DEPENDS calc.y
)

add_custom_command(
  OUTPUT lex.yy.c
  COMMAND flex ${CMAKE_CURRENT_SOURCE_DIR}/calc.l
  COMMENT "Running flex command on ${CMAKE_CURRENT_SOURCE_DIR}/calc.l"
  DEPENDS calc.tab.c calc.tab.h calc.l
)

add_executable(${PROJECT_NAME} lex.yy.c calc.tab.c)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
target_link_libraries(${PROJECT_NAME} PRIVATE m)

add_custom_target(
  execute_example_case
  COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME} < ${CMAKE_CURRENT_SOURCE_DIR}/example
  COMMENT "Running calculator with example data"
  DEPENDS ${PROJECT_NAME}
)

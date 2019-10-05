# My first encounter with bison and flex

Calculator evaluates expressions line by line. Language consists of integer values, parentheses, addition, substraction, division, multiplication and power. Program also has 26 slots for variables, named with lowercase letter (a-z). Default value of variable is 0.
Cmake script makes it very convenient to rebuild the whole solution. It takes care of re-running flex and bison if the corresponding files have changed. All that with just `make` :)

## Requirements

+ build-essential
+ flex
+ bison
+ cmake

## Usage

To generate build files, call `cmake` command. Default target builds the calculator, target `execute_example_case` runs the calculator with attached example file.

### Credits

To write lexer and parser I've been following [this](http://ftp.mozgan.me/Compiler\_Manuals/LexAndYaccTutorial.pdf) tutorial.

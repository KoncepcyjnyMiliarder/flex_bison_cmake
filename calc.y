%{
    #include <stdio.h>
    #include <math.h>
    #include <string.h>
    int yylex(void);
    void yyerror(char *);
    int variables[26];
%}

%token INTEGER
%token VARIABLE
%left '-' '+'
%left '*' '/'
%right '^'

%start program

%%

program:
	program_line program
	| 
	;

program_line:
	'\n'
	| statement '\n'
	| statement ';' program_line	
	;

statement:
        expr         		  { printf("%d\n", $1); }
        | assignment
        ;

expr:
        INTEGER
	| VARIABLE 		  { $$ = variables[$1-'a']; }
        | expr '+' expr           { $$ = $1 + $3; }
        | expr '-' expr           { $$ = $1 - $3; }
        | expr '*' expr           { $$ = $1 * $3; }
        | expr '/' expr           { $$ = $1 / $3; }
        | expr '^' expr           { $$ = pow($1, $3); }
        | '(' expr ')'            { $$ = $2; }
        ;

assignment:
        VARIABLE '=' expr	  { variables[$1-'a']=$3; printf("%c = %d\n", $1, $3); }
	;
%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    memset(variables, 0, sizeof(variables));
    yyparse();
    return 0;
}

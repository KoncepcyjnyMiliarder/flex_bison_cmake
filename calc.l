%{
#include <stdlib.h>
void yyerror(char *);
#include "calc.tab.h"
%} 

%%

[0-9]+      { 
                yylval = atoi(yytext); 
                return INTEGER;
            }
[a-z]       {yylval = *yytext; return VARIABLE;}
[;=()\-+*/^\n]  return *yytext; 
[ \t]       ; /* skip whitespace */ 
.           {yyerror("invalid character"); }

%%

int yywrap()
{
return 1;
}	

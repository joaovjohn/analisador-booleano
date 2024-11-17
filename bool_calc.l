%{
#include "bool_calc.tab.h"

extern void yyerror(const char *s);
%}

%%

"true"          { yylval.boolean = 1; return TRUE; }
"false"         { yylval.boolean = 0; return FALSE; }
"AND"           { return AND; }
"OR"            { return OR; }
"NOT"           { return NOT; }
[ \t]+          { /* ignorar espaços e tabulações */ }
\n              { return '\n'; }
"("             { return '('; }
")"             { return ')'; }
.               { yyerror("Caractere inválido"); }

%%

int yywrap(void) {
    return 1;
}
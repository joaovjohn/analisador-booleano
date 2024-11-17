%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

%}

%union {
    int boolean;
}

%token <boolean> TRUE FALSE
%token AND OR NOT
%left AND OR
%right NOT

%type <boolean> expression or_expression and_expression not_expression primary_expression

%%
input:
      /* vazio */
    | input line
    ;

line:
      expression '\n'  { printf("Resultado: %s\n", $1 ? "true" : "false"); }
    ;

expression:
      or_expression
    ;

or_expression:
      or_expression OR and_expression { $$ = $1 || $3; }
    | and_expression                  { $$ = $1; }
    ;

and_expression:
      and_expression AND not_expression { $$ = $1 && $3; }
    | not_expression                     { $$ = $1; }
    ;

not_expression:
      NOT not_expression { $$ = !$2; }
    | primary_expression { $$ = $1; }
    ;

primary_expression:
      TRUE                { $$ = 1; }
    | FALSE               { $$ = 0; }
    | '(' expression ')'  { $$ = $2; }
    ;

%%
    
void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}

int main(void) {
    printf("Digite expressões booleanas (use true, false, AND, OR, NOT):\n");
    yyparse();
    return 0;
}
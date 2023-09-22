%{
#include <stdio.h>
#include <stdlib.h>

/* interface to lexer */
 
extern int yylineno; /* from lexer */
void yyerror(char *s, ...);
int yylex();
%}

%union {
    char *str;
}

/* declare tokens */ 
%token ID
%token KEY
%token NUM
%token SYM
%token SYMC
%token STRING
%token ERROR

%start program

%%
program: /* no syntactic rules yet */
;

%%



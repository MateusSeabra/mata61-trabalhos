%option noyywrap yylineno nodefault
%{

#include <stdio.h>
#include <stdlib.h>
#include "blite.tab.h"

%}

%%

[ \t]+                

"function"           { return KEY; }
"integer"            { return KEY; }
"if"                 { return KEY; }
"else"               { return KEY; }
"while"              { return KEY; }
"return"             { return KEY; }
"int"                { return KEY; }
"char"               { return KEY; }
"void"               { return KEY; }
"print"              { return KEY; }
"{"                  { return SYM; }
"}"                  { return SYM; }
"("                  { return SYM; }
")"                  { return SYM; }
";"                  { return SYM; }
","                  { return SYM; }
":"                  { return SYM; }
"="                  { return SYM; }
"<="                 { return SYMC; }
">="                 { return SYMC; }
"!="                 { return SYMC; }

[0-9]+                 { yylval.str = strdup(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return ID; }
"'"[^\n']"'"           { yylval.str = strdup(yytext); return SYMC; }

"//"[^\n]*           

\"[^"\n]*\"          { yylval.str = strdup(yytext); return STRING; }

\n                   

.                    { yylval.str = strdup(yytext); return ERROR; }

%%
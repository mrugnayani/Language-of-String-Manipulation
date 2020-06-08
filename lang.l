%{
#include<stdlib.h>
#include "lang.tab.h"
void yyerror(char *);
%}

%%

[A-Z] {
		yylval.var=*yytext - 'A';
		return VARIABLE;
	  }

[A-Z][a-z]+   {
				yylval.strval=strdup(yytext);
				return STRING;
			}

[a-z] { yylval.charval=*yytext;
		return CHAR; }

$start {return START;}
display {return SHOW;}
search {return SEARCH;}
concat {return CONCAT;}
var {return VAR;}
replace {return REPLACE;}
assign {return ASSIGN;}
length {return LENGTH;}
$end {return END;}
","|"="|"("|")"|";" {return *yytext;} 
[\n] return *yytext;
[\t];
.yyerror ("invalid character");

%%

int yywrap(void){
	return 1;
}
%{
#include <stdio.h>
%}

%%
(int|float|char|if|else|while|return) {
    printf("%s --> Keyword\n", yytext);
}

[0-9]+ {
    printf("%s --> Number\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("%s --> Identifier\n", yytext);
}

"=="|"<="|">="|"="|"<"|">"|"+"|"-"|"*"|"/" {
    printf("%s --> Operator\n", yytext);
}

";"|","|"("|")"|"{"|"}" {
    printf("%s --> Separator\n", yytext);
}

[ \t\n]+    ;

. {
    printf("%s --> Invalid Character\n", yytext);
}
%%

int yywrap(void)
{
    return 1;
}

int main(void)
{
    printf("Enter the program:\n");
    yylex();
    return 0;
}
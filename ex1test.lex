import java_cup.runtime.Symbol;

%%
%class lexer
%unicode
%int
%standalone
%line
%column

VAR       = [a-zA-Z_][a-zA-Z0-9_]*


%%
(true|false)   {System.out.println("VRAI : " + yytext());}
faux   {System.out.println("FAUX : " + yytext());}
non    {System.out.println("NON : " + yytext());}
et     {System.out.println("ET : " + yytext());}
ou     {System.out.println("OU : " + yytext());}
"("    {System.out.println("POUV : " + yytext());}
")"    {System.out.println("PFERM : " + yytext());}
=      {System.out.println("Affectation : " + yytext());}
{VAR}  {System.out.println("VAR : " + yytext());}

(\n \t)    {} //consommation d'un passage a la ligne
.          {}  //ne rien faire

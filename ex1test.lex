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
(true|false)   {System.out.println("V/F : " + yytext());}
non    {System.out.println("NON : " + yytext());}
et     {System.out.println("ET : " + yytext());}
ou     {System.out.println("OU : " + yytext());}
PRINT  {System.out.println("PRINT" + yytext());}
"("    {System.out.println("POUV : " + yytext());}
")"    {System.out.println("PFERM : " + yytext());}
"^d"   {System.out.println("EXIT : " + yytext());}
=      {System.out.println("Affectation : " + yytext());}
{VAR}  {System.out.println("VAR : " + yytext());}

\n     {System.out.println("Passage à la ligne :" + yyline);}
[ \t]  {}
.      {}  //ne rien faire

import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

VAR       = [a-zA-Z_][a-zA-Z0-9_]*

%%
(true|false)  {return new Symbol(sym.BOOL_VAL, new Boolean(yytext()));}
non           {return new Symbol(sym.NOT);}
et            {return new Symbol(sym.AND);}
ou            {return new Symbol(sym.OR);}
"("           {return new Symbol(sym.LPAR);}
")"           {return new Symbol(sym.RPAR);}
=             {return new Symbol(sym.AFF);}
{VAR}         {return new Symbol(sym.VAR, new String(yytext()));}

\n            {return new Symbol(sym.PASSL);}
[ \t]         {}
.             {}  //ne rien faire

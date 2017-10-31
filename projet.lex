import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

VAR       = [a-zA-Z_][a-zA-Z0-9_]*

%%
(true|false)  {return new Symbol(sym.BOOL_VAL, new Boolean(yytext()));}
not           {return new Symbol(sym.NOT);}
and            {return new Symbol(sym.AND);}
or            {return new Symbol(sym.OR);}
PRINT         {return new Symbol(sym.PRINT);}
"("           {return new Symbol(sym.LPAR);}
")"           {return new Symbol(sym.RPAR);}
"^d"          {return new Symbol(sym.EXIT);}
=             {return new Symbol(sym.AFF);}
{VAR}         {return new Symbol(sym.VAR, new String(yytext()));}

\n            {return new Symbol(sym.EOL);}
[ \t]         {}
.             {}  //ne rien faire

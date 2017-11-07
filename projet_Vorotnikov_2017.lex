import java_cup.runtime.Symbol;

%%
%unicode
%cup
%line
%column

%{
  private void error(String message) {
    System.out.println("Error at line "+(yyline+1)+", column "+(yycolumn+1)+" : "+message);
  }
%}
%eofval{
  return new Symbol(sym.EOF);
%eofval}

VAR       = [a-zA-Z_][a-zA-Z0-9_]*
faulsevar = [0-9][a-zA-Z0-9_]*
boolfr    = (vrai|faux|et|ou|non)
falseop   = [=<>|&!]*


%%
(true|false)  {return new Symbol(sym.BOOL_VAL, new Boolean(yytext()));}
not           {return new Symbol(sym.NOT);}
and           {return new Symbol(sym.AND);}
or            {return new Symbol(sym.OR);}
PRINT         {return new Symbol(sym.PRINT);}
"("           {return new Symbol(sym.LPAR);}
")"           {return new Symbol(sym.RPAR);}
"^d"          {return new Symbol(sym.EXIT);}
"="           {return new Symbol(sym.AFF);}
{boolfr}      {error("Illegal operator name <"+ yytext()+">");}
{faulsevar}   {error("Illegal variable name <"+ yytext()+">");}
{falseop}     {error("Illegal operator <'"+ yytext()+"'>");}
{VAR}         {return new Symbol(sym.VAR, new String(yytext()));}

\r|\n|\r\n    {return new Symbol(sym.EOL);}
[ \t\f]       ava{}
.             {error("Illegal character <'"+ yytext()+"'>"); }

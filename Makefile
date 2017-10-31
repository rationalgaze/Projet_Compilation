# define a makefile variable for the java compiler
#
JFlex=java JFlex.Main
JCup=java java_cup.Main
JCC=javac

# define a makefile variable for compilation flags
# the -g flag compiles with debugging information
#
JFLAGS = -g

default: Yylex parser CUP

CUP: CUP
	$(JCC) $(JFLAGS) parser.java sym.java Yylex.java

parser: parser
	$(JCup) projet.cup

Yylex: Yylex
	$(JFlex) projet.lex


lex: jf class

class: 
	$(JCC) lexer.java
jf: 
	$(JFlex) ex1test.lex


clean:
	$(RM) *.class *.java *.*~

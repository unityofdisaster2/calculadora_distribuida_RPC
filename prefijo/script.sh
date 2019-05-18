lex --header-file=lex.pre.h lexico.l
yacc -d sintactico.y
mv y.tab.h y.pre.h
mv y.tab.c y.pre.c
mv y.tab.h y.pre.h
mv lex.yy.c lex.pre.c
echo "double calculadora_prefija();" >> y.pre.h  
gcc lex.pre.c lex.pre.h -c
gcc y.pre.c y.pre.h -c 
#gcc prueba_extend_yacc.c y.pre.o lex.pre.o -o prueba -lm
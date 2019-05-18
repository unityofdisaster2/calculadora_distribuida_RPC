#se genera codigo en c del analizador lexico y se crea una cabecera
lex --header-file=lex.in.h lexico.l
#se genera codigo en c del analizador sintactico y se crea cabecera
yacc -d sintactico.y
#se cambia el nombre de archivos generados para identificarlos como archivos de analizador infijo
mv y.tab.h y.in.h
mv y.tab.c y.in.c
mv y.tab.h y.in.h
mv lex.yy.c lex.in.c
#se agrega a la cabecera del analizador sintactico la declaracion de la funcion calculadora
echo "double calculadora_infija();" >> y.in.h  
#se compilan objetos de analizador lexico y sintactico
gcc lex.in.c lex.in.h -c
gcc y.in.c y.in.h -c 

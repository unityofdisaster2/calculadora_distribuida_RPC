#se crea codigo en c del analizador lexico junto con cabecera
lex --header-file=lex.notacion.h analiza_notacion.l
#se agregan declaraciones de funciones en cabecera para que no arroje error al compilar
echo "int checar_notacion();" >> lex.notacion.h
echo "int check_num();" >> lex.notacion.h
#se renombra archivo generado por lex para identificarlo
mv lex.yy.c lex.notacion.c
#se crean objetos de pila y analizador lexico
gcc stack.h stack.c -c
gcc lex.notacion.c lex.notacion.h -c

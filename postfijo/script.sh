#se genera codigo en c del analizador lexico y se crea cabecera 
lex --header-file=lex.post.h lexico.l
#se genera codigo en c del analizador sintactico y se crea cabecera
yacc -d sintactico.y
#se renombran archivos para reconocerlos como propios del analizador postfijo
mv y.tab.h y.post.h
mv y.tab.c y.post.c
mv y.tab.h y.post.h
mv lex.yy.c lex.post.c
#se agrega declaracion de funcion calculadora en cabecera de yacc
echo "double calculadora_postfija();" >> y.post.h  
#se generan objetos para su uso posterior
gcc lex.post.c lex.post.h -c
gcc y.post.c y.post.h -c 
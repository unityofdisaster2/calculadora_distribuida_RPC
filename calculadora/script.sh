gcc -Wall test_postfijo.c y.post.o lex.post.o -o prueba_postfijo -lm
gcc -Wall test_prefijo.c y.pre.o lex.pre.o -o prueba_prefijo -lm
gcc -Wall test_infijo.c y.in.o lex.in.o -o prueba_infijo -lm
gcc test_analiza.c stack.o lex.notacion.o -o prueba_analiza
gcc prueba_extend_yacc.c -o conector

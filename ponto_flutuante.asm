 @ /0000
;Optamos por colocar o valor de C igual a 11 decimal, 
;
;

SIGNAL         K /0000; s = 0000 ou 0001
CARACTERISTICA K #00000; 0000 < c <  31 
MANTISSA       K /0000; f (16 bits) mais significativo para menos significativo
;  


VARIAVEL K /0000 ;numero a ser convertido

FLOAT        K /0000;
            LD VARIAVEL;primeiro testa o s e o coloca na calor
            JN NEGATIVO;
            LV /0000 ;carrega 0
            MM SIGNAL ;
            JP VOLTASIGNAL
NEGATIVO    LV /0001 ; garrega um 
            MM SIGNAL ; 
            JP VOLTASIGNAL           
VOLTASIGNAL







      RS FLOAT; retorna a funcao

variavel k /1234


BINARIO1 K /0000;

CONST1  K /1000;
CONST2  K /0100;
CONST3  K /0010;
DOIS    K /0002;
MENOSUM K /FFFF;

INTERMEDIARIO K /0009;

HEX2BIN K /0000; guarda endereco

       LD INTERMEDIARIO;
       DV DOIS; 0004
       ML DOIS; 0008
       SB INTERMEDIARIO; -0001
       ML MENOSUM; 0001
       MM BINARIO1; 

       LD INTERMEDIARIO;
       DV DOIS; 0004
       MM INTERMEDIARIO; 0004
       DV DOIS; 0002
       ML DOIS; 0004
       SB INTERMEDIARIO; 0000
       ML MENOSUM;
       ML CONST3; 0000
       AD BINARIO1;
       MM BINARIO1; 

       LD INTERMEDIARIO; 0004
       DV DOIS; 0002
       MM INTERMEDIARIO; 0002
       DV DOIS; 0001
       ML DOIS; 0002
       SB INTERMEDIARIO; 0000
       ML MENOSUM;
       ML CONST2; 
       AD BINARIO1;
       MM BINARIO1;


       LD INTERMEDIARIO; 0002
       DV DOIS; 0001
       MM INTERMEDIARIO; 0001
       DV DOIS; 0000
       ML DOIS; 0000
       SB INTERMEDIARIO; -0001
       ML MENOSUM;0001
       ML CONST1; 
       AD BINARIO1;
       MM BINARIO1;

       LD BINARIO1;

       RS HEX2BIN; retorna

;
# MAIN
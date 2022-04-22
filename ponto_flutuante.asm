 @ /0000
;Optamos por colocar o valor de C igual a 11 decimal, 
;
;

SIGNAL         K /0000; s = 0000 ou 0001
CARACTERISTICA K #00000; 0000 < c <  31 
MANTISSA1      K /0000; 
MANTISSA2      K /0000;
MANTISSA3      K /0000;
MANTISSA4      K /0000;
; f (16 bits) mais significativo para menos significativo


VARIAVEL K /0000 ;numero a ser convertido

BINARIO1    K /0000
BINARIO2    K /0000
BINARIO3    K /0000
BINARIO4    K /0000

;constantes e varivaies para a funcao float





FLOAT        K /0000;
            LD VARIAVEL;primeiro testa o s e o coloca na calor
            JN NEGATIVO;
            LV /0000 ;carrega 0
            MM SIGNAL ;
            JP VOLTASIGNAL
NEGATIVO    LV /0001 ; garrega um 
            MM SIGNAL ; 
            JP VOLTASIGNAL 
;depois de descobrir o sinal, precisamos transformartransformar a varivel em bits, guardando nas mantissas          
VOLTASIGNAL LD VARIAVEL;1234
            ML CONST1;4000
            DV CONST1;0004
            MM INTERMEDIARIO;
            SC HEX2BIN;
            MM BINARIO4;

            LD VARIAVEL; 1234
            ML CONST2; 3400
            DV CONST1; 0003
            MM INTERMEDIARIO;
            SC HEX2BIN;
            MM BINARIO3;

            LD VARIAVEL; 1234
            ML CONST3; 2340
            DV CONST1; 0002
            MM INTERMEDIARIO;
            SC HEX2BIN;
            MM BINARIO2;

            LD VARIAVEL; 1234
            DV CONST1; 0001
            MM INTERMEDIARIO;
            SC HEX2BIN;
            MM BINARIO1;

            SC ENCONTRAUM; funcao irá procurar em qual posicao o primeiro 1 se encontra, na varivel binarios




            RS FLOAT; retorna a funcao



;variaveis para a funcao HEX2BIN
BINARIO K /0000;

CONST1  K /1000;
CONST2  K /0100;
CONST3  K /0010;
DOIS    K /0002;
MENOSUM K /FFFF;

INTERMEDIARIO K /0000;

HEX2BIN K /0000; guarda endereco

       LD INTERMEDIARIO;
       DV DOIS; 0004
       ML DOIS; 0008
       SB INTERMEDIARIO; -0001
       ML MENOSUM; 0001
       MM BINARIO; 

       LD INTERMEDIARIO;
       DV DOIS; 0004
       MM INTERMEDIARIO; 0004
       DV DOIS; 0002
       ML DOIS; 0004
       SB INTERMEDIARIO; 0000
       ML MENOSUM;
       ML CONST3; 0000
       AD BINARIO;
       MM BINARIO; 

       LD INTERMEDIARIO; 0004
       DV DOIS; 0002
       MM INTERMEDIARIO; 0002
       DV DOIS; 0001
       ML DOIS; 0002
       SB INTERMEDIARIO; 0000
       ML MENOSUM;
       ML CONST2; 
       AD BINARIO;
       MM BINARIO;


       LD INTERMEDIARIO; 0002
       DV DOIS; 0001
       MM INTERMEDIARIO; 0001
       DV DOIS; 0000
       ML DOIS; 0000
       SB INTERMEDIARIO; -0001
       ML MENOSUM;0001
       ML CONST1; 
       AD BINARIO;
       MM BINARIO;

       LD BINARIO;

       RS HEX2BIN; retorna

ZERO K /0000;
UM K /0001;
CONTADOR K /0000;

ENCONTRAUM  K /0000; 

            ;verifica a MANTISSA1



# MAIN
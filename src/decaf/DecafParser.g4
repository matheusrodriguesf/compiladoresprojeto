parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

<<<<<<< HEAD
//program: TK_class ID LCURLY RCURLY EOF;
program:  CLASSE 'Program' LCURLY declaracao *| metodo * RCURLY EOF;
tipo: INTEIRO|BOOLEANO;
declaracao: (tipo ID+|tipo ID LBRACKET NUMEROPOSITIVO RBRACKET)+ PONTOVIRGULA;
metodo: (tipo|VOID ID LPARENT (tipo ID (','tipo ID)*)? RPARENT bloco;
bloco: LCURLY variaveldeclarada * statement * RCURLY;
variaveldeclarada: ( tipo ID (',' tipo ID)* ?)PONTOVIRGULA;
statement: (location|assign_op|expression)PONTOVIRGULA;
location: ID | ID LBRACKET expression RBRACKET;
assign_op:ATRIBUICAO|INCREMENTO|DECREMENTO;
expression:location|method_call|literal|expression bin_op expression| '-' expression| '!' expression | LPARENT expression RPARENT;
method_name:ID;
method_call:method_name LPARENT (expression ( ',' expression)*)?;
literal:
bin_op:


=======


program: CLASSE PROGRAMA LCURLY (field_decl|method_decl)* RCURLY EOF;

field_decl: type id (VIRGULA type ID)* PONTOVIR
            |type id LBRACKET int_literal RBRACKET (VIRGULA type ID LBRACKET int_literal RBRACKET)* PONTOVIR;
            
          

            
method_decl: (type|VOID) id LPARENT(type id(VIRGULA type id)*)? RPARENT block;

block: LCURLY (var_decl|statement)* RCURLY;

assign_op:ATRIBUICAO
         |DECREMENTO
         |INCREMENTO;

var_decl: type id PONTOVIR
          |type VIRGULA id * PONTOVIR;

type: INTEIRO|BOOLEANO;
statement:location assign_op expr PONTOVIR
         |method_call PONTOVIR
         |SE LPARENT expr RPARENT block (SENAO block)?
         |PARA id assign_op expr VIRGULA expr block 
         |RETORNO (expr)? PONTOVIR
         |BREAK PONTOVIR
         |CONTINUA PONTOVIR
         |block; 

method_call:method_name LPARENT (expr(VIRGULA expr)*)? RPARENT
           |CHAMAR LPARENT(string_literal(VIRGULA call_arg(VIRGULA call_arg)*)?) RPARENT;
location: id|id LBRACKET expr RBRACKET;  

expr:location
      |method_call
      |literal
      |expr bin_op expr
      |SUB expr
      |EXCL expr
      |LPARENT expr RPARENT;

method_name:id;
call_arg: expr|string_literal;
bin_op: aritmeticos|rel_op|eq_op|cond_op;
aritmeticos:MULT|DIV|SUB|SUM|REST|EXP;
rel_op:COMPARACAO;
eq_op: IGUALDADE;
cond_op:LOGICOS;

literal:int_literal|char_literal|bool_literal;

id: ID;
int_literal: decimal_literal|hex_literal;
decimal_literal: NUMEROPOSITIVO;
hex_literal: HEX;
bool_literal: VERDADEIRO|FALSO;
char_literal: CHARLITERAL;
string_literal:STRING;
>>>>>>> parsin

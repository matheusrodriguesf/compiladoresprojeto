parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}



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

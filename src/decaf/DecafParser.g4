parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

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



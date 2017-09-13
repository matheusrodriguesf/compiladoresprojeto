lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';


HEX: '0x'('0'..'9'|'a'..'f'|'A'..'F')+;
NUMBER: ('-')?('0'..'9')+;

RESERVADAS: BOOLEANO|CHAMAR|CLASSE|SENAO|FALSO|SE|INTEIRO|RETORNO|VERDADEIRO|VOID|PARA|FORPAR|BREAK|CONTINUA;
OPERADORES : ('+'|'-'|'*'|'<'|'<='|'>'|'>='|'>'|'&&'|'!='|'=='|'||'|'==='|ESPECIAL);
CHARLITERAL: '\'' CHAR '\'';

ID: [_a-zA-Z][0-9_a-zA-Z]+;



WS_ : (' ' | '\n') -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;	

fragment ESC :  '\\' ('\\'|'t'|'n'|'"');
fragment CHAR : ('a'..'z'| 'A'..'Z'|'0'..'9'|ESC|'\t'|ESPECIAL);
fragment ESPECIAL: ('!' | '#'|'$' | '%' | '&' | '(' | ')' | '*' | '+' | ',' | '-'| '.'| ';'|':'|'>'|'='|'<'|'?'|'@'| '[' |']'|'^'|'_'|'{'|'}'|'~');
fragment BOOLEANO:'boolean'; 
fragment CHAMAR:'callout';
fragment CLASSE:'class';
fragment SENAO:'else';
fragment FALSO:'false' ;
fragment SE:'if';
fragment INTEIRO:'int';
fragment RETORNO:'return';
fragment VERDADEIRO:'true';
fragment VOID:'void';
fragment PARA:'for';
fragment FORPAR:'forpar';
fragment BREAK:'break';
fragment CONTINUA: 'continue';



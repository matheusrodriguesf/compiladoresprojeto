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
LPARENT:'(';
RPARENT:')';
LBRACKET:'[';
RBRACKET:']';
PONTOVIR:';';
<<<<<<< HEAD
//ARITMETICOS:('+'|'-'|'*'|'/'|'%'|'^');
OP1:'*'|'/';
OP2:'+'|'-';
OP3:'%'|'^';
LOGICOS: ('&&'|'||');
COMPARACAO: ('>'|'<'|'>='|'<='|'=='|'==='|'!=');
INCREMENTO: '+=';
DECREMENTO:'-=';
ATRIBUICAO:'=';

ESPECIAL: ('!' | '#'|'$'  | '&'  | ',' | '.'| ';'|':'|'?'|'@'|'_'|'~');
=======
VIRGULA :',';
MULT:'*';
DIV:'/';
SUB: '-';
SUM: '+';
EXP:'^';
REST:'%';
EXCL:'!';

ARITMETICOS: MULT|DIV|SUB|SUM|REST|EXP;
LOGICOS: ('&&'|'||');
IGUALDADE: ('=='|'==='|'!=');
COMPARACAO: ('>'|'<'|'>='|'<=');
INCREMENTO: '+=';
DECREMENTO:'-=';
ATRIBUICAO:'=';
PROGRAMA:'Program'; 
>>>>>>> parsin
BOOLEANO:'boolean'; 
CHAMAR:'callout';
CLASSE:'class';
SENAO:'else';
FALSO:'false' ;
SE:'if';
INTEIRO:'int';
RETORNO:'return';
VERDADEIRO:'true';
VOID:'void';
PARA:'for';
FORPAR:'forpar';
BREAK:'break';
CONTINUA: 'continue';


<<<<<<< HEAD
HEX: '0x'('0'..'9'|'a'..'f'|'A'..'F')+;
NUMBER: ('-'|)?('0'..'9')+ ~ 'x' ;
NUMEROPOSITIVO:[0-9]+ ~ 'x';

//RESERVADAS: BOOLEANO|CHAMAR|CLASSE|SENAO|FALSO|SE|INTEIRO|RETORNO|VERDADEIRO|VOID|PARA|FORPAR|BREAK|CONTINUA;
OPERADORES : (LCURLY|RCURLY|LPARENT|RPARENT|LBRACKET|RBRACKET|PONTOVIR|OP1|OP2|OP3|LOGICOS|COMPARACAO|ATRIBUICAO|ESPECIAL);

CHARLITERAL: '\'' CHAR '\'';
STRING: '"' (ESC|CHAR|NUMBER|OPERADORES|ESPECIAL|'\\'|~('"'))*'"';
ID: [_a-zA-Z][0-9_a-zA-Z]*;



WS_ : (' ' | '\n') -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;	

fragment ESC :  '\\' ('\\'|'t'|'n'|'"');
fragment CHAR : ('a'..'z'| 'A'..'Z'|'0'..'9'|ESC|'\t'|ESPECIAL);



=======
ESPECIAIS: LCURLY|RCURLY|LPARENT|RPARENT|LBRACKET|RBRACKET|PONTOVIR|VIRGULA|MULT|DIV|SUB|SUM|EXP|REST|EXCL
'>'|'<'|ATRIBUICAO|'#'|'$'|'&'|'.'|':'|'?'|'@'|'_'|'`'|'|'|'~';

HEX: '0x'('0'..'9'|'a'..'f'|'A'..'F')+;
NUMEROPOSITIVO:[0-9]+;

OPERADORES : (LCURLY|RCURLY|LPARENT|RPARENT|LBRACKET|RBRACKET|PONTOVIR|ARITMETICOS|LOGICOS|COMPARACAO|ATRIBUICAO|ESPECIAIS);
CHARLITERAL: '\''(ESC|CHAR|ESPECIAIS)'\'';
STRING: '"' (ESC|CHAR|NUMEROPOSITIVO|OPERADORES|ESPECIAIS|'\\'|~('"'))*'"';
ID: [_a-zA-Z][0-9_a-zA-Z]*;

WS_ : (' '|'\n'|'\t'|'\r')+ -> skip;
SL_COMMENT : '//' (~'\n')* '\n' -> skip;	

fragment CHAR:('a'..'z'|'A'..'Z'|'0'..'9');
fragment ESC: '\\' ( 'r' | 'n' | 't' | '\'' | '"' | '\\') ;
>>>>>>> parsin

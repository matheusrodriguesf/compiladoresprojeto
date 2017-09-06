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

ID  :  ('a'..'z' | 'A'..'Z')+;


CHARLITERAL: '\'' CHAR '\'';
STRING : '"' CHAR+ '"';
HEX: '0x'('0'..'9'|'a'..'f'|'A'..'F')+;
WS_ : (' ' | '\n') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

fragment ESC :  '\\' ('\\'|'t'|'n'|'"');
fragment CHAR : ('a'..'z'| 'A'..'Z'|'0'..'9'|ESC|'\t');


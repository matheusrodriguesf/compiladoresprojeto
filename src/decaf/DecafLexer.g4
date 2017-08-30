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

CHAR : '\''('a'..'z'| 'A'..'Z'|'0'..'9'|'\\')'\'';

STRING : '"' (ESC|~'"')*;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

fragment
ESC :  '\\' ('n'|'"');

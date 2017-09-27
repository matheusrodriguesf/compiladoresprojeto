package decaf;

import java.io.*;
//import antlr.Token;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import java6035.tools.CLI.*;

class Main {
    public static void main(String[] args) {
        try {
        	CLI.parse (args, new String[0]);

        	InputStream inputStream = args.length == 0 ?
                    System.in : new java.io.FileInputStream(CLI.infile);

        	if (CLI.target == CLI.SCAN)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
        		Token token;
        		boolean done = false;
        		while (!done)
        		{
        			try
        			{
		        		for (token=lexer.nextToken(); token.getType()!=Token.EOF; token=lexer.nextToken())
		        		{
		        			String type = "";
		        			String text = token.getText();
						

		        			switch (token.getType())
		        			{
						case DecafLexer.CHARLITERAL:
							type = "CHARLITERAL";
							break;
						
						case 								DecafLexer.HEX:
							type = "HEXADECIMAL";
							break;

		        			case DecafLexer.ID:
		        				type = "IDENTIFIER";
		        				break;


						case DecafLexer.NUMBER:
							type = "NUMEROS";
							break;

						 case DecafLexer.OPERADORES:
							type = "OPERADORES";
							break;


						case DecafLexer.LBRACKET:
							type = "LEFT BRACKET";
							break;

						case DecafLexer.RBRACKET:
							type = "RIGHT BRACKET";
							break;
						
						case DecafLexer.PONTOVIR:
							type = "PONTO E VIRGULA";
							break;

						case DecafLexer.ARITMETICOS:
							type = "ARITMETICOS";
							break;
						

						case DecafLexer.LOGICOS:
							type = "LOGICOS";
							break;

						case DecafLexer.COMPARACAO:
							type = "COMPARACAO";
							break;
						
						case DecafLexer.ATRIBUICAO:
							type = "ATRIBUICAO";
							break;


						
						case DecafLexer.BOOLEANO:
							type = "BOOLEANO";
							break;

						case DecafLexer.CHAMAR:
							type = "CHAMAR";
							break;
						case DecafLexer.CLASSE:
							type = "CLASSE";
							break;
						case DecafLexer.SE:
							type = "SE";
							break;
						case DecafLexer.SENAO:
							type = "SENAO";
							break;

						case DecafLexer.VOID:
							type = "VOID";
							break;

						case DecafLexer.PARA:
							type = "SENAO";
							break;


						case DecafLexer.FORPAR:
							type = "FORPAR";
							break;

						case DecafLexer.BREAK:
							type = "BREAK";
							break;

						case DecafLexer.RETORNO:
							type = "SENAO";
							break;




						case DecafLexer.CONTINUA:
							type = "CONTINUA";
							break;

						case DecafLexer.FALSO:
							type = "FALSO";
							break;

						case DecafLexer.VERDADEIRO:
							type = "VERDADEIRO";
							break;

						case DecafLexer.INTEIRO:
							type = "INTEIRO";
							break;

						/*case
 						DecafLexer.RESERVADAS:
							type = "RESERVADAS";
							break;
 						*/

/*cas
 						DecafLexer.RESERVADAS:
							type = "RESERVADAS";
							break;
 						*/

}
		        			System.out.println (token.getLine() + type + " " + text);
						
		        		}
		        		done = true;
        			} catch(Exception e) {
        	        	// print the error:
        	            System.out.println(CLI.infile+" "+e);
        	            lexer.skip();
        	        }
        		}
        	}
        	else if (CLI.target == CLI.PARSE || CLI.target == CLI.DEFAULT)
        	{
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
        		DecafParser parser = new DecafParser(tokens);
                parser.program();
        	}
        	
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}


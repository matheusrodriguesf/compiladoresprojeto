package decaf;

import java.io.*;
//import antlr.Token;
<<<<<<< HEAD
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
=======
import java.util.Arrays;
import javax.swing.JFrame;
import javax.swing.JPanel;

import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

>>>>>>> parsin
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
<<<<<<< HEAD
						

		        			switch (token.getType())
		        			{
						case DecafLexer.CHARLITERAL:
							type = "CHARLITERAL";
							break;
						
						case 								DecafLexer.HEX:
=======

		        			switch (token.getType())
		        			{
							case DecafLexer.CHARLITERAL:
							type = "CHARLITERAL";
							break;
							
						case DecafLexer.HEX:
>>>>>>> parsin
							type = "HEXADECIMAL";
							break;

		        			case DecafLexer.ID:
		        				type = "IDENTIFIER";
		        				break;

<<<<<<< HEAD

						case DecafLexer.NUMBER:
							type = "NUMEROS";
							break;


=======
>>>>>>> parsin
						case DecafLexer.NUMEROPOSITIVO:
							type = "NUMEROS POSITIVOS";
							break;

						 case DecafLexer.OPERADORES:
							type = "OPERADORES";
							break;
<<<<<<< HEAD


=======
						
>>>>>>> parsin
						case DecafLexer.LBRACKET:
							type = "LEFT BRACKET";
							break;

						case DecafLexer.RBRACKET:
							type = "RIGHT BRACKET";
							break;
						
						case DecafLexer.PONTOVIR:
							type = "PONTO E VIRGULA";
							break;
<<<<<<< HEAD

						/*case DecafLexer.ARITMETICOS:
							type = "ARITMETICOS";
							break;
						
						*/
=======
						case DecafLexer.ARITMETICOS:
							type = "ARITMETICOS";
							break;
						
						
>>>>>>> parsin
						case DecafLexer.LOGICOS:
							type = "LOGICOS";
							break;

						case DecafLexer.COMPARACAO:
							type = "COMPARACAO";
							break;
						
						case DecafLexer.ATRIBUICAO:
							type = "ATRIBUICAO";
							break;
<<<<<<< HEAD


=======
						
						case DecafLexer.STRING:
							type = "STRINGLITERAL";
							break;
>>>>>>> parsin
						
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
<<<<<<< HEAD




=======
>>>>>>> parsin
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
<<<<<<< HEAD

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
						
=======
							}
		        			System.out.println (token.getLine() + type + " " + text);
>>>>>>> parsin
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
<<<<<<< HEAD
        		DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
				CommonTokenStream tokens = new CommonTokenStream(lexer);
        		DecafParser parser = new DecafParser(tokens);
                parser.program();
        	}
=======
        	    // Primeiro faz o parsing da cadeia
                DecafLexer lexer = new DecafLexer(new ANTLRInputStream(inputStream));
                CommonTokenStream tokens = new CommonTokenStream(lexer);
                DecafParser parser = new DecafParser(tokens);

                // Adiciona as regras semÃ¢nticas
                ParseTree tree = parser.program();

                if (CLI.debug) {
                    // Se estiver no modo debug imprime a Ã¡rvore de parsing
                    // Create Tree View
                    // Source: https://stackoverflow.com/questions/23809005/how-to-display-antlr-tree-gui


                    //show AST in console
                    System.out.println(tree.toStringTree(parser));

                    //show AST in GUI
                    JFrame frame = new JFrame("Antlr AST");
                    JPanel panel = new JPanel();
                    TreeViewer viewr = new TreeViewer(Arrays.asList(
                            parser.getRuleNames()),tree);
                    viewr.setScale(1.5);//scale a little
                    panel.add(viewr);
                    frame.add(panel);
                    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                    frame.setSize(200,200);
                    frame.setVisible(true);
                }

            }
>>>>>>> parsin
        	
        } catch(Exception e) {
        	// print the error:
            System.out.println(CLI.infile+" "+e);
        }
    }
}
<<<<<<< HEAD

=======
>>>>>>> parsin

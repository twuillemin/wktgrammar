/**
 * @author Thomas Wuillemin
 * @version 0.1.0
 * @since 0.1.0
 *
 * <p>
 * What is this repository for?
 * <p>
 * A simple project holding the definition of WTK Grammar and using ANTLR4 for generating the Lexer and the Parser
 * <p>
 * The project is only an ANTLR4 grammar and so will generate the following classes / interfaces:
 * <ul>
 * <li>WtkLexer: the lexer
 * <li>WtkParser: the parser
 * <li>WtkListener: the interface for listener
 * <li>WtkBaseListener: an empty listener object to be overridden
 * </ul>
 * <p>
 * How do I get set up? #
 * <p>
 * The project could be build by a simple `mvn clean install`
 * <p>
 * How do I get set use?
 * <p>
 * Specific listener
 * <p>
 * As by ANTLR4 convention, each grammatical item provides 2 functions for entering and exiting the node.
 * For example, with the top node, named `wtk`, one can simply have the following listener:
 *
 * <pre>
 * <code>
 * import net.wuillemin.wktgrammar.WktBaseListener;
 * import net.wuillemin.wktgrammar.WktParser;
 *
 * public class MyWktListener extends WktBaseListener {
 *     {@literal @}Override
 *     public void enterWtk(WktParser.WtkContext ctx){
 *         System.out.println("Entering Wtk");
 *     }
 *
 *     {@literal @}Override
 *     public void exitWtk(WktParser.WtkContext ctx){
 *         System.out.println("Exiting Wtk: " + ctx.getText());
 *     }
 * }
 * </code>
 * </pre>
 *
 * <p>
 * Parser
 * <p>
 * Executing the parsing is done like every ANTLR grammar:
 *
 * <pre>
 * <code>
 * import net.wuillemin.wktgrammar.WktLexer;
 * import net.wuillemin.wktgrammar.WktParser;
 * import org.antlr.v4.runtime.CharStream;
 * import org.antlr.v4.runtime.CharStreams;
 * import org.antlr.v4.runtime.CommonTokenStream;
 *
 * public class MyWkt {
 *     public static void main(String[] args) throws Exception {
 *
 *         // Create a CharStream
 *         CharStream cs = CharStreams.fromString("POINT (10 10)");
 *
 *         // Set the lexer
 *         WktLexer lexer = new WktLexer(cs);
 *         CommonTokenStream tokens = new CommonTokenStream(lexer);
 *
 *         // Set the parser
 *         WktParser parser = new WktParser(tokens);
 *
 *         // Add the listener
 *         parser.addParseListener(new MyWktListener());
 *
 *         // Start parsing
 *         parser.wtk();
 *     }
 * }
 * </code>
 * </pre>
 *
 * <p>
 * Grammar currently implemented
 * <p>
 * The top grammar node is named `wtk`.
 * <p>
 * The other node as named as defined in the following documentation *OpenGIS Implementation
 * Specification for Geographic information* - *Simple feature access - Part 1: Common architecture
 * version 1.2.1*.
 * See [http://www.opengeospatial.org/standards/sfa].
 *
 * <p>
 * For example, the node provided include:
 * <ul>
 * <li>pointTaggedText
 * <li>lineStringTaggedText
 * <li>polygonTaggedText
 * <li>triangleTaggedText
 * <li>polyhedralSurfaceTaggedText
 * <li>tinTaggedText
 * <li>multiPointTaggedText
 * <li>multiLineStringTaggedText
 * <li>multiPolygonTaggedText
 * <li>geometryCollectionTaggedText
 * </ul>
 *
 * and there Z, M and ZM counterparts, such as pointTaggedTextZ, pointTaggedTextM, pointTaggedTextZM
 *
 * <p>Version
 * <ul>
 * <li> 0.1.0 - Include all geometric objects
 * </ul>
 *
 * <p>Contact
 *
 * Use the project page [https://github.com/twuillemin/wtkgrammar]
 */
package net.wuillemin.wktgrammar;

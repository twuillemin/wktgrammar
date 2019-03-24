# What is this repository for? #

A simple project holding the definition of WTK Grammar and using ANTLR4 for generating the Lexer and the Parser

The project is only an ANTLR4 grammar and so will generate the following classes / interfaces:

* WtkLexer: the lexer
* WtkParser: the parser
* WtkListener: the interface for listener
* WtkBaseListener: an empty listener object to be overridden

# How do I get set up? #

The project could be build by a simple
`mvn clean install`

# How do I get set use? #

## Specific listener ##

As by ANTLR4 convention, each grammatical item provides 2 functions for entering and exiting the node. For example, with the top node, named `wtk`, one can simply have the following listener:


```
#!java

import net.wuillemin.wktgrammar.WktBaseListener;
import net.wuillemin.wktgrammar.WktParser;

public class MyWktListener extends WktBaseListener {
    @Override
    public void enterWtk(WktParser.WtkContext ctx){
        System.out.println("Entering Wtk");
    }

    @Override
    public void exitWtk(WktParser.WtkContext ctx){
        System.out.println("Exiting Wtk: " + ctx.getText());
    }
}
```

## Parser ##

Executing the parsing is done like every ANTLR grammar 


```
#!java

import net.wuillemin.wktgrammar.WktLexer;
import net.wuillemin.wktgrammar.WktParser;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

public class MyWkt {

    public static void main(String[] args) throws Exception {
        // Create a CharStream
        CharStream cs = CharStreams.fromString("POINT (10 10)");

        // Set the lexer
        WktLexer lexer = new WktLexer(cs);
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // Set the parser
        WktParser parser = new WktParser(tokens);

        // Add the listener
        parser.addParseListener(new MyWktListener());

        // Start parsing
        parser.wtk();
    }
}

```

# Grammar currently implemented #

The top grammar node is named `wtk`.

The other node as named as defined in the following documentation *OpenGIS Implementation Specification for Geographic information* - *Simple feature access - Part 1: Common architecture version 1.2.1*. See [http://www.opengeospatial.org/standards/sfa].

For example, the node provided include:

* pointTaggedText
* lineStringTaggedText
* polygonTaggedText
* triangleTaggedText
* polyhedralSurfaceTaggedText
* tinTaggedText
* multiPointTaggedText
* multiLineStringTaggedText
* multiPolygonTaggedText
* geometryCollectionTaggedText

and there Z, M and ZM counterparts, such as pointTaggedTextZ, pointTaggedTextM, pointTaggedTextZM

# Version #
* 0.1.0 - Include all geometric objects

# Contact #

Use the project page [https://github.com/twuillemin/wtkgrammar]

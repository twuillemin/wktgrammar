// define a grammar called Wkt
grammar Wkt;

// =================================================================
//                        GRAMMAR
// =================================================================

//
// The name of the rules may seem a bit strange, but they conform to
// the names defined in the following documentation
// OpenGIS Implementation Specification for Geographic information -
//    Simple feature access - Part 1: Common architecture version 1.2.1
//
// see http://www.opengeospatial.org/standards/sfa
//

// The global object
wtk: (geometryTaggedText | geometryTaggedTextZ | geometryTaggedTextM | geometryTaggedTextZM) SPACE* EOF;

// ------------------------------------------------------------
//                  High level parts
// ------------------------------------------------------------

// -------------------- 2D types ------------------------------
// First level objects
geometryTaggedText: pointTaggedText
    | lineStringTaggedText
    | polygonTaggedText
    | triangleTaggedText
    | polyhedralSurfaceTaggedText
    | tinTaggedText
    | multiPointTaggedText
    | multiLineStringTaggedText
    | multiPolygonTaggedText
    | geometryCollectionTaggedText;

// All the various first level object
pointTaggedText             : KEYWORD_POINT              SPACE* pointText;
lineStringTaggedText        : KEYWORD_LINESTRING         SPACE* lineStringText;
polygonTaggedText           : KEYWORD_POLYGON            SPACE* polygonText;
polyhedralSurfaceTaggedText : KEYWORD_POLYHEDRALSURFACE  SPACE* polyhedralSurfaceText;
triangleTaggedText          : KEYWORD_TRIANGLE           SPACE* polygonText;
tinTaggedText               : KEYWORD_TIN                SPACE* polyhedralSurfaceText;
multiPointTaggedText        : KEYWORD_MULTIPOINT         SPACE* multiPointText;
multiLineStringTaggedText   : KEYWORD_MULTILINESTRING    SPACE* multiLineStringText;
multiPolygonTaggedText      : KEYWORD_MULTIPOLYGON       SPACE* multiPolygonText;
geometryCollectionTaggedText: KEYWORD_GEOMETRYCOLLECTION SPACE* geometryCollectionText;

// -------------------- 3D types ------------------------------
geometryTaggedTextZ: pointTaggedTextZ
    | lineStringTaggedTextZ
    | polygonTaggedTextZ
    | triangleTaggedTextZ
    | polyhedralSurfaceTaggedTextZ
    | tinTaggedTextZ
    | multiPointTaggedTextZ
    | multiLineStringTaggedTextZ
    | multiPolygonTaggedTextZ
    | geometryCollectionTaggedTextZ;

// All the various first level object
pointTaggedTextZ             : KEYWORD_POINT_Z              SPACE* pointTextZ;
lineStringTaggedTextZ        : KEYWORD_LINESTRING_Z         SPACE* lineStringTextZ;
polygonTaggedTextZ           : KEYWORD_POLYGON_Z            SPACE* polygonTextZ;
polyhedralSurfaceTaggedTextZ : KEYWORD_POLYHEDRALSURFACE_Z  SPACE* polyhedralSurfaceTextZ;
triangleTaggedTextZ          : KEYWORD_TRIANGLE_Z           SPACE* polygonTextZ;
tinTaggedTextZ               : KEYWORD_TIN_Z                SPACE* polyhedralSurfaceTextZ;
multiPointTaggedTextZ        : KEYWORD_MULTIPOINT_Z         SPACE* multiPointTextZ;
multiLineStringTaggedTextZ   : KEYWORD_MULTILINESTRING_Z    SPACE* multiLineStringTextZ;
multiPolygonTaggedTextZ      : KEYWORD_MULTIPOLYGON_Z       SPACE* multiPolygonTextZ;
geometryCollectionTaggedTextZ: KEYWORD_GEOMETRYCOLLECTION_Z SPACE* geometryCollectionTextZ;

// -------------------- 2D + M types --------------------------
geometryTaggedTextM: pointTaggedTextM
    | lineStringTaggedTextM
    | polygonTaggedTextM
    | triangleTaggedTextM
    | polyhedralSurfaceTaggedTextM
    | tinTaggedTextM
    | multiPointTaggedTextM
    | multiLineStringTaggedTextM
    | multiPolygonTaggedTextM
    | geometryCollectionTaggedTextM;

// All the various first level object
pointTaggedTextM             : KEYWORD_POINT_M              SPACE* pointTextM;
lineStringTaggedTextM        : KEYWORD_LINESTRING_M         SPACE* lineStringTextM;
polygonTaggedTextM           : KEYWORD_POLYGON_M            SPACE* polygonTextM;
polyhedralSurfaceTaggedTextM : KEYWORD_POLYHEDRALSURFACE_M  SPACE* polyhedralSurfaceTextM;
triangleTaggedTextM          : KEYWORD_TRIANGLE_M           SPACE* polygonTextM;
tinTaggedTextM               : KEYWORD_TIN_M                SPACE* polyhedralSurfaceTextM;
multiPointTaggedTextM        : KEYWORD_MULTIPOINT_M         SPACE* multiPointTextM;
multiLineStringTaggedTextM   : KEYWORD_MULTILINESTRING_M    SPACE* multiLineStringTextM;
multiPolygonTaggedTextM      : KEYWORD_MULTIPOLYGON_M       SPACE* multiPolygonTextM;
geometryCollectionTaggedTextM: KEYWORD_GEOMETRYCOLLECTION_M SPACE* geometryCollectionTextM;

// -------------------- 3D + M types --------------------------
geometryTaggedTextZM: pointTaggedTextZM
    | lineStringTaggedTextZM
    | polygonTaggedTextZM
    | triangleTaggedTextZM
    | polyhedralSurfaceTaggedTextZM
    | tinTaggedTextZM
    | multiPointTaggedTextZM
    | multiLineStringTaggedTextZM
    | multiPolygonTaggedTextZM
    | geometryCollectionTaggedTextZM;

// All the various first level object
pointTaggedTextZM             : KEYWORD_POINT_ZM              SPACE* pointTextZM;
lineStringTaggedTextZM        : KEYWORD_LINESTRING_ZM         SPACE* lineStringTextZM;
polygonTaggedTextZM           : KEYWORD_POLYGON_ZM            SPACE* polygonTextZM;
polyhedralSurfaceTaggedTextZM : KEYWORD_POLYHEDRALSURFACE_ZM  SPACE* polyhedralSurfaceTextZM;
triangleTaggedTextZM          : KEYWORD_TRIANGLE_ZM           SPACE* polygonTextZM;
tinTaggedTextZM               : KEYWORD_TIN_ZM                SPACE* polyhedralSurfaceTextZM;
multiPointTaggedTextZM        : KEYWORD_MULTIPOINT_ZM         SPACE* multiPointTextZM;
multiLineStringTaggedTextZM   : KEYWORD_MULTILINESTRING_ZM    SPACE* multiLineStringTextZM;
multiPolygonTaggedTextZM      : KEYWORD_MULTIPOLYGON_ZM       SPACE* multiPolygonTextZM;
geometryCollectionTaggedTextZM: KEYWORD_GEOMETRYCOLLECTION_ZM SPACE* geometryCollectionTextZM;


// ------------------------------------------------------------
//                      Inner data
// ------------------------------------------------------------

// -------------------- 2D types ------------------------------
// The basic types
pointText             : EMPTY_SET | ( LEFT_PAREN point RIGHT_PAREN );
lineStringText        : EMPTY_SET | ( LEFT_PAREN point              (COMMA point             )* RIGHT_PAREN );
polygonText           : EMPTY_SET | ( LEFT_PAREN SPACE* lineStringText     SPACE* (COMMA lineStringText            SPACE* )* RIGHT_PAREN );
polyhedralSurfaceText : EMPTY_SET | ( LEFT_PAREN SPACE* polygonText        SPACE* (COMMA polygonText               SPACE* )* RIGHT_PAREN );
// The multitypes
multiPointText        : EMPTY_SET | ( LEFT_PAREN SPACE* pointText          SPACE* (COMMA SPACE* pointText          SPACE* )* RIGHT_PAREN );
multiLineStringText   : EMPTY_SET | ( LEFT_PAREN SPACE* lineStringText     SPACE* (COMMA SPACE* lineStringText     SPACE* )* RIGHT_PAREN );
multiPolygonText      : EMPTY_SET | ( LEFT_PAREN SPACE* polygonText        SPACE* (COMMA SPACE* polygonText        SPACE* )* RIGHT_PAREN );
// The collection
geometryCollectionText: EMPTY_SET | ( LEFT_PAREN SPACE* geometryTaggedText SPACE* (COMMA SPACE* geometryTaggedText SPACE* )* RIGHT_PAREN );

// -------------------- 3D types ------------------------------
// The basic types
pointTextZ             : EMPTY_SET | ( LEFT_PAREN pointZ RIGHT_PAREN );
lineStringTextZ        : EMPTY_SET | ( LEFT_PAREN pointZ              (COMMA pointZ             )* RIGHT_PAREN );
polygonTextZ           : EMPTY_SET | ( LEFT_PAREN SPACE* lineStringTextZ     SPACE* (COMMA lineStringTextZ            SPACE* )* RIGHT_PAREN );
polyhedralSurfaceTextZ : EMPTY_SET | ( LEFT_PAREN SPACE* polygonTextZ        SPACE* (COMMA polygonTextZ               SPACE* )* RIGHT_PAREN );
// The multitypes
multiPointTextZ        : EMPTY_SET | ( LEFT_PAREN SPACE* pointTextZ          SPACE* (COMMA SPACE* pointTextZ          SPACE* )* RIGHT_PAREN );
multiLineStringTextZ   : EMPTY_SET | ( LEFT_PAREN SPACE* lineStringTextZ     SPACE* (COMMA SPACE* lineStringTextZ     SPACE* )* RIGHT_PAREN );
multiPolygonTextZ      : EMPTY_SET | ( LEFT_PAREN SPACE* polygonTextZ        SPACE* (COMMA SPACE* polygonTextZ        SPACE* )* RIGHT_PAREN );
// The collection
geometryCollectionTextZ: EMPTY_SET | ( LEFT_PAREN SPACE* geometryTaggedTextZ SPACE* (COMMA SPACE* geometryTaggedTextZ SPACE* )* RIGHT_PAREN );

// -------------------- 2D + M types --------------------------
// The basic types
pointTextM             : EMPTY_SET | ( LEFT_PAREN pointM RIGHT_PAREN );
lineStringTextM        : EMPTY_SET | ( LEFT_PAREN pointM              (COMMA pointM             )* RIGHT_PAREN );
polygonTextM           : EMPTY_SET | ( LEFT_PAREN SPACE* lineStringTextM     SPACE* (COMMA lineStringTextM            SPACE* )* RIGHT_PAREN );
polyhedralSurfaceTextM : EMPTY_SET | ( LEFT_PAREN SPACE* polygonTextM        SPACE* (COMMA polygonTextM               SPACE* )* RIGHT_PAREN );
// The multitypes
multiPointTextM        : EMPTY_SET | ( LEFT_PAREN SPACE* pointTextM          SPACE* (COMMA SPACE* pointTextM          SPACE* )* RIGHT_PAREN );
multiLineStringTextM   : EMPTY_SET | ( LEFT_PAREN SPACE* lineStringTextM     SPACE* (COMMA SPACE* lineStringTextM     SPACE* )* RIGHT_PAREN );
multiPolygonTextM      : EMPTY_SET | ( LEFT_PAREN SPACE* polygonTextM        SPACE* (COMMA SPACE* polygonTextM        SPACE* )* RIGHT_PAREN );
// The collection
geometryCollectionTextM: EMPTY_SET | ( LEFT_PAREN SPACE* geometryTaggedTextM SPACE* (COMMA SPACE* geometryTaggedTextM SPACE* )* RIGHT_PAREN );


// -------------------- 3D + M types --------------------------
// The basic types
pointTextZM             : EMPTY_SET | ( LEFT_PAREN pointZM RIGHT_PAREN );
lineStringTextZM        : EMPTY_SET | ( LEFT_PAREN pointZM              (COMMA pointZM             )* RIGHT_PAREN );
polygonTextZM           : EMPTY_SET | ( LEFT_PAREN SPACE* lineStringTextZM     SPACE* (COMMA lineStringTextZM            SPACE* )* RIGHT_PAREN );
polyhedralSurfaceTextZM : EMPTY_SET | ( LEFT_PAREN SPACE* polygonTextZM        SPACE* (COMMA polygonTextZM               SPACE* )* RIGHT_PAREN );
// The multitypes
multiPointTextZM        : EMPTY_SET | ( LEFT_PAREN SPACE* pointTextZM          SPACE* (COMMA SPACE* pointTextZM          SPACE* )* RIGHT_PAREN );
multiLineStringTextZM   : EMPTY_SET | ( LEFT_PAREN SPACE* lineStringTextZM     SPACE* (COMMA SPACE* lineStringTextZM     SPACE* )* RIGHT_PAREN );
multiPolygonTextZM      : EMPTY_SET | ( LEFT_PAREN SPACE* polygonTextZM        SPACE* (COMMA SPACE* polygonTextZM        SPACE* )* RIGHT_PAREN );
// The collection
geometryCollectionTextZM: EMPTY_SET | ( LEFT_PAREN SPACE* geometryTaggedTextZM SPACE* (COMMA SPACE* geometryTaggedTextZM SPACE* )* RIGHT_PAREN );



// ------------------------------------------------------------
//                   Basic objects
// ------------------------------------------------------------
point  : SPACE* x SPACE+ y SPACE* ;
pointZ : SPACE* x SPACE+ y SPACE+ z SPACE* ;
pointM : SPACE* x SPACE+ y SPACE+ m SPACE* ;
pointZM: SPACE* x SPACE+ y SPACE+ z SPACE+ m SPACE* ;
x: SIGNED_NUMERIC_LITTERAL;
y: SIGNED_NUMERIC_LITTERAL;
z: SIGNED_NUMERIC_LITTERAL;
m: SIGNED_NUMERIC_LITTERAL;

// =================================================================
//                        LEXEMES
// =================================================================

// Constants strings
EMPTY_SET                  : E M P T Y;
KEYWORD_POINT              : P O I N T;
KEYWORD_LINESTRING         : L I N E S T R I N G;
KEYWORD_POLYGON            : P O L Y G O N;
KEYWORD_POLYHEDRALSURFACE  : P O L Y H E D R A L S U R F A C E;
KEYWORD_TRIANGLE           : T R I A N G L E;
KEYWORD_TIN                : T I N;
KEYWORD_MULTIPOINT         : M U L T I P O I N T;
KEYWORD_MULTILINESTRING    : M U L T I L I N E S T R I N G;
KEYWORD_MULTIPOLYGON       : M U L T I P O L Y G O N;
KEYWORD_GEOMETRYCOLLECTION : G E O M E T R Y C O L L E C T I O N;

// Constants strings
EMPTY_SET_Z                  : E M P T Y SPACE+ Z;
KEYWORD_POINT_Z              : P O I N T SPACE+ Z;
KEYWORD_LINESTRING_Z         : L I N E S T R I N G SPACE+ Z;
KEYWORD_POLYGON_Z            : P O L Y G O N SPACE+ Z;
KEYWORD_POLYHEDRALSURFACE_Z  : P O L Y H E D R A L S U R F A C E SPACE+ Z;
KEYWORD_TRIANGLE_Z           : T R I A N G L E SPACE+ Z;
KEYWORD_TIN_Z                : T I N SPACE+ Z;
KEYWORD_MULTIPOINT_Z         : M U L T I P O I N T SPACE+ Z;
KEYWORD_MULTILINESTRING_Z    : M U L T I L I N E S T R I N G SPACE+ Z;
KEYWORD_MULTIPOLYGON_Z       : M U L T I P O L Y G O N SPACE+ Z;
KEYWORD_GEOMETRYCOLLECTION_Z : G E O M E T R Y C O L L E C T I O N SPACE+ Z;

// Constants strings
EMPTY_SET_M                  : E M P T Y SPACE+ M;
KEYWORD_POINT_M              : P O I N T SPACE+ M;
KEYWORD_LINESTRING_M         : L I N E S T R I N G SPACE+ M;
KEYWORD_POLYGON_M            : P O L Y G O N SPACE+ M;
KEYWORD_POLYHEDRALSURFACE_M  : P O L Y H E D R A L S U R F A C E SPACE+ M;
KEYWORD_TRIANGLE_M           : T R I A N G L E SPACE+ M;
KEYWORD_TIN_M                : T I N SPACE+ M;
KEYWORD_MULTIPOINT_M         : M U L T I P O I N T SPACE+ M;
KEYWORD_MULTILINESTRING_M    : M U L T I L I N E S T R I N G SPACE+ M;
KEYWORD_MULTIPOLYGON_M       : M U L T I P O L Y G O N SPACE+ M;
KEYWORD_GEOMETRYCOLLECTION_M : G E O M E T R Y C O L L E C T I O N SPACE+ M;

// Constants strings
EMPTY_SET_ZM                  : E M P T Y SPACE+ Z M;
KEYWORD_POINT_ZM              : P O I N T SPACE+ Z M;
KEYWORD_LINESTRING_ZM         : L I N E S T R I N G SPACE+ Z M;
KEYWORD_POLYGON_ZM            : P O L Y G O N SPACE+ Z M;
KEYWORD_POLYHEDRALSURFACE_ZM  : P O L Y H E D R A L S U R F A C E SPACE+ Z M;
KEYWORD_TRIANGLE_ZM           : T R I A N G L E SPACE+ Z M;
KEYWORD_TIN_ZM                : T I N SPACE+ Z M;
KEYWORD_MULTIPOINT_ZM         : M U L T I P O I N T SPACE+ Z M;
KEYWORD_MULTILINESTRING_ZM    : M U L T I L I N E S T R I N G SPACE+ Z M;
KEYWORD_MULTIPOLYGON_ZM       : M U L T I P O L Y G O N SPACE+ Z M;
KEYWORD_GEOMETRYCOLLECTION_ZM : G E O M E T R Y C O L L E C T I O N SPACE+ Z M;



// Common separator
COMMA       : ',' ;
LEFT_PAREN  : '(' ;
RIGHT_PAREN : ')' ;
SPACE       : [ \r\n\t] ;

// Numeric values, the lengthier, the better
SIGNED_NUMERIC_LITTERAL      : (SIGN)? UNSIGNED_NUMERIC_LITTERAL ;
UNSIGNED_NUMERIC_LITTERAL    : EXACT_NUMERIC_LITTERAL | APPROXIMATE_NUMERIC_LITTERAL ;
APPROXIMATE_NUMERIC_LITTERAL : MANTISSA 'E' EXPONENT ;
MANTISSA                     : EXACT_NUMERIC_LITTERAL ;
EXPONENT                     : SIGNED_INTEGER ;
EXACT_NUMERIC_LITTERAL       : UNSIGNED_INTEGER(DECIMAL_POINT (UNSIGNED_INTEGER)?)? | DECIMAL_POINT UNSIGNED_INTEGER;
SIGNED_INTEGER               : (SIGN)? UNSIGNED_INTEGER ;
UNSIGNED_INTEGER             : (DIGIT)+ ;

// A simple string
QUOTTED_NAME : DOUBLE_QUOTE NAME DOUBLE_QUOTE;

// =================================================================
//                        FRAGMENTS
// =================================================================

// Base characters
fragment A          : ('A'|'a') ;
fragment B          : ('B'|'b') ;
fragment C          : ('C'|'c') ;
fragment D          : ('D'|'d') ;
fragment E          : ('E'|'e') ;
fragment F          : ('F'|'f') ;
fragment G          : ('G'|'g') ;
fragment H          : ('H'|'h') ;
fragment I          : ('I'|'i') ;
fragment J          : ('J'|'j') ;
fragment K          : ('K'|'k') ;
fragment L          : ('L'|'l') ;
fragment M          : ('M'|'m') ;
fragment N          : ('N'|'n') ;
fragment O          : ('O'|'o') ;
fragment P          : ('P'|'p') ;
fragment Q          : ('Q'|'q') ;
fragment R          : ('R'|'r') ;
fragment S          : ('S'|'s') ;
fragment T          : ('T'|'t') ;
fragment U          : ('U'|'u') ;
fragment V          : ('V'|'v') ;
fragment W          : ('W'|'w') ;
fragment X          : ('X'|'x') ;
fragment Y          : ('Y'|'y') ;
fragment Z          : ('Z'|'z') ;

// Character groups
fragment DIGIT                          : [0-9] ;
fragment SIMPLE_LATIN_UPPER_CASE_LETTER : [A-Z] ;
fragment SIMPLE_LATIN_LOWER_CASE_LETTER : [a-z] ;
fragment SIGN                           : PLUS_SIGN | MINUS_SIGN ;
fragment DECIMAL_POINT                  : PERIOD;
fragment LETTER                         : SIMPLE_LATIN_LETTER | DIGIT | SPECIAL;
fragment SIMPLE_LATIN_LETTER            : SIMPLE_LATIN_UPPER_CASE_LETTER|SIMPLE_LATIN_LOWER_CASE_LETTER;
fragment SPECIAL                        : RIGHT_PAREN | LEFT_PAREN | MINUS_SIGN | UNDERSCORE | PERIOD | QUOTE | SPACE;

// Basic chars
fragment MINUS_SIGN      : '-' ;
fragment LEFT_BRACKET    : '[' ;
fragment RIGHT_BRACKET   : ']' ;
fragment PERIOD          : '.' ;
fragment PLUS_SIGN       : '+' ;
fragment DOUBLE_QUOTE    : '"' ;
fragment QUOTE           : '\'' ;
fragment UNDERSCORE      : '_' ;
fragment NAME            : LETTERS;
fragment LETTERS         : LETTER+;



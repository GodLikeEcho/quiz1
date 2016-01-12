%{
//**************************************
// lang.l
//
// Scanner definition file for CST 320 project
//
// Author: Phil Howard 
// phil.howard@oit.edu
//
// Date: Nov. 23, 2015
//

#include "tokens.h"

#define DO_RETURN(a) return (a)
//#define DO_RETURN(a) return Return(a)
int Return(int val);

%}

%option noyywrap
%option noinput
%option nounput
%option yylineno


    /* definitions go here. period is an example. */


%%

    // token definitions go here. "if" is an example.
"stuff"                     DO_RETURN(STUFF);
"other"                     DO_RETURN(OTHER);
[ab][ab]*                   DO_RETURN(BLOB1);
[ba]*[0-9]*                 DO_RETURN(BLOB2);
[ \t\r\n]                   {};
.                           DO_RETURN(JUNK);


%%

// This function allows us to do extra processing on each token
int Return(int val)
{
    printf("Scanned '%s': %d\n", yytext, val);
    return val;
}
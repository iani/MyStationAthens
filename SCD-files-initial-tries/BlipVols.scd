//:
8 do: { | i | 1.2 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | i + 1 * 0.1 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | i + 1 * 0.05 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | 0.80 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | 0.60 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | 0.30 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | 0.20 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | 0.010 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | 0.1 +>.vol format ("b%", i).asSymbol };
//:
8 do: { | i | 1 * i +>.pos format ("b%", i).asSymbol };
//:
8 do: { | i | 1.2 +>.width format ("b%", i).asSymbol };
//:
8 do: { | i | 0 +>.width format ("b%", i).asSymbol };
//:
8 do: { | i | 0.1 +>.width format ("b%", i).asSymbol };
//:
8 do: { | i | 0.2 +>.width format ("b%", i).asSymbol };
//:
8 do: { | i | 0 rrand: 1.0 +>.width format ("b%", i).asSymbol };
//: Randomize positions 
8 do: { | i | -1 rrand: 1 +>.pos format ("b%", i).asSymbol };

//:
0.1 +>.vol \b0;
0.1 +>.pos \b0;
0.1 +>.width \b0;

1.0 +>.width \b0;
//:
0.1 +>.vol \b1;
0.1 +>.pos \b1;
0.1 +>.width \b1;
1 +>.width \b1;


//:
0.1 +>.vol \b2;
0.1 +>.pos \b2;
0.1 +>.width \b2;
1 +>.width \b2;
//:
0.1 +>.vol \b3;
0.1 +>.pos \b3;
0.1 +>.width \b3;
1 +>.width \b3;
//:
0.1 +>.vol \b4;
0.1 +>.pos \b4;
0.1 +>.width \b4;
1 +>.width \b4;
//:
0.1 +>.vol \b5;
0.1 +>.pos \b5;
0.1 +>.width \b5;
1 +>.width \b5;
//:
0.1 +>.vol \b6;
0.1 +>.pos \b6;
0.1 +>.width \b6;
1 +>.width \b6;
//:
0.1 +>.vol \b7;
0.1 +>.pos \b7;
0.1 +>.width \b7;
1 +>.width \b7;
//:
0.1 +>.vol \b0;
0.1 +>.pos \b0;
0.1 +>.width \b0;
1 +>.width \b0;
//:
0.1 +>.vol \b1;
0.1 +>.pos \b1;
0.1 +>.width \b1;
1 +>.width \b1;
//:
0.1 +>.vol \b2;
0.1 +>.pos \b2;
0.1 +>.width \b2;
1 +>.width \b2;
//:
0.1 +>.vol \b3;
0.1 +>.pos \b3;
0.1 +>.width \b3;
1 +>.width \b3;
//:
0.1 +>.vol \b4;
0.1 +>.pos \b4;
0.1 +>.width \b4;
1 +>.width \b4;
//:
0.1 +>.vol \b5;
0.1 +>.pos \b5;
0.1 +>.width \b5;
1 +>.width \b5;
//:

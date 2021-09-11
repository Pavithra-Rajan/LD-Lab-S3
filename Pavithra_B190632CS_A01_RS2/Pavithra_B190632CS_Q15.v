module mux_4way_16(O,S1,S2,I1,I2,I3,I4);
 	output [15:0]O;
 	input [15:0]I1,I2,I3,I4;
 	input S1,S2;
 	wire [15:0]x,y;
 	mux m1 [15:0] (x,S1,I1,I2);
 	mux m2 [15:0] (y,S1,I3,I4);
 	mux m3 [15:0] (O,S2,x,y);
endmodule

module mux(O,S,I1,I2);
  input S,I1,I2;
  output O;
  wire x,y,z;
  and_gate and1(S,I2,x);
  not_gate or1(S,y);
  and_gate a3(y,I1,z);
  or_gate a4(x,z,O);
endmodule

module and_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W;
	nand(W,I1,I2);
        nand(O,W,W);
endmodule

module or_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W1,W2;
	nand(W1,I1,I1);
        nand(W2,I2,I2);
        nand(W2,I2,I2);
	nand(O,W1,W2);
endmodule

module not_gate(I,O);
	input I;
	output O;
	nand(O,I,I);
endmodule

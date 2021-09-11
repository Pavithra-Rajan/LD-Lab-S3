
module circuitI(OUTPUT,INPUT_A,INPUT_B,S);

	output [15:0] OUTPUT;

	input [15:0] INPUT_A,INPUT_B;
	input [1:0]S;
	wire [15:0]xo,ao,no,oro,no2,xno;
	xor_16_gate x1(INPUT_A,INPUT_B,xo);
	and_16_gate a1(INPUT_A,INPUT_B,ao);
	nor_gate n16[15:0](xo,ao,no);
	or_16_gate o16(INPUT_A,INPUT_B,oro);
	nor_gate n161[15:0](INPUT_A,INPUT_B,no2);
	xnor_gate xn[15:0](oro,no2,xno);
	mux_4way_16 m416(OUTPUT,S[0],S[1],xo,no,oro,xno);
endmodule 
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
module xnor_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W1,W2;
	and_gate and1(
          .I1 (I1),
	  .I2 (I2),
	  .O (W1)
	  );
	nor_gate nor1(
          .I1 (I1),
	  .I2 (I2),
	  .O (W2)
	  );
        or_gate or1(
          .I1 (W1),
	  .I2 (W2),
	  .O (O)
	  );
        
endmodule
module or_16_gate(I1,I2,O);
	input [15:0]I1,I2;
	output [15:0]O;
	or_gate or1[15:0](
		.I1(I1),
		.I2(I2),
		.O(O)
		);
endmodule
module xor_16_gate(I1,I2,O);
	input [15:0]I1,I2;
	output [15:0]O;
	xor_gate or1[15:0](
		.I1(I1),
		.I2(I2),
		.O(O)
		);
endmodule

module nor_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W1,W2,W3;
	nand(W1,I1,I1);
        nand(W2,I2,I2);
        nand(W2,I2,I2);
	nand(W3,W1,W2);
        nand(O,W3,W3);
endmodule

module and_16_gate(I1,I2,O);
	input [15:0]I1,I2;
	output [15:0]O;
	and_gate and1[15:0](
		.I1(I1),
		.I2(I2),
		.O(O)
		);
endmodule
module xor_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W1,W2;
	or_gate or1(
          .I1 (I1),
	  .I2 (I2),
	  .O (W1)
	  );
        nand(W2,I1,I2);
        and_gate and1(
          .I1 (W1),
	  .I2 (W2),
	  .O (O)
	  );
        
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

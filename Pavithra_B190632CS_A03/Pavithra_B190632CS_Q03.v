
module not_gate(I,O);
	input I;
	output O;
	nand(O,I,I);
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
module and_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W;
	nand(W,I1,I2);
        nand(O,W,W);
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

module D_LATCH(D,C,Q,Qnot);
	output Q,Qnot ;
	input D,C ;
	wire S,R,S_C,R_C ;

	and_gate a1(D,D,S) ;
	not_gate n1(D,R) ;
	nand nan1(S_C,C,S) ;
	nand nan2(R_C,C,R) ;
	nand nan3(Q,Qnot,S_C) ;
	nand nan4(Qnot,Q,R_C) ;
endmodule
module D_FLIP_FLOP(D,C,Q,Qnot);
	input D,C;
	output Q,Qnot;
	wire C_not,Q_not1,Q1;
	not_gate n1(C,C_not);
	D_LATCH D1(D,C_not,Q1,Q_not1);
	D_LATCH D2(Q1,C,Q,Qnot);
endmodule
module BIN_CELL(O,D,R,W,CS,CLK);
	input D,R,W,CS,CLK;
	output O;
	wire WCS,Q,Qnot,mux_o,RCS;
	and_gate an1(W,CS,WCS);
	and_gate an2(R,CS,RCS);
	mux m1(mux_o,WCS,Q,D);
	D_FLIP_FLOP dff(D,CLK,Q,Qnot);
	mux mux2(O,RCS,1'bx,Q);
endmodule
module REG_16(O,D,R,W,CS,CLK);
	input [15:0]D;
	input R,W,CS,CLK;
	
	output [15:0]O;
	BIN_CELL B[15:0](O,D,R,W,CS,CLK);
endmodule

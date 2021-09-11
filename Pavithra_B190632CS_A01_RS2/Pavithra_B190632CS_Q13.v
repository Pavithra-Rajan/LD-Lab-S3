module demux(O1,O2,S,I);
	output O1,O2;
	input S,I;
	wire x;
	not_gate n1(S,x);
	and_gate and1(x,I,O1);
	and_gate and2(S,I,O2);
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
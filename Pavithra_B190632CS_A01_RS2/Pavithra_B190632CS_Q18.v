module demux_8(O1,O2,O3,O4,O5,O6,O7,O8,S1,S2,S3,I);
	output O1,O2,O3,O4,O5,O6,O7,O8;
	input I,S1,S2,S3;
	wire x,y;
	demux dm1(x,y,S3,I);
	demux_4 dm2(S1,S2,x,O1,O2,O3,O4);
	demux_4 dm3(S1,S2,y,O5,O6,O7,O8);
endmodule
module demux(O1,O2,S,I);
	output O1,O2;
	input S,I;
	wire x;
	not_gate n1(S,x);
	and_gate and1(x,I,O1);
	and_gate and2(S,I,O2);
endmodule
module demux_4(S1,S2,I,O1,O2,O3,O4);
	input S1,S2,I;
	output O1,O2,O3,O4;
	wire x,y,a,b,c,d;
	not_gate not1(S1,x);
	not_gate not2(S2,y);
	and_gate and1(x,y,a);
	and_gate and2(y,S1,b);
	and_gate and3(S2,x,c);
	and_gate and4(S1,S2,d);
	and_gate and5(a,I,O1);
	and_gate and6(b,I,O2);
	and_gate and7(c,I,O3);
	and_gate and8(d,I,O4);
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


module or_8_gate(I0,I1,I2,I3,I4,I5,I6,I7,O);
	input I0,I1,I2,I3,I4,I5,I6,I7;
	output O;
        wire w,x,y,z,a,b;
	or_gate or1 (
		.I1(I0),
		.I2(I1),
		.O(w)
		);
	or_gate or2 (
		.I1(I2),
		.I2(I3),
		.O(x)
		);
	or_gate or3 (
		.I1(I4),
		.I2(I5),
		.O(y)
		);
	or_gate or4 (
		.I1(I6),
		.I2(I7),
		.O(z)
		);
	or_gate or5 (
		.I1(w),
		.I2(x),
		.O(a)
		);
	or_gate or6 (
		.I1(y),
		.I2(z),
		.O(b)
		);
	or_gate or7 (
		.I1(a),
		.I2(b),
		.O(O)
		);
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

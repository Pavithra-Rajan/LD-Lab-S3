
module or_16_gate(I1,I2,O);
	input [15:0]I1,I2;
	output [15:0]O;
	or_gate or1[15:0](
		.I1(I1),
		.I2(I2),
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

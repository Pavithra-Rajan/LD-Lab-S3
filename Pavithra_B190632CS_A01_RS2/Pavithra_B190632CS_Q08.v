
module and_16_gate(I1,I2,O);
	input [15:0]I1,I2;
	output [15:0]O;
	and_gate and1[15:0](
		.I1(I1),
		.I2(I2),
		.O(O)
		);
endmodule
module and_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W;
	nand(W,I1,I2);
        nand(O,W,W);
endmodule

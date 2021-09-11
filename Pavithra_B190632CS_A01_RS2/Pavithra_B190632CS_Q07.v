
module not_16_gate(I,O);
	input [15:0]I;
	output [15:0]O;
	nand nand1[15:0](O,I,I);
endmodule

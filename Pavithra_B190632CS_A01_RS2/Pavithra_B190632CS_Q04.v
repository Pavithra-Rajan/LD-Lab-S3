
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

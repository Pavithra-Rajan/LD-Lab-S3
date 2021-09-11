
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

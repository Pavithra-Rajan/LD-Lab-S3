module full_adder(s,c,a,b,cin);
output s,c;
input a,b,cin;
wire s1,c1,c2;
half_adder HA1(s1,c1,a,b);
half_adder HA2(s,c2,s1,cin);
or_gate or1(c1,c2,c);

endmodule
module half_adder(s,c,a,b);
output s,c;
input a,b;
xor_gate xor1(a,b,s);
and_gate and1(a,b,c);

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
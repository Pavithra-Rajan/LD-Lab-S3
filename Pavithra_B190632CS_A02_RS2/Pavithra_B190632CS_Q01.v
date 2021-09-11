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
	or_gate or1(I1,I2,W1);
       
        nand(W2,I1,I2);
        and_gate and1(W1,W2,O);
endmodule
module and_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W;
	nand(W,I1,I2);
        nand(O,W,W);
endmodule

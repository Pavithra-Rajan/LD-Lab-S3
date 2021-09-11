module adder_4bit(s,c,a,b,cin);
output[3:0] s,c;
input[3:0] a,b;
input cin;
full_adder FA1(s[0],c[0],a[0],b[0],cin);
full_adder FA2(s[1],c[1],a[1],b[1],c[0]);
full_adder FA3(s[2],c[2],a[2],b[2],c[1]);
full_adder FA4(s[3],c[3],a[3],b[3],c[2]);
endmodule
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

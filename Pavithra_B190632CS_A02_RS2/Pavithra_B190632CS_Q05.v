module adder_16bit(s,c,a,b,cin);
output[15:0] s,c;
input[15:0] a,b;
input cin;
full_adder FA1(s[0],c[0],a[0],b[0],cin);
full_adder FA2(s[1],c[1],a[1],b[1],c[0]);
full_adder FA3(s[2],c[2],a[2],b[2],c[1]);
full_adder FA4(s[3],c[3],a[3],b[3],c[2]);

full_adder FA5(s[4],c[4],a[4],b[4],c[3]);
full_adder FA6(s[5],c[5],a[5],b[5],c[4]);
full_adder FA7(s[6],c[6],a[6],b[6],c[5]);
full_adder FA8(s[7],c[7],a[7],b[7],c[6]);

full_adder FA9(s[8],c[8],a[8],b[8],c[7]);
full_adder FA10(s[9],c[9],a[9],b[9],c[8]);
full_adder FA11(s[10],c[10],a[10],b[10],c[9]);
full_adder FA12(s[11],c[11],a[11],b[11],c[10]);

full_adder FA13(s[12],c[12],a[12],b[12],c[11]);
full_adder FA14(s[13],c[13],a[13],b[13],c[12]);
full_adder FA15(s[14],c[14],a[14],b[14],c[13]);
full_adder FA16(s[15],c[15],a[15],b[15],c[14]);
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

module full_adder_tb;
wire c,s;
reg a,b,cin;
reg[2:0] count;
integer i;
full_adder FA1(s,c,a,b,cin);
initial
	begin
		$monitor("a=%b,b=%b,cin=%b,s=%b,c=%b",a,b,cin,s,c);
		for(i = 0; i < 8; i = i+1)
			begin
			count = i;
			#50 a = count[2];b = count[1];cin = count[0];
			end
	end
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
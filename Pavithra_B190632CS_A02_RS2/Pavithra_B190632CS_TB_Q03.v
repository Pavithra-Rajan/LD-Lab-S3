module incrementer_4bit_TB;

wire[3:0]c,s;
reg[3:0]a;

integer i;

incrementer_4bit incrementer_4bit1(s,c,a);

initial 
begin
	$monitor ("a = %b, s = %b, c = %b",a,s,c[3]);

	for(i=0;i<16;i=i+1)
		begin
		#10	a = i;
		end
end
endmodule
module incrementer_4bit(s,c,a);

output[3:0]s,c;
input[3:0]a;
half_adder half_adder1(s[0],c[0],a[0],1);
half_adder half_adder2(s[1],c[1],a[1],c[0]);
half_adder half_adder3(s[2],c[2],a[2],c[1]);
half_adder half_adder4(s[3],c[3],a[3],c[2]);

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

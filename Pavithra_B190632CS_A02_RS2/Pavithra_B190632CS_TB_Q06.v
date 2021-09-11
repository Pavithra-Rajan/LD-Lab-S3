
module incrementer_16bit_TB;

wire[15:0]c,s;
reg[15:0]a;

integer i;

incrementer_16bit incrementer_16bit1(c,s,a);

initial 
begin
	$monitor ("a = %b, s = %b, c = %b",a,s,c[15]);

	for(i=0;i<=255;i=i+1)
		begin
		#10	a = i;
		end
end
endmodule
module incrementer_16bit(c,s,a);

output[15:0]s,c;
input[15:0]a;
half_adder HA1(s[0],c[0],a[0],1);
half_adder HA2(s[1],c[1],a[1],c[0]);
half_adder HA3(s[2],c[2],a[2],c[1]);
half_adder HA4(s[3],c[3],a[3],c[2]);

half_adder HA5(s[4],c[4],a[4],c[3]);
half_adder HA6(s[5],c[5],a[5],c[4]);
half_adder HA7(s[6],c[6],a[6],c[5]);
half_adder HA8(s[7],c[7],a[7],c[6]);

half_adder HA9(s[8],c[8],a[8],c[7]);
half_adder HA10(s[9],c[9],a[9],c[8]);
half_adder HA11(s[10],c[10],a[10],c[9]);
half_adder HA12(s[11],c[11],a[11],c[10]);

half_adder HA13(s[12],c[12],a[12],c[11]);
half_adder HA14(s[13],c[13],a[13],c[12]);
half_adder HA15(s[14],c[14],a[14],c[13]);
half_adder HA16(s[15],c[15],a[15],c[14]);

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

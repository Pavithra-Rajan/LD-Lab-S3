
module xor_16_test;
	wire [15:0] O;
	reg [15:0] I1,I2;
	integer i,j;
	xor_16_gate xor16(I1,I2,O);
	always
	begin
		for(i=0;i<=65535;i=i+1)
			for(j=0;j<=65535;j=j+1)
			begin
				#10 I1=i; I2=j;
			end
	end
endmodule

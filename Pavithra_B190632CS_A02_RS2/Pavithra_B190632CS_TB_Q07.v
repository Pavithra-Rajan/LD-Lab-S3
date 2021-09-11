module negator_16_test;
	reg [15:0]I;
	wire [15:0]O;
	negator_16 n(I,O);
        integer i;
	initial
		begin
		i=0;
		while(i<=65535)
		begin		
			I=i;
			#10 i=i+1;
		end
	end
endmodule
module negator_16(I,O);
	input [15:0]I;
	output [15:0]O;
	nand nand1[15:0](O,I,I);
endmodule
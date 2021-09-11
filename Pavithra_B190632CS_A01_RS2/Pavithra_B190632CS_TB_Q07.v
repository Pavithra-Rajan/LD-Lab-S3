
module not_gate_16_test;
	reg [15:0]I;
	wire [15:0]O;
	not_16_gate n(I,O);
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

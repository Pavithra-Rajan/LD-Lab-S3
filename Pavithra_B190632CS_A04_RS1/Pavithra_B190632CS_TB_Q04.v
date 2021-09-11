
module div_test;
	reg [15:0] dividend,divisor;
	wire [15:0] O;
	reg CLK;
	div d_test(O,dividend,divisor,CLK);
	always
		begin 
		#5 CLK=~CLK;
		end
	initial 
		begin
			CLK=1'b0;
			$monitor("OUTPUT=%d ,DIVIDEND=%d ,DIVISOR=%d, Clk=%b",O,dividend,divisor,CLK);
			#10 dividend=12; divisor=10;
			#10 dividend=105; divisor=11;
			#10 dividend=31; divisor=5;
			#10 dividend=10; divisor=81;
			#10 dividend=15; divisor=20;
			
		end
endmodule
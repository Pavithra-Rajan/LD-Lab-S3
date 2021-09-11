module mult_test;
	reg [15:0] M,Q;
	wire [31:0] O;
	reg CLK;
	mult m_test(O,M,Q,CLK);
	always
		begin 
		#5 CLK=~CLK;
		end
	initial 
		begin
			CLK=1'b0;
			$monitor("OUTPUT=%d ,MULTIPLICANT=%d ,MULTIPLIER=%d, Clk=%b",O,M,Q,CLK);
			#10 M=12; Q=10;
			#10 M=105; Q=11;
			#10 M=31; Q=5;
			#10 M=10; Q=81;
			#10 M=15; Q=20;
			
		end
endmodule

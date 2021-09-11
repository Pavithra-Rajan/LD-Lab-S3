module REMAINDER_test;
	reg [15:0] X,Y;
	wire [15:0] O;
	reg CLK;
	REMAINDER rem_test(O,X,Y,CLK);
	always
		begin 
		#5 CLK=~CLK;
		end
	initial 
		begin
			CLK=1'b0;
			$monitor("OUTPUT=%d ,X=%d ,Y=%d, CLK=%b",O,X,Y,CLK);
			#10 X=12; Y=10;
			#10 X=105; Y=11;
			#10 X=31; Y=5;
			#10 X=100; Y=81;
			#10 X=35; Y=20;
			
		end
endmodule

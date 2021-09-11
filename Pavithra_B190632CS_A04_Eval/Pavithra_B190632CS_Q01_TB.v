
module circuitIV_IV_test;
	wire [23:0] X;
	reg [23:0] U,V,W;
	reg operation;
	
	

	circuitIV_IV ctest(X,U,V,W,operation);
	
	always
		begin
		$monitor(" OP=%b, U=%b, V=%b, W=%b, address=%b ",X,U,V,W,operation);
		
			#10 U=2; V=4; W=5; operation=0;
			#10 U=2; V=4; W=5; operation=1;
			
		end
endmodule

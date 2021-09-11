
module circuit_I_test_1 ;

	wire[15:0] OUTPUT;
	reg[15:0] INPUT_A,INPUT_B;
	reg[1:0]S;
	integer i,j;
 	circuitI test1(OUTPUT,INPUT_A,INPUT_B,S) ;

		
	initial
		begin
		$monitor("S0=%b,S1=%b,INPUT_A=%b,INPUT_B=%b,OUTPUT=%b",S[0],S[1],INPUT_A,INPUT_B,OUTPUT);
		INPUT_A=12;
		INPUT_B=13;
		for(i=0;i<=1;i=i+1)
			for(j=0;j<=1;j=j+1)
			begin
				#10	S[0] = i;S[1]=j;
			end
		end
endmodule

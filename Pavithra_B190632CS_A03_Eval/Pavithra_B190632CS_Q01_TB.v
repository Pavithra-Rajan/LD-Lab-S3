
module RAM_4K_TEST_24_bit;
	wire [23:0] Dout;
	reg [11:0] Address;
	reg Write_Enable;
	reg [23:0] Din;
	reg RE,clk;
	

	RAM_24_bit_4096_locations ramtest(Dout,Address,Write_Enable,Din,RE,clk);
	
	always
		begin
		$monitor(" OP=%b, Din=%b, clk=%b, write=%b, address=%b ",Dout,Din,clk,Write_Enable,Address);
		
			#10 Din=64;clk=1;Write_Enable=1;Address=545;RE=0;
			#10 Din=0;clk=1;Write_Enable=0;Address=545;RE=1;
			#10 Din=78;clk=1;Write_Enable=1;Address=721;RE=1;
			#10 Din=0;clk=1;Write_Enable=0;Address=721;RE=1;
			
		end
endmodule

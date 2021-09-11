module mux_16_test;
 	wire [15:0]O;
 	reg [15:0]I1,I2;
 	reg S;
 	integer i,j,k;
 	mux_16 m1(O,S,I1,I2);
 initial
  begin
    for(i=0;i<=65535;i=i+1)
      for(j=0;j<=65535;j=j+1)
        for(k=0;k<=1;k=k+1)
        begin
	  S=k;
          I1=i;
          I2=j;
          #10;

        end
    end
endmodule
	 	

module mux_test;
 wire O;
 reg I1,I2,S;
 integer i,j,k;
 mux mux1(O,S,I1,I2);
 initial
  begin  
    for(i=0;i<=1;i=i+1)
      for(j=0;j<=1;j=j+1)
        for(k=0;k<=1;k=k+1)
        begin
	  S=i;
          I1=j;
	  I2=k;
          #10;
      end
  end
endmodule

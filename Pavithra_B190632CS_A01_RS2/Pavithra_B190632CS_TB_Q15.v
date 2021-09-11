
module mux_4way_test;
 wire [15:0]O;
 reg [15:0]I1,I2,I3,I4;
 reg S1,S2;
 integer i,j,k,l,m,n;
 mux_4way_16 m1(O,S1,S2,I1,I2,I3,I4);
 initial
  begin
    for(i=0;i<=65535;i=i+1)
      for(j=0;j<=65535;j=j+1)
        for(k=0;k<=65535;k=k+1)
	 for(l=0;l<=65535;l=l+1)
	  for(m=0;m<=1;m=m+1)
           for(n=0;n<=1;n=n+1)
            begin
	  S1=n;
          S2=m;
          I1=i;
          I2=j;
 	  I3=k;
	  I4=l;
          #10;
        end
    end
endmodule

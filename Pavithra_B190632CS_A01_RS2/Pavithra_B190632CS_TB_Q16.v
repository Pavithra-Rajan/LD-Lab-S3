
module mux_8way_test;
 wire [15:0]O;
 reg [15:0]I1,I2,I3,I4,I5,I6,I7,I8;
 reg S1,S2,S3;
 integer i,j,k,l,m,n,o,p,q,r,s;
 mux_8way_16 m1(O,S1,S2,S3,I1,I2,I3,I4,I5,I6,I7,I8);
 initial
  begin
    for(i=0;i<=65535;i=i+1)
      for(j=0;j<=65535;j=j+1)
        for(k=0;k<=65535;k=k+1)
	 for(l=0;l<=65535;l=l+1)
	  for(o=0;o<=65535;o=o+1)
	   for(p=0;p<=65535;p=p+1)
            for(q=0;q<=65535;q=q+1)
             for(r=0;r<=65535;r=r+1)
	      for(m=0;m<=1;m=m+1)
               for(n=0;n<=1;n=n+1)
		for(s=0;s<=1;s=s+1)
            begin
	  S1=n;
          S2=m;
	  S3=s;
          I1=i;
          I2=j;
 	  I3=k;
	  I4=l;
          I5=o;
          I6=p;
 	  I7=q;
	  I8=r;
		
          #10;
        end
    end
endmodule

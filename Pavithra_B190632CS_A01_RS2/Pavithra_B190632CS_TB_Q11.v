
module or_08_test;
	wire  O;
	reg I0,I1,I2,I3,I4,I5,I6,I7;
	integer i,j,k,l,m,n,o,p;
	or_8_gate or8(I0,I1,I2,I3,I4,I5,I6,I7,O);
        initial
	begin
		for(i=0;i<=1;i=i+1)
		 for(j=0;j<=1;j=j+1)
 		  for(k=0;k<=1;k=k+1)
      		   for(l=0;l<=1;l=l+1)
		    for(m=0;m<=1;m=m+1)
		     for(n=0;n<=1;n=n+1)
		      for(o=0;o<=1;o=o+1)
		       for(p=0;p<=1;p=p+1)
			
			begin
				#10 I0=i; I1=j; I2=k; I3=l; I4=m; I5=n; I6=o; I7=p;
			end
	end
endmodule

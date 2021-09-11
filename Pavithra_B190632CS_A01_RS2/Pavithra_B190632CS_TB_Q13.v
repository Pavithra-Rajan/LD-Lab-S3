module demux_test;
 wire O1,O2;
 reg S,I;
 integer i,j;
 demux demux1(O1,O2,S,I);
 initial
  begin  
    for(i=0;i<=1;i=i+1)
      for(j=0;j<=1;j=j+1)
        begin
	  S=i;
          I=j;
          #10;
      end
  end
endmodule

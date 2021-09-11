module demux_4_tb();
	 reg S1,S2,I; 
	wire O1,O2,O3,O4;
	demux_4 dem4(S1,S2,I,O1,O2,O3,O4);
	initial 
		begin
		S2=1'b0; S1=1'b0; I=1;
		#100 S2=1'b0; S1=1'b1; 
		#100 S2=1'b1; S1=1'b0;
		#100 S2=1'b1; S1=1'b1;
	end
endmodule

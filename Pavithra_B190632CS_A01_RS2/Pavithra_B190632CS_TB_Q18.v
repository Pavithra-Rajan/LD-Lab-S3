module demux_8_tb();
	reg S1,S2,S3,I; 
	wire O1,O2,O3,O4,O5,O6,O7,O8;
	demux_8 dem8(O1,O2,O3,O4,O5,O6,O7,O8,S1,S2,S3,I);
	initial 
		begin
		S3=1'b0; S2=1'b0; S1=1'b0; I=1;
		#100 S3=1'b0; S2=1'b0; S1=1'b1; 
		#100 S3=1'b0; S2=1'b1; S1=1'b0; 
		#100 S3=1'b0; S2=1'b1; S1=1'b1; 
		#100 S3=1'b1; S2=1'b0; S1=1'b0; 
		#100 S3=1'b1; S2=1'b0; S1=1'b1; 
		#100 S3=1'b1; S2=1'b1; S1=1'b0; 
		#100 S3=1'b1; S2=1'b1; S1=1'b1; 
	end
endmodule

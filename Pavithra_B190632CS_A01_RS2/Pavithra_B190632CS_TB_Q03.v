
module or_gate_test;
	reg I1,I2;
	wire O;
	or_gate o(I1,I2,O);

	initial
		begin
			I1=1'b0;
			I2=1'b0;
			#100
			I1=1'b0;
			I2=1'b1;
			#100
			I1=1'b1;
			I2=1'b0;
			#200
			I1=1'b1;
			I2=1'b1;
			#500 $finish;
		end
endmodule

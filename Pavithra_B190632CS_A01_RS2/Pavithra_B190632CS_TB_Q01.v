
module not_gate_test;
	reg I;
	wire O;
	not_gate n(I,O);

	initial
		begin
			I=1'b0;
			#10 I=1'b1;
			#10 I=1'b0;
			#20 I=1'b1;
			#100 $finish;
		end
endmodule

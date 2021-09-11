module D_FLIPFLOP_TEST_NE_AS_RE_HIGH ;

	wire Q,Qnot ;
	reg D,C,RE; 

	D_FF_A_RE_HIGH_NE Dg(D,C,RE,Q,Qnot) ;

	initial 
		begin 
			C = 1'b0 ;
		end

	always 
		begin 
			C = ~C ; #5 ;
		end 

	initial
		begin
			$monitor("D=%b,RE=%b,Q=%b,Qnot=%b",D,RE,Q,Qnot);
			D = 1'b0 ; RE=1'b0; #10 ;
			D = 1'b0 ; RE=1'b0; #10; 
			D = 1'b0 ; RE=1'b1; #10; 
			D = 1'b0 ; RE=1'b1; #10; 
			D = 1'b1 ; RE=1'b0; #10 ;
			D = 1'b1 ; RE=1'b0; #10; 
			D = 1'b1 ; RE=1'b1; #10; 
			D = 1'b1 ; RE=1'b1; #10;
		end

endmodule

module not_gate(I,O);
	input I;
	output O;
	nand na12(O,I,I);
endmodule
module and_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W;
	nand na13(W,I1,I2);
        nand na14(O,W,W);
endmodule

module nand_3in(I1,I2,I3,O);
	input I1,I2,I3;
	output O;
	wire x,y;
	and_gate and3(I1,I2,x);
	and_gate and4(x,I3,y);
	not_gate na6(y,O);
endmodule
module D_LA_RE(D,C,RE,Q,Qnot);
	input D,C,RE;
	output Q,Qnot;
	wire D_not,Q_not1,Q1,x,y;
	nand na1(x,D,C);
	not_gate not1(D,D_not);
	nand na2(y,D_not,C);
	nand_3in na3_1(1'b1,x,Qnot,Q);
	nand_3in na3_2(RE,y,Q,Qnot);
endmodule
module D_FF_A_RE_HIGH_NE(D,C,RE,Q,Qnot);
	input D,C,RE;
	output Q,Qnot;
	wire RE_not,Q1,Q1_not,C_not;
	not_gate not_re(RE,RE_not);
	not_gate not_clk(C,C_not);
	D_LA_RE DRE1(D,C,RE_not,Q1,Q1_not);
	D_LA_RE DRE2(Q1,C_not,RE_not,Q,Qnot);
endmodule

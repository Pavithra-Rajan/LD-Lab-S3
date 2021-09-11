module D_FLIPFLOP_TEST_S_RE ;

	wire Q,Qnot ;
	reg D,C,RE; 

	D_FF_S_RE D4(D,C,Q,Qnot,RE) ;

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
	nand(O,I,I);
endmodule
module and_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W;
	nand(W,I1,I2);
        nand(O,W,W);
endmodule
module D_LATCH(D,C,Q,Qnot);
	output Q,Qnot ;
	input D,C ;
	wire S,R,S_C,R_C ;

	and_gate a1(D,D,S) ;
	not_gate n1(D,R) ;
	nand nan1(S_C,C,S) ;
	nand nan2(R_C,C,R) ;
	nand nan3(Q,Qnot,S_C) ;
	nand nan4(Qnot,Q,R_C) ;
endmodule
module D_FLIP_FLOP(D,C,Q,Qnot);
	input D,C;
	output Q,Qnot;
	wire C_not,Q_not1,Q1;
	not_gate n1(C,C_not);
	D_LATCH D1(D,C_not,Q1,Q_not1);
	D_LATCH D2(Q1,C,Q,Qnot);
endmodule
module D_FF_S_RE(D,C,Q,Qnot,RE);
	input D,C,RE;
	output Q,Qnot;
	wire RE_not,D_RE;
	not_gate not_re(RE,RE_not);
	and_gate and_re(D,RE_not,D_RE);
	D_FLIP_FLOP DD(D_RE,C,Q,Qnot);
endmodule;
module PC_TEST ;

	reg re,incre,sel,clk,cs,w,r ;
	reg [15:0] load ;
	wire [15:0] O ;

	PC PC_T(re,incre,load,sel,clk,cs,w,r,O);

	initial 
		begin 
			clk = 1'b1 ;
		end

	always 
		begin 
			clk = ~clk ; #5 ;
		end


	initial 
		begin
			
			re = 1'b0 ; incre = 1'b1 ; load = 0 ; sel = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #10 ;
			re = 1'b0 ; incre = 1'b0 ; load = 128 ; sel = 1'b1 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #10 ;
			re = 1'b0 ; incre = 1'b1 ; load = 0 ; sel = 1'b0 ; cs = 1'b1 ; w = 1'b1 ; r = 1'b1 ; #10 ;
			
	end

endmodule
module not_gate(I,O) ;

	output O ;
	input I ;

	nand(O,I,I) ;

endmodule 

module and_gate(I1,I2,O) ;

	output O ;
	input I1,I2 ;
	wire x ;

	nand(x,I1,I2) ;
	nand(O,x,x) ; 

endmodule 

module or_gate(I1,I2,O) ;

	output O ;
	input I1,I2 ;
	wire x,y ;

	nand(x,I1,I1) ;
	nand(y,I2,I2) ;
	nand(O,x,y) ;

endmodule 

module xor_gate(a,b,c) ;

	output c ; 
	input a,b ;
	wire a_,b_,x,y ;

	not_gate n1(a,a_) ;
	not_gate n2(b,b_) ;
	and_gate a1(a,b_,x) ;
	and_gate A2(a_,b,y) ;
	or_gate o1(x,y,c) ;

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

module D_Latch(d,c,q,q_) ;

	output q,q_ ;
	input d,c ;
	wire c_,s,r,x,y ;

	and_gate S(d,d,s) ;
	not_gate R(d,r) ;
	nand(x,c,s) ;
	nand(y,c,r) ;
	nand(q,q_,x) ;
	nand(q_,q,y) ;

endmodule
module BIN_CELL(D,CLK,CS,W,R,O);
	input D,R,W,CS,CLK;
	output O;
	wire WCS,Q,Qnot,mux_o,RCS;
	and_gate an1(W,CS,WCS);
	and_gate an2(R,CS,RCS);
	mux m1(mux_o,WCS,Q,D);
	D_FLIP_FLOP dff(D,CLK,Q,Qnot);
	mux mux2(O,RCS,1'bx,Q);
endmodule
module REG_16(D,CLK,CS,W,R,O);
	input [15:0]D;
	input R,W,CS,CLK;
	
	output [15:0]O;
	BIN_CELL B[15:0](O,D,R,W,CS,CLK);
endmodule


module mux(I1,I2,S,O);
  	input S,I1,I2;
  	output O;
  	wire x,y,z;
  	and_gate and1(S,I2,x);
  	not_gate or1(S,y);
  	and_gate a3(y,I1,z);
  	or_gate a4(x,z,O);
endmodule


module mux2_16(a,b,s,c) ;

	output [15:0] c ;
	input [15:0] a,b;
	input s ;

	mux M[15:0](a,b,s,c) ;

endmodule

module HalfAdder(a,b,s,c) ;

	output s,c ;
	input a,b ;

	and_gate ag1(a,b,c) ;
	xor_gate xg1(a,b,s) ;

endmodule

module inc_16bit(a,b) ;

	output [15:0] b;
	input [15:0] a ;
	wire [15:0] c ;

	HalfAdder H1(a[0],1'b1,b[0],c[0]) ;
	HalfAdder H2(a[1],c[0],b[1],c[1]) ; 
	HalfAdder H3(a[2],c[1],b[2],c[2]) ; 
	HalfAdder H4(a[3],c[2],b[3],c[3]) ; 
	HalfAdder H5(a[4],c[3],b[4],c[4]) ; 
	HalfAdder H6(a[5],c[4],b[5],c[5]) ; 
	HalfAdder H7(a[6],c[5],b[6],c[6]) ; 
	HalfAdder H8(a[7],c[6],b[7],c[7]) ; 
	HalfAdder H9(a[8],c[7],b[8],c[8]) ; 
	HalfAdder H10(a[9],c[8],b[9],c[9]) ; 
	HalfAdder H11(a[10],c[9],b[10],c[10]) ; 
	HalfAdder H12(a[11],c[10],b[11],c[11]) ; 
	HalfAdder H13(a[12],c[11],b[12],c[12]) ;
	HalfAdder H14(a[13],c[12],b[13],c[13]) ; 
	HalfAdder H15(a[14],c[13],b[14],c[14]) ; 
	HalfAdder H16(a[15],c[14],b[15],c[15]) ;  

endmodule 

module PC(re,incre,load,sel,clk,cs,w,r,O) ;

	input re,incre,sel,clk,cs,w,r ;
	input [15:0] load ;
	output [15:0] O ;
	wire [15:0] d,D,D_1,D_2,d_and ;

	mux2_16 M16(O,load,sel,d) ;
	inc_16bit I(d,D) ;
	and_gate A[15:0](d,d,d_and) ;
	mux2_16 M2(d_and,D,incre,D_2) ;
	mux2_16 M3(D_1,16'b0,re,D_2);
	REG_16 R(D_2,clk,cs,w,r,O) ;

endmodule  
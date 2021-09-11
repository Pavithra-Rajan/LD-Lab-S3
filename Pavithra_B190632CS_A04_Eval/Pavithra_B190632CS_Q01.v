module circuitIV_IV(X,U,V,W,operation);
// If operation=0, perform (a), if operation=1, perform (b)
// Read the required inputs from the input ports and store them in the specified RAM locations,
// then read from the RAM locations and perform the required operation,
// then store the result in the specified RAM location and also output it on the output port.

	output reg [23:0] X;
	input [23:0] U,V,W;
	input operation;
	
	wire [45:0] PDT,div,p1,p2,p3;
	wire [23:0]R0,R1,R2,R3,X1;
	RAM_512 rm1(R0,U,1'b1,1'b1,1'b1,1'b1,3'd155,1'b1);
	RAM_512 rm2(R1,V,1'b1,1'b1,1'b1,1'b1,3'd10,1'b1);
	RAM_512 rm3(R2,W,1'b1,1'b1,1'b1,1'b1,3'd95,1'b1);
	RAM_512 rm4(R3,3'b111,1'b1,1'b1,1'b1,1'b1,3'd180,1'b1);
	multiply m1(PDT,R1,R12);//u*w
	multiply m2(p1,PDT,R3);//u*w*7
	multiply m3(p2,2'b10,R1);//2*v
	multiply m4(p3,p2,p1);//2*v*p1,b
	
	mux2_16 m412(X1,operation,R1,p3);
	RAM_512 rt4(X,X1,1'b1,1'b1,1'b1,1'b1,3'd115,1'b1);

endmodule


module multiply(p,m,q);
	output reg[45:0] p;
	input[23:0] m,q;
	reg [23:0] sum;
	integer i,j;
	always @(m,q)
		begin 
			sum=m;
			p=0;
			for(i=0;i<24;i=i+1)
				begin
					if(q[i]==1)
						begin 
						p=p+sum;
						end
					sum=sum<<1;
				end
		end
endmodule
module RAM_512(o,D,r,w,e,clk,addr,RE);
	output [23:0]o;
	input r,w,clk,e,RE;
	input [23:0]D;
	input [8:0]addr;
	wire [7:0]cs;
	wire [23:0]o1,o2,o3,o4,o5,o6,o7,o8;
	demux_8 d81(cs[0],cs[1],cs[2],cs[3],cs[4],cs[5],cs[6],cs[7],addr[6],addr[7],addr[8],e);
	
	RAM_64 r1(o1,D,r,w,cs[0],clk,addr[5:0],RE);
	RAM_64 r2(o2,D,r,w,cs[1],clk,addr[5:0],RE);
	RAM_64 r3(o3,D,r,w,cs[2],clk,addr[5:0],RE);
	RAM_64 r4(o4,D,r,w,cs[3],clk,addr[5:0],RE);
	RAM_64 r5(o5,D,r,w,cs[4],clk,addr[5:0],RE);
	RAM_64 r6(o6,D,r,w,cs[5],clk,addr[5:0],RE);
	RAM_64 r7(o7,D,r,w,cs[6],clk,addr[5:0],RE);
	RAM_64 r8(o8,D,r,w,cs[7],clk,addr[5:0],RE);
	mux8_16 m862(o,addr[6],addr[7],addr[8],o1,o2,o3,o4,o5,o6,o7,o8);
endmodule 
module RAM_64(o,D,r,w,e,clk,addr,RE);
	output [23:0]o;
	input r,w,clk,e,RE;
	input [23:0]D;
	input [5:0]addr;
	wire [7:0]cs;
	wire [23:0]o1,o2,o3,o4,o5,o6,o7,o8;
	demux_8 d82(cs[0],cs[1],cs[2],cs[3],cs[4],cs[5],cs[6],cs[7],addr[3],addr[4],addr[5],e);
	
	RAM8 r11(o1,D,r,w,cs[0],clk,addr[2:0],RE);
	RAM8 r21(o2,D,r,w,cs[1],clk,addr[2:0],RE);
	RAM8 r31(o3,D,r,w,cs[2],clk,addr[2:0],RE);
	RAM8 r41(o4,D,r,w,cs[3],clk,addr[2:0],RE);
	RAM8 r51(o5,D,r,w,cs[4],clk,addr[2:0],RE);
	RAM8 r61(o6,D,r,w,cs[5],clk,addr[2:0],RE);
	RAM8 r71(o7,D,r,w,cs[6],clk,addr[2:0],RE);
	RAM8 r81(o8,D,r,w,cs[7],clk,addr[2:0],RE);
	mux8_16 m861(o,addr[3],addr[4],addr[5],o1,o2,o3,o4,o5,o6,o7,o8);
endmodule 			
module RAM8(o,D,r,w,e,clk,addr,RE);
	output [23:0]o;
	input r,w,clk,e,RE;
	input [23:0]D;
	input [2:0]addr;
	wire [7:0]cs;
	wire [23:0]o1,o2,o3,o4,o5,o6,o7,o8;
	demux_8 d83(cs[0],cs[1],cs[2],cs[3],cs[4],cs[5],cs[6],cs[7],addr[0],addr[1],addr[2],e);
	
	REG_16 re1(o1,D,r,w,cs[0],clk,RE);
	REG_16 re2(o2,D,r,w,cs[1],clk,RE);
	REG_16 re3(o3,D,r,w,cs[2],clk,RE);
	REG_16 re4(o4,D,r,w,cs[3],clk,RE);
	REG_16 re5(o5,D,r,w,cs[4],clk,RE);
	REG_16 re6(o6,D,r,w,cs[5],clk,RE);
	REG_16 re7(o7,D,r,w,cs[6],clk,RE);
	REG_16 re8(o8,D,r,w,cs[7],clk,RE);
	mux8_16 m86(o,addr[0],addr[1],addr[2],o1,o2,o3,o4,o5,o6,o7,o8);
endmodule 

module or_gate(I1,I2,O);
	input I1,I2;
	output O;
        wire W1,W2;
	nand(W1,I1,I1);
        nand(W2,I2,I2);
        nand(W2,I2,I2);
	nand(O,W1,W2);
endmodule
module mux(O,S,I1,I2);
	  input S,I1,I2;
	  output O;
	  wire x,y,z;
	  and_gate and1(S,I2,x);
	  not_gate or1(S,y);
	  and_gate a3(y,I1,z);
	  or_gate a4(x,z,O);
endmodule

module mux2_16(out,s,in1,in2);
	input s;
	input [23:0]in1,in2;
	output [23:0]out;
	wire x;
	wire [23:0] y,z;
	genvar i;
	nand(x,s,s);
	for(i=0;i<=23;i=i+1)
		begin
		nand(y[i],in1[i],x);
		nand(z[i],s,in2[i]);
		nand(out[i],z[i],y[i]);
		end
endmodule
module mux4_16(out,s1,s2,in1,in2,in3,in4);
	input s1,s2;
	input [23:0]in1,in2,in3,in4;
	output [23:0]out;
	wire [23:0]x,y;
	mux2_16 m21(x,s1,in1,in2);
	mux2_16 m22(y,s1,in3,in4);
	mux2_16 m23(out,s2,x,y);
endmodule

module mux8_16(out,s1,s2,s3,in1,in2,in3,in4,in5,in6,in7,in8);
	input s1,s2,s3;
	input [23:0]in1,in2,in3,in4,in5,in6,in7,in8;
	output [23:0]out;
	wire [23:0]x,y;
	mux4_16 m31(x,s1,s2,in1,in2,in3,in4);
	mux4_16 m32(y,s1,s2,in5,in6,in7,in8);
	mux2_16 m33(out,s3,x,y);
endmodule
module demux(O1,O2,S,I);
	output O1,O2;
	input S,I;
	wire x;
	not_gate n1(S,x);
	and_gate and1(x,I,O1);
	and_gate and2(S,I,O2);
endmodule



module demux_4(S1,S2,I,O1,O2,O3,O4);
	input S1,S2,I;
	output O1,O2,O3,O4;
	wire x,y,a,b,c,d;
	not_gate not1(S1,x);
	not_gate not2(S2,y);
	and_gate and1(x,y,a);
	and_gate and2(y,S1,b);
	and_gate and3(S2,x,c);
	and_gate and4(S1,S2,d);
	and_gate and5(a,I,O1);
	and_gate and6(b,I,O2);
	and_gate and7(c,I,O3);
	and_gate and8(d,I,O4);
endmodule
module demux_8(O1,O2,O3,O4,O5,O6,O7,O8,S1,S2,S3,I);
	output O1,O2,O3,O4,O5,O6,O7,O8;
	input I,S1,S2,S3;
	wire x,y;
	demux dm1(x,y,S3,I);
	demux_4 dm2(S1,S2,x,O1,O2,O3,O4);
	demux_4 dm3(S1,S2,y,O5,O6,O7,O8);
endmodule


module srlatch(q,q1,s,r,clk);
	output q,q1;
	input s,r,clk;
	wire x,y;
	nand(x,s,clk);
	nand(y,r,clk);
	nand(q,q1,x);
	nand(q1,q,y);
endmodule

module D_latch(q,q1,s,clk);
	output q,q1;
	input s,clk;
	wire x,y,z;
	nand (x,s,s);
	srlatch o1(q,q1,s,x,clk);
endmodule

module BIN_CELL(o,r,w,cs,d,clk,RE);
	output o;
	input r,w,cs,d,clk,RE;
	wire wcs,m_o,q,q1,rcs;
	and_gate a1 (cs,w,wcs);
	mux m34(m_o,wcs,q,d);
	D_FF_A_RE_HIGH_NE o3(m_o,clk,RE,q,q1);
	and_gate wee (cs,r,rcs);
	mux m43(o,rcs,1'bx,q);
endmodule

module REG_16(o,d,r,w,cs,clk,RE);
	input r,w,cs,clk,RE;
	input [23:0]d;
	output [23:0]o;
	
	BIN_CELL bc[23:0](o,r,w,cs,d,clk,RE);
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

module mult(O,M,Q,CLK);
	input [15:0] M,Q;
	output [31:0] O;
	input CLK;
	wire [31:0] PDT;
	wire [15:0]R0,R1;
	RAM8 rm1(R0,M,1'b1,1'b1,CLK,3'd0);
	RAM8 rm2(R1,Q,1'b1,1'b1,CLK,3'd1);
	multiply m1(PDT,R0,R1);
	RAM8 rm3(O[15:0],PDT[15:0],1'b1,1'b1,CLK,3'd2);
	RAM8 rm4(O[31:16],PDT[31:16],1'b1,1'b1,CLK,3'd3);
endmodule
module multiply(p,m,q);
	output reg[31:0] p;
	input[15:0] m,q;
	reg [15:0] sum;
	integer i,j;
	always @(m,q)
		begin 
			sum=m;
			p=0;
			for(i=0;i<16;i=i+1)
				begin
					if(q[i]==1)
						begin 
						p=p+sum;
						end
					sum=sum<<1;
				end
		end
endmodule
				
module RAM8(o,D,r,w,clk,addr);
	output [15:0]o;
	input r,w,clk;
	input [15:0]D;
	input [2:0]addr;
	wire [7:0]cs;
	wire [15:0]o1,o2,o3,o4,o5,o6,o7,o8;
	demux_8 d8(cs[0],cs[1],cs[2],cs[3],cs[4],cs[5],cs[6],cs[7],addr[0],addr[1],addr[2],1'b1);
	
	REG_16 re1(o1,D,r,w,cs[0],clk);
	REG_16 re2(o2,D,r,w,cs[1],clk);
	REG_16 re3(o3,D,r,w,cs[2],clk);
	REG_16 re4(o4,D,r,w,cs[3],clk);
	REG_16 re5(o5,D,r,w,cs[4],clk);
	REG_16 re6(o6,D,r,w,cs[5],clk);
	REG_16 re7(o7,D,r,w,cs[6],clk);
	REG_16 re8(o8,D,r,w,cs[7],clk);
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
	input [15:0]in1,in2;
	output [15:0]out;
	wire x;
	wire [15:0] y,z;
	genvar i;
	nand(x,s,s);
	for(i=0;i<16;i=i+1)
		begin
		nand(y[i],in1[i],x);
		nand(z[i],s,in2[i]);
		nand(out[i],z[i],y[i]);
		end
endmodule
module mux4_16(out,s1,s2,in1,in2,in3,in4);
	input s1,s2;
	input [15:0]in1,in2,in3,in4;
	output [15:0]out;
	wire [15:0]x,y;
	mux2_16 m21(x,s1,in1,in2);
	mux2_16 m22(y,s1,in3,in4);
	mux2_16 m23(out,s2,x,y);
endmodule

module mux8_16(out,s1,s2,s3,in1,in2,in3,in4,in5,in6,in7,in8);
	input s1,s2,s3;
	input [15:0]in1,in2,in3,in4,in5,in6,in7,in8;
	output [15:0]out;
	wire [15:0]x,y;
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

module BIN_CELL(o,r,w,cs,d,clk);
	output o;
	input r,w,cs,d,clk;
	wire wcs,m_o,q,q1,rcs;
	and_gate a1 (cs,w,wcs);
	mux m34(m_o,wcs,q,d);
	D_latch o3(q,q1,m_o,clk);
	and_gate wee (cs,r,rcs);
	mux m43(o,rcs,1'bx,q);
endmodule

module REG_16(o,d,r,w,cs,clk);
	input r,w,cs,clk;
	input [15:0]d;
	output [15:0]o;
	
	BIN_CELL bc[15:0](o,r,w,cs,d,clk);
endmodule

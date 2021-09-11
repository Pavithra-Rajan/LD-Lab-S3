module ALU_testbench ;

wire [15:0] o ;
wire ng,zr ;
reg [15:0] x,y ;
reg zx,nx,zy,ny,f,no ;

ALU2 A(x,y,zx,nx,zy,ny,f,no,zr,ng,o) ;

		
	initial
		begin
		$monitor("x=%b,y=%b,n0=%b,zx=%b,nx=%b,zy=%b,ny=%b,f=%b,output=%b,ng=%b,zr=%b",x,y,no,zx,nx,zy,ny,f,o,ng,zr);
		x=12;y=13;
		#10 zx = 1 ; nx = 0 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; //this gives 0
		#10 zx = 1 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; // 1
		#10 zx = 1 ; nx = 1 ; zy = 1 ; ny = 0 ; f = 1 ; no = 0 ; // -1
		#10 zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 0 ; // x
		#10 zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; // y	
		#10 zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 0 ; no = 1 ; // !x 
		#10 zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 0 ; no = 1 ; // !y 
	        #10 zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; // -x
		#10 zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; // -y
		#10 zx = 0 ; nx = 1 ; zy = 1 ; ny = 1 ; f = 1 ; no = 1 ; // x+1
		#10 zx = 1 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; // y+1
		#10 zx = 0 ; nx = 0 ; zy = 1 ; ny = 1 ; f = 1 ; no = 0 ; // x-1 
		#10 zx = 1 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; // y-1
		#10 zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 1 ; no = 0 ; // x+y 
		#10 zx = 0 ; nx = 1 ; zy = 0 ; ny = 0 ; f = 1 ; no = 1 ; // x-y 
		#10 zx = 0 ; nx = 0 ; zy = 0 ; ny = 1 ; f = 1 ; no = 1 ; // y-x 
		#10 zx = 0 ; nx = 0 ; zy = 0 ; ny = 0 ; f = 0 ; no = 0 ; // x&y 
		#10 zx = 0 ; nx = 1 ; zy = 0 ; ny = 1 ; f = 0 ; no = 1 ; // x|y 	
			
		end
endmodule
	
module ALU2(x,y,zx,nx,zy,ny,f,no,zr,ng,o) ;

output [15:0] o ;
output zr,ng ;
input [15:0] x,y ;
input zx,nx,zy,ny,f,no ;
wire [15:0] and_x,and_y,xor_x,xor_y,add,and_al,mux_o ;
wire zx_not,zy_not ;

not_gate not1(zx,zx_not) ;
not_gate not2(zy,zy_not) ;

and_16_1 and_alu1(x,zx_not,and_x) ;
and_16_1 and_alu2(y,zy_not,and_y) ;

xor_16_1 xor_alu1(and_x,nx,xor_x) ;
xor_16_1 xor_alu2(and_y,ny,xor_y) ;

adder_16 add_alu(xor_x,xor_y,add) ;
and_gate_16 and_alu(xor_x,xor_y,and_al) ;
mux_16 mux_alu(and_al,add,f,mux_o) ;

xor_16_1 xor_alu(mux_o,no,o) ;

and_gate and_ng(o[15],o[15],ng) ;
nor_16_in nor_zr(o,zr) ;

endmodule 
module not_gate(I,O) ;

output O;
input I;

nand(O,I,I) ;

endmodule 

module and_gate(a,b,c) ;

output c ;
input a,b ;
wire x ;

nand(x,a,b) ;
nand(c,x,x) ; 

endmodule 

module or_gate(a,b,c) ;

output c ;
input a,b ;
wire x,y ;

nand(x,a,a) ;
nand(y,b,b) ;
nand(c,x,y) ;

endmodule 

module xor_gate(a,b,c) ;

output c ; 
input a,b ;
wire a_,b_,x,y ;

not_gate Na(a,a_) ;
not_gate Nb(b,b_) ;
and_gate A1(a,b_,x) ;
and_gate A2(a_,b,y) ;
or_gate O(x,y,c) ;

endmodule 

module xnor_gate(a,b,c) ;

output c ;
input a,b ;
wire x ;

xor_gate X(a,b,x) ;
not_gate N(x,c) ;

endmodule 

module FullAdder(a,b,c0,s,c) ;

output s,c ;
input a,b,c0 ;
wire c_,x,x_,y,y_ ;
not_gate N(c0,c_) ;
xor_gate X1(a,b,x) ;
xnor_gate X2(a,b,x_) ;
and_gate A(a,b,y) ;
or_gate O(a,b,y_) ;
and_gate As1(x,c_,s1) ;
and_gate As2(x_,c0,s2) ;
and_gate Ac1(y,c_,c1) ;
and_gate Ac2(y_,c0,c2) ;
or_gate S(s1,s2,s) ;
or_gate C(c1,c2,c) ;

endmodule 

module adder_16(a,b,s) ;

output [15:0] s ;
input [15:0] a,b ;
wire [15:0] c ;

FullAdder F0(a[0],b[0],1'b0,s[0],c[0]) ;
FullAdder F1(a[1],b[1],c[0],s[1],c[1]) ;
FullAdder F2(a[2],b[2],c[1],s[2],c[2]) ;
FullAdder F3(a[3],b[3],c[2],s[3],c[3]) ;
FullAdder F4(a[4],b[4],c[3],s[4],c[4]) ;
FullAdder F5(a[5],b[5],c[4],s[5],c[5]) ;
FullAdder F6(a[6],b[6],c[5],s[6],c[6]) ;
FullAdder F7(a[7],b[7],c[6],s[7],c[7]) ;
FullAdder F8(a[8],b[8],c[7],s[8],c[8]) ;
FullAdder F9(a[9],b[9],c[8],s[9],c[9]) ;
FullAdder F10(a[10],b[10],c[9],s[10],c[10]) ;
FullAdder F11(a[11],b[11],c[10],s[11],c[11]) ;
FullAdder F12(a[12],b[12],c[11],s[12],c[12]) ;
FullAdder F13(a[13],b[13],c[12],s[13],c[13]) ;
FullAdder F14(a[14],b[14],c[13],s[14],c[14]) ;
FullAdder F15(a[15],b[15],c[14],s[15],c[15]) ;

endmodule 

module neg_16(a,b) ;

output [15:0] b ;
input [15:0] a ;

not_gate N[15:0](a,b) ;

endmodule

module mux(a,b,s,o) ;

output o ;
input a,b,s ;
wire s_,x,y ;

not_gate Ns(s,s_) ;
and_gate Aa(s_,a,x) ;
and_gate Ab(s,b,y) ;
or_gate O(x,y,o) ;

endmodule 

module mux_16(a,b,s,o) ;

output [15:0] o ;
input [15:0] a,b ;
input s ;

mux M[15:0](a,b,s,o) ;

endmodule 

module and_16_1(a,b,c) ;

output [15:0] c ;
input [15:0] a ;
input b ; 

and_gate A[15:0](a,b,c) ;

endmodule 

module xor_16_1(a,b,c) ;

output [15:0] c ;
input [15:0] a ;
input b ;

xor_gate X[15:0](a,b,c) ;

endmodule

module and_gate_16(a,b,c) ;

output [15:0] c ;
input [15:0] a,b ;

and_gate A[15:0](a,b,c) ;

endmodule 

module nor_16_in(a,o) ;

output o ;
input [15:0] a ;
wire [14:0] x ;

or_gate O1(a[0],a[1],x[0]) ;
or_gate O2(a[2],a[3],x[1]) ;
or_gate O3(a[4],a[5],x[2]) ;
or_gate O4(a[6],a[7],x[3]) ;
or_gate O5(a[8],a[9],x[4]) ;
or_gate O6(a[10],a[11],x[5]) ;
or_gate O7(a[12],a[13],x[6]) ;
or_gate O8(a[14],a[15],x[7]) ;
or_gate O9(x[0],x[1],x[8]) ;
or_gate O10(x[2],x[3],x[9]) ;
or_gate O11(x[4],x[5],x[10]) ;
or_gate O12(x[6],x[7],x[11]) ;
or_gate O13(x[9],x[8],x[12]) ;
or_gate O14(x[11],x[10],x[13]) ;
or_gate O15(x[13],x[12],x[14]) ;

not_gate N(x[14],o) ;

endmodule 
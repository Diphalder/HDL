module logiccrc(
input d,
input x,
input a,
output l
);
assign l= ~d&~x&l | d&~x&~l | d&~x&l;
endmodule

`timescale 1ns/1ps

module logiccrc_tb;
reg D;
reg X;
reg A;
wire L;
logiccrc uut(
.d(D),
.x(X),
.a(A),
.l(L)
);

initial begin
    D=0;X=0;A=0;#10;
    D=0;X=0;A=1;#10;
    D=0;X=1;A=0;#10;   
    D=0;X=1;A=1;#10;
    D=1;X=0;A=0;#10;
    D=1;X=0;A=1;#10; 
    D=1;X=1;A=0;#10;
    D=1;X=1;A=1;#10;
end 
initial begin
    $monitor("%b %b %b  %b\n",D,X,A,L);
end 

endmodule

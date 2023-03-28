module d2to4(input [1:0] A , input E , output [3:0] Y   );


assign Y[0]= E & ~A[1] & ~A[0];
assign Y[1]= E & ~A[1] & A[0];
assign Y[2]= E & A[1] & ~A[0];
assign Y[3]= E & A[1] & A[0];

endmodule
`timescale 1ps/1ps

module d2to4_tb;

reg [1:0] a;
reg e;
wire [3:0] y;

d2to4 uut(.A(a),.E(e),.Y(y));

initial begin
    e=0; a[1]=0; a[0]=0; #10;
    e=0; a[1]=0; a[0]=1; #10;
    e=0; a[1]=1; a[0]=0; #10;
    e=0; a[1]=1; a[0]=1; #10;
    e=1; a[1]=0; a[0]=0; #10;
    e=1; a[1]=0; a[0]=1; #10;
    e=1; a[1]=1; a[0]=0; #10;
    e=1; a[1]=1; a[0]=1; #10;
    end

initial begin
$monitor("E=%d  %d%d   -> %b\n",e,a[1],a[0],y);
end

endmodule



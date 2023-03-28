module d2to4(input [1:0] A , input  E , output reg [3:0] Y   );



always @(*) begin

    if(E==1'b0)
        Y=4'b0000;
    else if(A == 2'b00)
        Y=4'b0001;
    else if(A == 2'b01)
        Y=4'b0010;
    else if(A == 2'b10)
        Y=4'b0100;
    else        
        Y=4'b1000;    
end





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
$monitor("E=%d  %d%d -> %b\n",e,a[1],a[0],y);
end

endmodule



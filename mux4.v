module mux4(
    input i3,
    input i2,
    input i1,
    input i0,
    input [1:0]s,
    output reg q
);

always @(*) begin

    if(s==2'b00)
        q=i0;
    else if(s==2'b01)
        q=i1;
    else if(s==2'b10)
        q=i2;
    else if(s==2'b11)
        q=i3;
end

endmodule

`timescale 1ns/1ps



module mux4_tb;
 reg i3;
 reg i2;
 reg  i1;
 reg  i0;
 reg  [1:0]s;
 wire q;

mux4 uut (
.i3(i3),
.i2(i2),
.i1(i1),
.i0(i0),
.s(s),
.q(q)
);

initial begin
    s[1]=0;s[0]=0;#10;
    s[1]=0;s[0]=1;#10;
    s[1]=1;s[0]=0;#10;
    s[1]=1;s[0]=1;#10;
end
initial begin
    $monitor("%b %b %b",s[1],s[0],q);
end
endmodule





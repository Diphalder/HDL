module register8(
input reset,
input [7:0]d,
input clk ,
output reg [7:0]q
);

always @(posedge clk , posedge reset)
begin
    if(reset)
    q<=8'b0000_0000;
    else 
    q<=d;
end

endmodule
`timescale 1ps/1ps

module register8_tb;
reg reset;
reg [7:0]d;
reg clk ;
wire [7:0]q;

register8 uut(reset,d,clk,q);


always begin
    clk=~clk;
    #10;
end

initial begin

    clk<=0;
    reset<=1;
    d<=8'b0000_0000;
    #20;
    reset<=0;
    d<=8'b0000_1001;
    #20;
    d<=8'b0000_1111;
    #20;
    $finish;
end

initial begin

    $monitor("clk= %b reset= %b d=%b q=%b\n",clk,reset,d,q);

end

endmodule
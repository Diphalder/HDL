module dc7bit(input clock , input reset , output [6:0] data );

reg [6:0] r_in;
reg [6:0] r_out;

always @ (posedge clock , posedge reset)
begin
    if(reset)
        r_out<=7'b111_1111;
    else
        r_out<=r_in;
end

assign data=r_out;
always @(*)
begin
    r_in=r_out-2;
    if(r_in==7'b000_0111)
        r_in=r_in-2;
end

endmodule

`timescale  1ns/1ns

module tb();

reg clk;
reg re;
wire [6:0] d;

dc7bit dip(clk,re,d);

always begin
    clk=~clk;
    #10;
end



initial begin
    clk<=0;
    re<=1;
    #20;
    re<=0;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    re<=1;
    #20;
    re<=0;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;


    $finish;
end

initial begin
    $monitor("%d\n",d);
end






endmodule
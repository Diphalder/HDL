module dff(
    input clk,
    input d,
    output reg q
);
always @(posedge clk)
begin
    q<=d;
end 

endmodule

`timescale 1ns/1ps

module dff_tb;
reg clk ;
reg d;
wire q;

dff uutttt(clk , d,q);

always begin
    clk=~clk;
    #100;
end

initial begin

    clk<=0;
    d<=0;
    #200;
    d<=1;
    #200;
    $finish;
end


initial begin
    $monitor("clk=%b d=%b q=%b\n",clk,d,q);
end




endmodule

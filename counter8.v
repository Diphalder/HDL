module register8(
    input clk,
    input reset,
    input [7:0] d,
    output reg [7:0] q
);

always@(posedge clk,posedge reset)
begin
    if(reset)
    q<=8'b0000_0000;
    else 
    q<=d;
end

endmodule




module addone(
    input [7:0] in,
    output [7:0] outt
);

assign outt=in+1;

endmodule





module counter8 (
    input reset ,
    input clk,
    output  [7:0] v
);

wire [7:0] o_tmp;
wire [7:0] i_tmp;
register8 regi1(clk,reset,i_tmp,o_tmp);
addone add1(o_tmp,i_tmp);
assign v=o_tmp;

endmodule


`timescale 1ns/1ps


module counter8_tb;
reg clk;
reg reset;
wire [7:0] q;

counter8 cntr(reset,clk,q);

always begin
    clk=~clk;
    #10; 
end

initial begin
    clk<=0;
    reset<=1;
    #20;
    reset<=0;
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

$monitor("clk= %b  reset= %b  q=%b\b",clk,reset,q);

end



endmodule





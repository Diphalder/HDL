module reg4(
    input clk,
    input reset,
    input [3:0] x,
    output reg [3:0] z
);

always @ (posedge clk, posedge reset) 
begin
    if(reset)
    z<=4'b0000;
    else
    z<=x;
end
endmodule


module subone(
    input [3:0]x,
    output [3:0]y
);
assign y=x-1;
endmodule


module dcntr4(
input clk,
input reset,
output [3:0] z
);
wire [3:0] i_tmp,o_tmp;

reg4 uut(clk,reset,i_tmp,o_tmp);
subone uut2(o_tmp,i_tmp);
assign z=o_tmp;

endmodule



`timescale 1ns/1ps

module dcntr4_tb;
reg clk;
reg reset;
wire [3:0] z;

dcntr4 uut3(clk,reset,z);

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
$monitor("clk=%b reset=%b   -> %b \n",clk,reset,z);

end



endmodule







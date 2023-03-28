module dcntr4(
input clk,
input reset,
output reg [3:0] z
);


reg [3:0] i_tmp;


always @ (posedge clk, posedge reset) 
begin
    if(reset)
    z<=4'b0000;
    else
    z<=i_tmp-1;
end




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



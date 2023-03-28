module reg8 (input [7:0] din , input clock , input reset , output reg [7:0] dout);

always @(posedge clock , posedge reset)
begin
    if(reset==1)
        dout<=8'b00000000;
    else
        dout<=din;
    end

endmodule

`timescale  1ns/1ps

module reg8_tb;
reg [7:0] din ;
reg clk ;
reg reset ;
wire [7:0] dout;
reg8 dip(din,clk,reset,dout);

always begin
    clk=~clk;
    #10;
end

initial begin

    clk<=0;
    reset<=1;
    din<=8'b10011000;#20;
    din<=8'b10011111;#20;
    reset<=0;
    din<=8'b11100111;#20;
    din<=8'b11100000;#20;
    din<=8'b11111100;

    $finish;
    

end

initial begin
    $monitor("reset=%b clock=%b data=%b    output=%b\n",reset,clk,din,dout);
end



endmodule



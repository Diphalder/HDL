module reg8( input [7:0] din , input reset ,input en, input clock , output [7:0] dout );

reg  [7:0] dff_out;
wire  [7:0] dff_in;



//sequential logic circuit
always @(posedge clock , posedge reset)
begin
    if(reset)
        dff_out<=0;
    else
        dff_out<=dff_in;
end


// combinational logic circuit

//input logic of DFF
assign dff_in = en ? din : dff_out;

//output logic of DFF
assign dout = dff_out;




endmodule

`timescale  1ns/1ps


module reg8_tb;
reg [7:0] din ;
reg reset;
reg en; 
reg clk ;
wire [7:0] dout;

reg8 dip( din, reset , en ,clk, dout );


always 
begin
    clk=~clk;
    #10;
end


initial 
begin
    clk<=0;
    reset<=1;
    en<=0;

    din<=8'b01010100;          #20;
    
    reset<= 0;
    en<=1;
    
    din<=8'b11110100;          #20;
    din<=8'b01010111;          #20;  

    $finish;
end



initial 
begin
    $monitor("clk=%b r=%b en=%b  din=%b    dout=%b\n",clk,reset,en,din,dout);
end


endmodule
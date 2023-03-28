module dff(input din , input en , input clock , input reset , output reg   dout);
reg r_in;
reg r_out;


//sequential part
always @(posedge clock ,posedge reset)
begin
    if(reset)
        r_out<=0;
    else
        r_out<=r_in;
end

//combinational part
//input logic circuit
always @(*)
begin

    if(en)
        r_in=din;
    else
        r_in=r_out;
end

//output logic circuit
always @(*)
begin
    dout=r_out;
end
endmodule

`timescale  1ns/1ps




module dff_tb();
reg din;
reg  en;
reg clk;
reg reset;
wire  dout;

dff dip(din,en,clk,reset,dout);


always begin
    clk=~clk;
    #10;
end

initial begin
$dumpfile("test.vcd");
$dumpvars(0,dff_tb);
  
    clk <= 0;
    reset <= 1;
    en <= 0;
    din <= 0;            #20;
    reset <= 0;
    en <= 1;
    din <= 1;           #20;
    din<=0;             #20;

     $finish;
end

initial begin
    $monitor("clk=%b re=%b en=%b   din=%b   dout=%b\n ",clk,reset,en,din,dout);
end


endmodule


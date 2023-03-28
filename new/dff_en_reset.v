module dff(input din , input en , input clock , input reset , output reg   dout);
always @(posedge clock ,posedge reset)
begin
    if(reset)
        dout<=0;
    else if(en==1)
        dout<=din;
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
  
  /* clk <= 0;
    reset <= 1;
    en <= 0;
    din <= 0;
            #20;
    reset <= 0;
    en <= 1;
    din <= 1;
            #20;
   
   
   */ clk<=0;
    reset<=1;en<=1;din<=1; #20;
    reset<=1;en<=1;din<=0; #20;
    reset<=1;en<=0;din<=1; #20;
    reset<=1;en<=0;din<=0; #20;
    reset<=0;en<=1;din<=1; #20;
    reset<=0;en<=1;din<=0; #20;
    reset<=0;en<=0;din<=1; #20;
    reset<=0;en<=0;din<=0; #20;
   
    
     $finish;
end

initial begin

    $monitor("clk=%b re=%b en=%b   din=%b   dout=%b\n ",clk,reset,en,din,dout);
end


endmodule


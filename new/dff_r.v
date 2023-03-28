module  dff (input clock , input [7:0] Din , output reg [7:0] Dout ,input reset );


always @(posedge clock,posedge reset) 
begin
    if(reset==1)
    Dout<=0;
    else
    Dout<=Din;
end
    
endmodule

`timescale 1ns/1ns


module dff_tb;

reg clk ;
reg reset;
reg [7:0] Din ;
wire [7:0] Dout;

dff dip(clk,Din,Dout,reset);

always 
begin
    clk=~clk;
    #10;
    end

initial begin

    $dumpfile("test.vcd");
    $dumpvars(0,dff_tb);
     clk<=0;reset<=0;
     Din<=8'b10011000;#20;
     Din<=8'b11111100;#20;
     reset<=1;
      Din<=10011110;#20;
      reset<=0;
     Din<=10000001;#20;
     $finish;

end
initial begin
     $monitor("reset=%b clk=%b  Din=%b  Dout=%b\n",reset,clk,Din,Dout);
end


endmodule




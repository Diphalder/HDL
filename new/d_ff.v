module  dff (input clock , input [7:0] Din , output reg [7:0] Dout );


always @(posedge clock) 
begin
    Dout<=Din;
end
    
endmodule

`timescale 1ns/1ns


module dff_tb;

reg clk ;
reg [7:0] Din ;
wire [7:0] Dout;

dff dip(clk,Din,Dout);

always 
begin
    clk=~clk;
    #10;
    end

initial begin
     clk<=0;
     Din<=8'b10011000;#20;
     Din<=8'b11111100;#20;
      Din<=8'b10011110;#20;
     Din<=8'b10000001;#20;
     $finish;

end
initial begin
     $monitor("clk=%b  Din=%b  Dout=%b\n",clk,Din,Dout);
end


endmodule




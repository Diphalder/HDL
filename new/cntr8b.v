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



module addone( input [7:0] in, output [7:0] out );

assign out = in+1;

endmodule

module cntr8b( input  reset , input clk ,output [7:0] data );

wire [7:0] r_out;
wire [7:0] r_in;
wire en;
assign en=1;
reg8 dipReg_1(r_in,reset,en,clk,r_out );
addone dipaddone_1(r_out,r_in);
assign data=r_out;

endmodule


`timescale 1ps/1ps


module cntr8b_tb;
reg  reset ;
reg clk ;
wire [7:0] data;

cntr8b dip(reset,clk,data);

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
    #20;
    #20;
    
    $finish;
end


initial
begin
    $monitor("data=%b \n",data);
end

endmodule








module reg8(input [7:0] din , input clk , input reset , input en , output [7:0] dout )  ;

wire [7:0] r_in;
reg [7:0] r_out;

always @ (posedge clk , posedge reset)
begin
    if(reset)
        r_out<=8'b11111111;
    else  
        r_out<=r_in;
end


assign dout=r_out;
assign r_in=en?din:r_out;

endmodule


module subone(input [7:0] I , output [7:0] O );
assign O=I-1;
endmodule


module downcount(input clk , input start , output [7:0] data );

wire [7:0] r_in;
wire [7:0] r_out;

wire en;
assign en=1;


reg8 regdip(r_in, clk,start,en,r_out);
subone subdip(r_out,r_in);
assign data=r_out;

endmodule




`timescale 1ps/1ps


module downcounter_tb;
reg  start ;
reg clk ;
wire [7:0] data;

downcount dip(clk,start,data);

always begin

    clk=~clk;
    #10;

end

initial begin

    clk<=0;
    start<=1;
    #20;
    start<=0;
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





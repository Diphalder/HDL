module cntr1to10(input clk, input reset , output [3:0] data);

reg [3:0] rout;
reg  [3:0] rin;


always @(posedge clk , posedge reset)
begin
    if(reset)
        rout<=4'b0000;
    else
        rout<=rin;     
end

always @ *
begin
    if(rout==4'b1010)
        rin=4'b0000;
    else 
        rin=rout+1;
end

assign data=rout;


endmodule

`timescale 1ps/1ps


module tb();
reg clk;
reg reset ;
wire [3:0] data;

cntr1to10 dip(clk,reset,data);

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
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
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
    $monitor("%d\n",data);


end

endmodule



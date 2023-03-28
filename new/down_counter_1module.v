module upcntr(input clock , input start , output reg [7:0] data);

//sequential logic circuit
always @(posedge clock , posedge start)
begin
    if(start)
        data<=8'b11111111;
    else
        data<=data-1;
end

endmodule

`timescale  1ns/1ns


module upcntr_tb;
reg clock ;
reg  start ;
wire [7:0] data;

upcntr dip(clock, start,data);


always begin
    clock=~clock;
    #10;
end
initial begin
    clock<=0;
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
    #20;
    #20;
    #20;
    $finish;

end

initial begin
    $monitor("%b %b\n",clock,data);
end

endmodule

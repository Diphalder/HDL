module upcntr(input clock , input start , output [7:0] data);

reg [7:0] r_out;
wire [7:0] r_in;

//sequential logic circuit
always @(posedge clock , posedge start)
begin
    if(start)
        r_out<=8'b1111_1111;
    else
        r_out<=r_in;
end

//conbinational
assign data=r_out;
assign r_in=r_out-1;


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
    $monitor("%b\n",data);
end

endmodule

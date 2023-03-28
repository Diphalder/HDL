module and2(
    input a,
    input b,
    output y
);
assign y=a&b;
endmodule

`timescale 1ps/1ps
module and2_tb;
reg a;
reg b;
wire y;
and2 uut(.a(a),.b(b),.y(y));
initial begin
    a=0; b=0 ; #10;
    a=0; b=1 ; #10;
    a=1; b=0 ; #10;
    a=1; b=1 ; #10;
end

initial begin
    $monitor("a=%b b=%b y=%b\n",a,b,y);
end
endmodule







module bitdemux1to4(input [1:0] a , input [1:0] s , output [7:0] z );

assign z[7:6]= s[1]&s[0]?a:2'b00;
assign z[5:4]= s[1]&~s[0]?a:2'b00;
assign z[3:2]=~s[1]&s[0]?a:2'b00;
assign z[1:0]=~s[1]&~s[0]?a:2'b00;

endmodule

`timescale 1ns/1ns


module bitdemux1to4_tb;
reg [1:0]a;
reg  [1:0] s;
wire [7:0] z;

bitdemux1to4 dip(a,s,z);


initial begin
    a=2'b01;
    s=2'b00; #10;
    s=2'b11; #10;
    s=2'b10; #10;
    s=2'b01; #10;

end

initial begin
    $monitor("data=%b  selection line=%d  output=%b %b %b %b \n",a,s,z[7:6],z[5:4],z[3:2],z[1:0]);
    end


endmodule



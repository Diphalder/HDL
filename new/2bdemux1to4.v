module bitdemux1to4(input [1:0] a , input [1:0] s , output reg [7:0] z );
always @(*)
begin
    z=8'b00000000;
    if(s==2'b00)
        z[1:0]=a;
    else if(s==2'b01)
        z[3:2]=a;
    else if(s==2'b10)
        z[5:4]=a;
    else if(s==2'b11)
        z[7:6]=a;    
end
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



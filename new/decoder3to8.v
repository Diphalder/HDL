module decoder3to8(input [2:0] S ,input en , output reg [7:0] D );

always@(*) begin

    case ({en,S})
        4'b1000:D=8'b0000_0001;
        4'b1001:D=8'b0000_0010;
        4'b1010:D=8'b0000_0100;
        4'b1011:D=8'b0000_1000;
        4'b1100:D=8'b0001_0000;
        4'b1101:D=8'b0010_0000;
        4'b1110:D=8'b0100_0000;
        4'b1111:D=8'b1000_0000;
        default: D=8'b0000_0000; 
    endcase
  
end

endmodule

`timescale  1ns/1ns


module tb();

reg [2:0] S;
reg en ;
wire [7:0] A;

decoder3to8 dip(S,en, A);


initial begin
    en=0; S=3'b000; #10;
    en=0; S=3'b010; #10;
    en=0; S=3'b100; #10;
    
    en=1; S=3'b000; #10;
    en=1; S=3'b001; #10;
    en=1; S=3'b010; #10;
    en=1; S=3'b011; #10;
    en=1; S=3'b100; #10;
    en=1; S=3'b101; #10;
    en=1; S=3'b110; #10;
    en=1; S=3'b111; #10;

end



initial begin
    $monitor("en=%b S=%b A=%b\n ",en,S,A);

end

endmodule
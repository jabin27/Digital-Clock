module seven_segment_decoder1(bcd,seven_seg_out);

input wire [3:0] bcd;
output wire [6:0] seven_seg_out;

reg [6:0] seven_seg;

assign seven_seg_out = seven_seg;

always @(bcd)
 begin
  case (bcd)
   4'b0000 : begin seven_seg = 7'b1000000; end
   4'b0001 : begin seven_seg = 7'b1111001; end
   4'b0010 : begin seven_seg = 7'b0100100; end
   4'b0011 : begin seven_seg = 7'b0110000; end
   4'b0100 : begin seven_seg = 7'b0011001; end
   4'b0101 : begin seven_seg = 7'b0010010; end
   4'b0110 : begin seven_seg = 7'b0000010; end
   4'b0111 : begin seven_seg = 7'b1111000; end
   4'b1000 : begin seven_seg = 7'b0000000; end
   4'b1001 : begin seven_seg = 7'b0011000; end
   default : begin seven_seg = 7'b0000000; end
  endcase
 end
endmodule
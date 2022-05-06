module shift_reg_5bit_universal(po,so,pi,si,clk,rst,sel);
  input si,clk,rst;
  input [1:0] sel;
  input [4:0] pi;
  output reg so;
  output reg [4:0] po;
  always @(posedge clk) begin
    if (rst)
      po <= 5'b0;
    else begin
      case (sel)
        2'b00 : po <= po;
        2'b01 : po <= {pi[3:0],si};
        2'b10 : po <= {si,pi[4:1]};
        2'b11 : po <= pi;
        default: po <= 0;
      endcase
    end
   end
  assign so = (sel==2'b01)?po[4]:po[0];
endmodule

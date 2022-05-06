module freq_divide_3(clk_out,pos_count,neg_count,clk_in);
  input clk_in;
  output reg clk_out;
  output reg [1:0] pos_count=0, neg_count=0;
  always @(posedge clk_in) begin
    if (pos_count==2)
      pos_count <= 0;
    else
      pos_count <= pos_count + 1'b1;
  end
  always @(negedge clk_in) begin
    if (neg_count==2)
      neg_count <= 0;
    else
      neg_count <= neg_count + 1'b1;
  end
  assign clk_out = ((pos_count==2) | (neg_count==2));
endmodule

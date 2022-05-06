module counter_range_up_down_load(count,clk,rst,first,last,load,u_d);
  input clk,rst,load,u_d;
  input [7:0] first,last;
  output reg [7:0] count;
  always @(posedge clk) begin
    if (rst | count>last | load)
      count <= first;
    else if (count<=first)
      count <= last;
    else if(u_d)
      count <= count + 1'b1;
    else
      count <= count - 1'b1;
  end
endmodule

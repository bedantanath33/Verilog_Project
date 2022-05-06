module tb_counter_range_up_down_load;
  reg clk,rst,load,u_d;
  reg [7:0] first,last;
  wire [7:0] count;
  counter_range_up_down_load c1(count,clk,rst,first,last,load,u_d);
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    rst = 1;	first=8'd11;	last=8'd25;	u_d = 1;
    $monitor("%d count=%d",$time,count);
    #10 rst = 0;
    #100 rst = 1;
    #10 rst = 0;
    #30 load = 1;
    #30 load = 0;
    #100 u_d = 0;
    #200 $stop;
  end
endmodule

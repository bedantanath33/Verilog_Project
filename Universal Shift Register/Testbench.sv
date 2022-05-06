module tb_shift_reg_5bit_universal;
  reg si,clk,rst;
  reg [1:0] sel;
  reg [4:0] pi;
  wire so;
  wire [4:0] po;
  shift_reg_5bit_universal sr1(po,so,pi,si,clk,rst,sel);
  
  initial begin
    clk = 0;
    forever
      #10 clk = ~clk;
  end
  
  initial begin
    rst = 1'b0;	
    si = 1'b0;	
    pi = 5'd31;	
    sel = 2'b00;
    $monitor("%d rst=%b clk=%b si=%b po=%b%b%b%b%b so=%b", $time, rst, clk, si, po[4], po[3], po[2], po[1], po[0], so);
    #10 si = 1'b0;	sel = 2'b01;	pi = po;
    #10 si = 1'b1;	sel = 2'b01;	pi = po;
    #10 si = 1'b0;	sel = 2'b01;	pi = po;
    #10 si = 1'b0;	sel = 2'b01;	pi = po;
    #10 si = 1'b1;	sel = 2'b01;	pi = po;
    #10 si = 1'b0;	sel = 2'b01;	pi = po;
    #10 si = 1'b1;	sel = 2'b01;	pi = po;
    #10 si = 1'b0;	sel = 2'b01;	pi = po;
    #10 si = 1'b1;	sel = 2'b01;	pi = po;
    #10 si = 1'b0;	sel = 2'b01;	pi = po;
    #10 si = 1'b0;	sel = 2'b01;	pi = po;
    #10 si = 1'b1;	sel = 2'b01;	pi = po;
    #10 si = 1'b0;	sel = 2'b01;	pi = po;
    #10 si = 1'b1;	sel = 2'b01;	pi = po;
    #10 $stop;
  end
endmodule

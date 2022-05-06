module button_control(valid_vote,clk,rst,button);
  input clk,rst,button;
  output reg valid_vote;
  reg [30:0] counter;	//for long enough time check
  always @ (posedge clk) begin
    if (rst)
      counter <= 0;
    else begin
      if (button & counter<11)
        counter <= counter + 1;
      else 
        counter <= 0;
    end
  end
  always @ (posedge clk) begin
    if (rst)
      valid_vote <= 1'b0;
    else begin
      if (counter == 10)
        valid_vote <= 1'b1;
      else
        valid_vote <= 1'b0;
    end
  end
endmodule




module vote_logger(cand1_vote_received, cand2_vote_received, cand3_vote_received, cand4_vote_received, clk, rst, mode, cand1_vote_valid, cand2_vote_valid, cand3_vote_valid, cand4_vote_valid);
  input clk, rst, mode;
  input cand1_vote_valid, cand2_vote_valid, cand3_vote_valid, cand4_vote_valid;
  output reg [7:0] cand1_vote_received, cand2_vote_received, cand3_vote_received, cand4_vote_received;
  always @ (posedge clk) begin
    if (rst) begin
      cand1_vote_received <= 0;
      cand2_vote_received <= 0;
      cand3_vote_received <= 0;
      cand4_vote_received <= 0;
    end
    else begin
      if (cand1_vote_valid & mode==0)
        cand1_vote_received <= cand1_vote_received + 1;
      else if (cand2_vote_valid & mode==0)
        cand2_vote_received <= cand2_vote_received + 1;
      else if (cand3_vote_valid & mode==0)
        cand3_vote_received <= cand3_vote_received + 1;
      else if (cand4_vote_valid & mode==0)
        cand4_vote_received <= cand4_vote_received + 1;      
    end
  end
endmodule





module mode_control(leds, clk, rst, mode, valid_vote_casted, cand1_vote, cand2_vote, cand3_vote, cand4_vote, cand1_button_press, cand2_button_press, cand3_button_press, cand4_button_press);
  input clk, rst, mode, valid_vote_casted;
  input [7:0] cand1_vote, cand2_vote, cand3_vote, cand4_vote;
  input cand1_button_press, cand2_button_press, cand3_button_press, cand4_button_press;
  output reg [7:0] leds;
  reg [30:0] counter;
  always @ (posedge clk) begin
    if (rst)
      counter <= 0;
    else if (valid_vote_casted)
      counter <= counter + 1;
    else if (counter != 0 & counter<10)
      counter <= counter + 1;
    else
      counter <= 0;
  end
  always @ (posedge clk) begin
    if (rst)
      leds <= 0;
    else begin
      if (mode == 0 & counter > 0)
        leds <= 8'hFF;
      else if (mode == 0 & counter < 10)
        leds <= 8'h00;
      else if (mode == 1)begin
        if (cand1_button_press)
          leds <= cand1_vote;
        else if (cand2_button_press)
          leds <= cand2_vote;
        else if (cand3_button_press)
          leds <= cand3_vote;
        else if (cand4_button_press)
          leds <= cand4_vote;        
      end
    end
  end
endmodule





module voting_machine(led, clk, rst, mode, button1, button2, button3, button4);
  input clk, rst, mode;
  input button1, button2, button3, button4;
  output reg [7:0] led;
  wire valid_vote_1, valid_vote_2, valid_vote_3, valid_vote_4;
  wire [7:0] cand1_vote_received, cand2_vote_received, cand3_vote_received, cand4_vote_received;
  wire any_valid_vote;
  
  assign any_valid_vote = valid_vote_1 | valid_vote_2 | valid_vote_3 | valid_vote_4;
  
  button_control bc1(.valid_vote(valid_vote_1),.clk(clk),.rst(rst),.button(button1));
  button_control bc2(.valid_vote(valid_vote_2),.clk(clk),.rst(rst),.button(button2));
  button_control bc3(.valid_vote(valid_vote_3),.clk(clk),.rst(rst),.button(button3));
  button_control bc4(.valid_vote(valid_vote_4),.clk(clk),.rst(rst),.button(button4));
  
  vote_logger vl(
    .cand1_vote_received(cand1_vote_received), 
    .cand2_vote_received(cand2_vote_received), 
    .cand3_vote_received(cand3_vote_received), 
    .cand4_vote_received(cand4_vote_received), 
    .clk(clk),
    .rst(rst),
    .mode(mode), 
    .cand1_vote_valid(valid_vote_1), 
    .cand2_vote_valid(valid_vote_2), 
    .cand3_vote_valid(valid_vote_3), 
    .cand4_vote_valid(valid_vote_4)    
  );
  
   mode_control m1(
     .leds(led), 
     .clk(clk),
     .rst(rst),
     .mode(mode), 
     .valid_vote_casted(any_valid_vote), 
     .cand1_vote(cand1_vote_received), 
     .cand2_vote(cand2_vote_received), 
     .cand3_vote(cand3_vote_received), 
     .cand4_vote(cand4_vote_received),     
     .cand1_button_press(button1), 
     .cand2_button_press(button2), 
     .cand3_button_press(button3), 
     .cand4_button_press(button4)      
   );
  
endmodule

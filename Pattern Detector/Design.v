module detect_1011 (detector_output,sequence_in,clk,rst);
    input clk,rst;
    input sequence_in;  //binary input 1 or 0
    output reg detector_output;
    parameter Zero = 3'b000,
                One = 3'b001,
                OneZero = 3'b011,
                OneZeroOne = 3'b010,
                OneZeroOneOne = 3'b110;
    reg [2:0] curr_state, next_state;
    always @(posedge clk,posedge rst) begin
        if(rst)
            curr_state <= Zero;
        else
            curr_state <= next_state;
    end

    //combinational logic of the Moore FSM to determine next state
    always @(curr_state,sequence_in) begin
        case (curr_state)
            Zero :  begin
                        if(sequence_in==1)
                            next_state = One;
                        else
                            next_state = Zero;
                    end
            One :  begin
                        if(sequence_in==0)
                            next_state = OneZero;
                        else
                            next_state = One;
                    end
            OneZero : begin
                        if(sequence_in==1)
                            next_state = OneZeroOne;
                        else
                            next_state = Zero;
                    end
            OneZeroOne : begin
                        if(sequence_in==1)
                            next_state = OneZeroOneOne;
                        else
                            next_state = Zero;
                    end
            OneZeroOneOne : begin
                        if(sequence_in==0)
                            next_state = OneZero;
                        else
                            next_state = One;
                    end
            default: next_state = Zero;
        endcase
    end

    // combinational logic to determine the output
    // of the Moore FSM, output only depends on current state
    always @(curr_state) begin
        case (curr_state)
            Zero : detector_output = 0;
            One : detector_output = 0;
            OneZero : detector_output = 0;
            OneZeroOne : detector_output = 0;
            OneZeroOneOne : detector_output = 1;            
            default: detector_output = 0;
        endcase
    end
endmodule

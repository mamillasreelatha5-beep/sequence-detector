module sequence_detector (
    input clk,
    input reset,
    input data_in,
    output reg detected
);

    // State declaration
    reg [1:0] state;

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    always @(posedge clk) begin

        if (reset) begin
            state <= S0;
            detected <= 1'b0;
        end

        else begin

            detected <= 1'b0;

            case (state)

                // No bits detected
                S0: begin
                    if (data_in)
                        state <= S1;
                    else
                        state <= S0;
                end

                // Received 1
                S1: begin
                    if (data_in)
                        state <= S1;
                    else
                        state <= S2;
                end

                // Received 10
                S2: begin
                    if (data_in)
                        state <= S3;
                    else
                        state <= S0;
                end

                // Received 101
                S3: begin
                    if (data_in) begin
                        detected <= 1'b1;
                        state <= S1;
                    end
                    else begin
                        state <= S2;
                    end
                end

                default: begin
                    state <= S0;
                end

            endcase

        end

    end

endmodule

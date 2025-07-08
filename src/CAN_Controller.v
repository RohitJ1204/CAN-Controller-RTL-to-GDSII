module CAN_Controller` (
    input wire clk,
    input wire rst,
    input wire [10:0] id,  // CAN Identifier
    input wire [7:0] data, // Data to be transmitted
    input wire send,       // Send command
    output reg tx,         // Transmit line
    output reg busy        // Busy signal
);
    // State machine 

       parameter IDLE=2'b00;
       parameter START=2'b01;
       parameter TRANSMIT_ID=2'b10;
       parameter TRANSMIT_DATA=2'b11;
       parameter STOP=2'b00;
        

    reg[1:0]nxt_state,state;
    reg [3:0] bit_cnt;
    reg [10:0] id_reg;
    reg [7:0] data_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            tx <= 1'b1;
            busy <= 1'b0;
            bit_cnt <= 4'd0;
        end else begin
            case (state)
                IDLE: begin
                    tx <= 1'b1;
                    busy <= 1'b0;
                    bit_cnt <= 4'd0;
                    if (send) begin
                        id_reg <= id;
                        data_reg <= data;
                        state <= START;
                        busy <= 1'b1;
                    end
                end
                START: begin
                    tx <= 1'b0; // Start bit
                    state <= TRANSMIT_ID;
                    bit_cnt <= 4'd0;
                end
                TRANSMIT_ID: begin
                    if (bit_cnt < 4'd11) begin
                        tx <= id_reg[bit_cnt]; // Transmit ID
                        bit_cnt <= bit_cnt + 1;
                    end else begin
                        state <= TRANSMIT_DATA;
                        bit_cnt <= 4'd0;
                    end
                end
                TRANSMIT_DATA: begin
                    if (bit_cnt < 4'd8) begin
                        tx <= data_reg[bit_cnt]; // Transmit Data
                        bit_cnt <= bit_cnt + 1;
                    end else begin
                        state <= STOP;
                    end
                end
                STOP: begin
                    tx <= 1'b1; // Stop bit
                    state <= IDLE;
                    busy <= 1'b0;
                end
            endcase
        end
    end
endmodule




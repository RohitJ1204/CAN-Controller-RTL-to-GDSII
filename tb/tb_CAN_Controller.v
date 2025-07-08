module tb_CAN_Controller;
    reg clk;
    reg rst;
    reg [10:0] id;
    reg [7:0] data;
    reg send;
    wire tx;
    wire busy;

    // Instantiate the CAN controller
    CAN_Controller uut (
        .clk(clk),
        .rst(rst),
        .id(id),
        .data(data),
        .send(send),
        .tx(tx),
        .busy(busy)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        id = 11'b10101010101;
        data = 8'b11001100;
        send = 0;

        // Reset the design
        #10 rst = 0;

        // Send a frame
        #10 send = 1;
        #10 send = 0;

        // Wait for transmission to complete
        wait (!busy);

        // Stop simulation
        #100 $stop;
    end
endmodule




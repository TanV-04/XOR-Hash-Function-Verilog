module tb_hash;

    reg clk, reset;
    reg [127:0] message;
    wire [31:0] hash_result;

    top_hash uut (
        .clk(clk),
        .reset(reset),
        .message(message),
        .hash_result(hash_result)
    );
    initial begin
        clk = 0;
        reset = 1;
        #5 reset = 0;

        // Example message - you can change this
        message = 128'hDEADBEEFCAFEBABE123456789ABCDEF0;

        #10;  // Wait for output to settle

        $display("Message : %h", message);
        $display("Hash    : %h", hash_result);

        #20 $finish;
    end

    always #5 clk = ~clk;

endmodule

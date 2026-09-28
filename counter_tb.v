module counter_tb;
    // Signals to connect to our counter
    reg clk;
    reg reset;
    reg enable;
    wire [3:0] count;

    // Instantiate (hook up) our counter module
    counter uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Generate a clock: flips value every 5 time units
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        enable = 0;

        // Print header and monitor changes automatically
        $monitor("Time=%0t | Reset=%b | Enable=%b | Count=%0d (Binary: %b)", 
                 $time, reset, enable, count, count);

        // Release reset after 10 units
        #10 reset = 0;
        
        // Turn on enable so it starts counting
        #10 enable = 1;
        
        // Pause counting for a bit
        #30 enable = 0; 
        
        // Resume counting
        #20 enable = 1; 
        
        // End simulation after 100 time units
        #40 $finish;
    end
endmodule

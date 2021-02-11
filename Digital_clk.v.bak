`timescale 1ns/1ns
module Digital_clk_tb;

    reg clk_50MHz;  //Clock with 50MHz frequency
    reg reset; //active high reset
    wire [6:0] secondsA;
    wire [6:0] secondsB;
    wire [6:0] minutesA;
    wire [6:0] minutesB;
    wire [6:0] hoursA;
    wire [6:0] hoursB;

    // Instantiate the Unit Under Test (UUT)
    Digital_clk uut (
        clk_50MHz,  //Clock with 50MHz frequency
        reset,     //active high reset
        secondsA,
        secondsB,
        minutesA,
        minutesB,
        hoursA,
        hoursB
    );
    
    //Generating the Clock with `1 Hz frequency
    initial clk_50MHz = 0;
    always #10 clk_50MHz = ~clk_50MHz;  //Every 0.5 sec toggle the clock.

    initial begin
        reset = 1;
        // Wait 100 ns for global reset to finish
        #100;
        reset = 0;  
    end
      
endmodule
module Digital_clk(
    input clk_50MHz ,  //Clock with 50MHz frequency
    input reset,     //active high reset
    output [6:0] secondsA,
    output [6:0] secondsB,
    output [6:0] minutesA,
    output [6:0] minutesB,
    output [6:0] hoursA,
    output [6:0] hoursB);

    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours; 

    reg [3:0] secondsAu;
    reg [3:0] secondsBu;
    reg [3:0] minutesAu;
    reg [3:0] minutesBu;
    reg [3:0] hoursAu;
    reg [3:0] hoursBu;

    reg [24:0] clk_half_max;
    reg [24:0] clk_count;
    reg clk_1hz;

    Digital_clk_impl impl(clk_1hz, reset, seconds, minutes, hours);
	

    seven_segment_decoder1 dSecA(secondsAu,secondsA);
    seven_segment_decoder1 dSecB(secondsBu,secondsB);
    seven_segment_decoder1 dMinA(minutesAu,minutesA);
    seven_segment_decoder1 dMinB(minutesBu,minutesB);
    seven_segment_decoder1 dHourA(hoursAu,hoursA);
    seven_segment_decoder1 dHourB(hoursBu,hoursB);

    initial begin
        clk_half_max = 25'd25000000; // comment this line if debugging
        //clk_half_max = 25'd25; //uncomment this line for debugging
        clk_count = 25'd0;
        clk_1hz = 1'b0;
    end

    always @(posedge clk_50MHz) begin
        clk_count = clk_count + 1;
        if (clk_count >= clk_half_max) begin
            clk_count = 25'd0;
            clk_1hz = ~clk_1hz;
        end
    end

    always @(seconds) begin
        secondsAu = seconds % 10;
        secondsBu = seconds / 10;
    end

    always @(minutes) begin
        minutesAu = minutes % 10;
        minutesBu = minutes / 10;
    end

    always @(hours) begin
        hoursAu = hours % 10;
        hoursBu = hours / 10;
    end
    
endmodule
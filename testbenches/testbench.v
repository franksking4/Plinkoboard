`define STRINGIFY(DEFINE) $sformatf("%0s", `"DEFINE`")

`define assert(assertion) \
  if (!(assertion)) begin \
    $display("ASSERTION FAILED in %m: %s", `STRINGIFY(assertion)); \
    $fatal; \
end

module plinkotb;
  // Clocking and control
  reg clk, rst;
  reg[6:0] randChoice;
  wire[4:0] count1,count2,count3,count4,count5,count6,count7,count8;
  wire[2:0] ballLocation;

  reg[6:0] randInt;
  wire[2:0] location;

  integer i,j,k;

  plinkoboard plinkoboard0(clk,rst,randChoice,count1,count2,count3,count4,count5,count6,count7,count8,ballLocation);
  ballLocator locator0(randInt, location);

  initial begin
    $dumpfile("build/tb-processor.vcd");  // Dump waveforms to file 'dump.vcd'
    $dumpvars;

    // Any time there's a change in output signals, output them to log
    $monitor("Time=%03tms, Clock=%b, Reset=%b, RandChoice=%b, Count1=%d, Count2=%d, Count3=%d, Count4=%d, Count5=%d, Count6=%d, Count7=%d, Count8=%d, BallLocation=%d", $time, clk, rst, randChoice, count1, count2, count3, count4, count5, count6, count7, count8, ballLocation);

    // Resets all of the counters:
    rst = 1; clk =0; #10;

    // Does one clock cycle while setting reset to 0;
    clk=1; #10;
    clk=0; rst=0; #10;

    // Generates 80 random numbers:
    for (i = 0; i < 80; i++) begin
      randChoice = $random % 127;

      // Clock Cycles:
      clk = ~clk; #10;
      clk = ~clk; #10;
    end

    // Outputs one bar for each ball that has fallen in Count 1:
    $write("\nCount1 = %02d: ",count1);
    for (j = 0; j<count1; j++) begin
      $write("| ");
    end

    // Outputs one bar for each ball that has fallen in Count 2:
    $write("\nCount2 = %02d: ",count2);
    for (j = 0; j<count2; j++) begin
      $write("| ");
    end

    // Outputs one bar for each ball that has fallen in Count 3:
    $write("\nCount3 = %02d: ",count3);
    for (j = 0; j<count3; j++) begin
      $write("| ");
    end

    // Outputs one bar for each ball that has fallen in Count 4:
    $write("\nCount4 = %02d: ",count4);
    for (j = 0; j<count4; j++) begin
      $write("| ");
    end

    // Outputs one bar for each ball that has fallen in Count 5:
    $write("\nCount5 = %02d: ",count5);
    for (j = 0; j<count5; j++) begin
      $write("| ");
    end
    
    // Outputs one bar for each ball that has fallen in Count 6:
    $write("\nCount6 = %02d: ",count6);
    for (j = 0; j<count6; j++) begin
      $write("| ");
    end

    // Outputs one bar for each ball that has fallen in Count 7:
    $write("\nCount7 = %02d: ",count7);
    for (j = 0; j<count7; j++) begin
      $write("| ");
    end

    // Outputs one bar for each ball that has fallen in Count 8:
    $write("\nCount8 = %02d: ",count8);
    for (j = 0; j<count8; j++) begin
      $write("| ");
    end
    
  end
endmodule
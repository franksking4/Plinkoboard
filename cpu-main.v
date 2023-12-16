module ballLocator(randInt, location);
  input[6:0] randInt;
  output reg[2:0] location;

  // Integer used for the clock:
  integer i;

  // Location is incremented by 1 for each "1" in randInt:
  always @(randInt) begin
    location = 0;
    for (i=0;i<7;i=i+1) begin
      if (randInt[i] == 1'b1) begin
        location = location + 1;
      end
    end
  end
endmodule

module plinkoboard(clk,rst,randChoice,count1,count2,count3,count4,count5,count6,count7,count8,ballLocation);
  input clk, rst;
  input[6:0] randChoice;
  output [4:0] count1, count2, count3, count4, count5, count6, count7, count8;

  // Takes the value inputed inside randChoice and puts the location that the ball falls in into a wire named ballLoc:
  ballLocator ball0(randChoice,ballLoc);
  wire[2:0] ballLoc;

  // Assigns ballLoc to the output ballLocation:
  output[2:0] ballLocation;
  assign ballLocation = ballLoc;

  // Creates a 5-bit register for each of the locations that the ball can fall in:
  reg [4:0] counts[0:7];

  // Integer used for the clock:
  integer i;

  // If reset is 0, all of the count registers are reset back to 0. At the positive edge of the clock, the counter at location ballLoc is incremented by 1.
  always @(posedge clk) begin
    if (rst) begin
      for (i=0; i<8; i++) begin
        counts[i] = 0;
      end
    end else begin
      counts[ballLoc] = counts[ballLoc] + 1;
    end
  end

  // Assigns counts 1-8 to the corresponding counts register;
  assign count1 = counts[0];
  assign count2 = counts[1];
  assign count3 = counts[2];
  assign count4 = counts[3];
  assign count5 = counts[4];
  assign count6 = counts[5];
  assign count7 = counts[6];
  assign count8 = counts[7];
endmodule
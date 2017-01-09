module happyNY(
  input  logic clk,
  input  logic rst,

  output logic [7:0] symbol
);

  logic [0:15][7:0] hello;
  assign hello = "HAPPY NEW YEAR!\0";

  logic [3:0] counter;
  
  assign symbol = rst ? "\0" : hello[counter];
  
  always_ff @( posedge clk )
    if ( rst )
      counter <= '0;
    else
      counter <= counter + 4'd1;

endmodule

module tb;

  logic clk;
  logic rst;

  logic [7:0] symbol;
  
  happyNY DUT(
    .clk(clk),
    .rst(rst),
    .symbol(symbol)
  );
  
  initial begin
    clk = 1;
    rst = 1;
    
    #50ns;
    rst = 0;
    #330ns;
    $stop;
  end
  
  always begin
    #10ns;
    clk = ~clk;
  end

endmodule

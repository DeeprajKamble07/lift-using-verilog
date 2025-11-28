// testbench for list

module tb;
  reg clk,rst;
  reg [1:0]datain;
  wire gndF,fstF,sndF,trdF;
  lift dut(clk,rst,datain,gndF,fstF,sndF,trdF);
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  initial begin
    rst=1;
    #10 rst=0; datain=2'b00;
    #10 datain=2'b10;
    #10 datain=2'b01;
    #10 datain=2'b11;
    #10 datain=2'b00;
    #10 datain=2'b01;
    #10 datain=2'b11;
    #10 datain=2'b00;
    #10 datain=2'b10;
    #10 datain=2'b01;
    #10 $finish;
  end
  initial begin
    $monitor("[%0t] clk=%0b rst=%0b datain=%0b gndF=%0b fstF=%0b sndF=%0b trdF=%0b",$time,clk,rst,datain,gndF,fstF,sndF,trdF);
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule

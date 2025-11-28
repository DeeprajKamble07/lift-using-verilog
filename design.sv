// design for lift

module lift(input clk,rst,input[1:0]datain,output reg gndF,fstF,sndF,trdF);
  reg[1:0]cs,ns;
  parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        cs<=s0;
      else
        cs<=ns;
    end
  always@(*) begin
    case(cs)
      s0: ns=(datain==2'b01)?s1:(datain==2'b10)?s2:(datain==2'b11)?s3:s0;
      s1: ns=(datain==2'b00)?s0:(datain==2'b10)?s2:(datain==2'b11)?s3:s1;
      s2: ns=(datain==2'b00)?s0:(datain==2'b01)?s1:(datain==2'b11)?s3:s2;
      s3: ns=(datain==2'b01)?s1:(datain==2'b10)?s2:(datain==2'b00)?s0:s3;
      default: ns=s0;
    endcase
  end
  always@(*) begin
    gndF=0;fstF=0;sndF=0;trdF=0;
    case(cs)
      s0: gndF=1;
      s1: fstF=1;
      s2: sndF=1;
      s3: trdF=1;
      default: begin
        gndF=0;fstF=0;sndF=0;trdF=0;
      end
    endcase
  end
endmodule

// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
  #(
  parameter DEPTH=8,
  parameter BITS=64
  )
  (
  input clk,rst_n,en,
  input [BITS-1:0] d,
  output [BITS-1:0] q
  );


  // your RTL code here

reg [63:0] queue[7:0];

integer i=0;
integer p = 0;
assign q = queue[p]; 

always@(posedge clk, negedge rst_n) begin
    if(~rst_n)begin
      for(i=0; i<8; i++)begin
        queue[i]<=64'd0;
      end
    end
      //reset all slots to 0;
     else if(en) begin
      queue[p]<=d;
      p<= (p +1)%8;
    end
end


endmodule

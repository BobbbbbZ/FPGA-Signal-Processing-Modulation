module domainp (input logic fast_clk,
					 input logic slow_clk,
					 input logic [11:0] data,
					 output logic [11:0] d
					 );

	logic [11:0] reg1, reg3;

// Registers for enable signal for reg3
logic q1, enable;

always_ff @ (posedge fast_clk) begin
  reg1 <= data;
end

always_ff @ (posedge fast_clk) begin
  if(enable) reg3 <= reg1;
end

always_ff @ (posedge slow_clk) begin
  d <= reg3;
end

always_ff @ (negedge fast_clk) begin
  q1 <= slow_clk;
end

always_ff @ (negedge fast_clk) begin
  enable <= q1;
end

endmodule
module lfsr(
	input logic clk,
	input logic rst,
	output logic [4:0] lfsr = 5'b1
);

logic xor_calc;
assign xor_calc = lfsr[0] ^ lfsr[2];

always_ff @ (posedge clk, negedge rst) begin
	if (~rst) lfsr <= 5'b1;
	else lfsr <= {{xor_calc},{lfsr[4:1]}};
end

endmodule
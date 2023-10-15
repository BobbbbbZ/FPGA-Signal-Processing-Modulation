module tb_lfsr();

logic clk;
logic reset_n;
logic [4:0] lfsr;
//logic xor_calc;

lfsr lfsr_inst (
	.clk(clk),
	.rst(reset_n),
	.lfsr(lfsr)
);

// generate clock
always begin
clk = 0; #2;
clk = 1; #2;
end

// Set reset to HIGH. It is active LOW.
initial begin
reset_n = 0; #2;
reset_n = 1;
end

endmodule

`timescale 1ns/1ns

module tb_waveform_gen;

	logic clk;
	logic [31:0] reset;

	logic [11:0] sin_wave, cos_wave, squ_wave, saw_wave;

	// 32'd258 is the calculated value for 3Hz

	//create a waveform gen
	waveform_gen DUT(
		// Inputs
		.clk(clk),
		.reset(32'b1),	//reset key unknown
		.en(32'b1),		//enable
		.phase_inc(32'd42950),

		// Outputs 
		.sin_out(sin_wave),
		.cos_out(cos_wave),
		.squ_out(squ_wave),
		.saw_out(saw_wave)
	);
	initial begin
    clk=0;
    #5;
    forever begin
        clk=1;
        #5;
        clk=0;
        #5;
    end
end

initial begin

	#100000;
	$stop;
end

endmodule
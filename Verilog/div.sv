module div #(parameter d = 10000)
		(input wire inclk, output reg outclk);
		
		reg [26:0] counter = 0;
		initial begin
			outclk = 1'b0;
		end		

		always @(posedge inclk) begin
			if (counter == (d / 2 - 1)) begin // if the counter attends the number we want
				counter <= 0;		// the value of out clock will turn to opposite
				outclk <= ~outclk;
			end else
				counter <= counter + 1;	// else it would just keep adding
		end
endmodule

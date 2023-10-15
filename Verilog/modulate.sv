module modulate(input logic [2:0] modulation_sel,
                input logic [1:0] signal_sel,
                input logic [11:0] signal_sin,
                input logic [11:0] signal_cos,
                input logic [11:0] signal_saw,
                input logic [11:0] signal_sqr,
                input logic [1:0] en,
                output logic [11:0] signal,
                output logic [11:0] signal_mod);

    always_comb begin
            case(modulation_sel)
                3'b000: signal_mod = en[0] ? signal_sin : 12'b0; //ASK_out

                3'b001: signal_mod = signal_sin;

                3'b010: signal_mod = en[0] ? signal_sin : {~signal_sin + 1}; // BPSK_out

                3'b011: signal_mod = en[0] ? 12'b0 : 12'b100000000000;

                3'b100: case(en)
                        2'b00: signal_mod = ~signal_cos;
                        2'b01: signal_mod = signal_sin;
                        2'b10: signal_mod = ~signal_sin;
                        2'b11: signal_mod = signal_cos;
                endcase

                default: signal_mod = en ? 12'b0 : 12'b100000000000;
            endcase
            
            case(signal_sel)
                2'b00:		signal = signal_sin;
                2'b01:		signal = signal_cos;	
                2'b10:		signal = signal_saw;	
                2'b11:		signal = signal_sqr;
            endcase
        end


endmodule
module Gray_Bin (input en, input[2:0] fn, input clk, input rst, input[127:0] i_data, output[127:0] o_data, output o_valid);
    parameter idle = 2'd0;
    parameter bin2gray = 2'd1;
    parameter gray2bin = 2'd2;
    parameter data_out = 2'd3;
    reg [1:0] state, next_state;
    reg [6:0] cnt;
    reg [128:0] data_reg;
    assign o_valid = (state == data_out);
    assign o_data = data_reg[127:0];
    always @(*) begin
        case (state)//state
            idle : begin
                if (en) begin
                    case (fn)
                        `Bin2Gray : next_state = bin2gray;
                        `Gray2Bin : next_state = gray2bin;
                        default : next_state = state;
                    endcase
                end else next_state = idle;
            end
            bin2gray : next_state = (&cnt) ? data_out : bin2gray;
            gray2bin : next_state = (&cnt) ? data_out : gray2bin;
            data_out : next_state = idle;
            default : next_state = state;
        endcase
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= idle;
            cnt <= 0;
            data_reg <= 0;
        end else begin
            state <= next_state;
            cnt <= (^state) ? cnt + 1 : 0;
            case (state)
                idle : data_reg <= (fn == `Bin2Gray) ? {1'b0, i_data} : (fn == `Gray2Bin) ? {i_data, 1'b0} : 0;
                bin2gray : data_reg <= {data_reg[127:0], ^data_reg[128:127]};
                gray2bin : data_reg <= {data_reg[127:0], data_reg[128] ^ data_reg[0]};
                default : data_reg <= data_reg;
            endcase
        end
    end
endmodule
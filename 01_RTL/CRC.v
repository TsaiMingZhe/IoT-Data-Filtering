module CRC (input clk, input rst, input en, input [127:0] i_data, output [2:0] o_data, output o_valid);
    localparam idle = 2'd0;
    localparam load = 2'd1;
    localparam crc_gen = 2'd2;
    localparam crc_out = 2'd3;
    localparam poly = 4'b1011;
    reg [1:0]   state, next_state;
    reg [2:0]   o_data_r;
    reg [3:0]   poly_reg;
    reg [6:0]   crc_cnt;
    reg [127:0] in_reg;
    assign o_valid = (state == crc_out);
    assign o_data = o_data_r;
    always @(*) begin
        case (state)
            idle : next_state = (en) ? load : idle;
            load : next_state = crc_gen;
            crc_gen : next_state = (&crc_cnt) ? crc_out : crc_gen;
            crc_out : next_state = idle;
            default : next_state = state;
        endcase
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= idle;
            poly_reg <= 0;
            in_reg <= 0;
            crc_cnt <= 0;
            o_data_r <= 0;
        end else begin
            state <= next_state;
            in_reg <= (state == load) ? i_data : in_reg << 1;
            if (state == crc_gen) begin
                crc_cnt <= crc_cnt + 1;
                poly_reg <= (poly_reg[3]) ? {poly[2:0] ^ poly_reg[2:0], in_reg[123]} : {poly_reg[2:0], in_reg[123]};
            end else begin
                crc_cnt <= crc_cnt;
                poly_reg <= (state == load) ? i_data[127:124] : poly_reg;
            end
            o_data_r <= (state == crc_out) ? poly_reg[3:1] : 0;
        end
    end
endmodule
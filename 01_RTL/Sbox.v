module Sbox (input [47:0] S_in, output [31:0] S_out);
    S1 box1(.x(S_in[47:42]), .y(S_out[31:28]));
    S2 box2(.x(S_in[41:36]), .y(S_out[27:24]));
    S3 box3(.x(S_in[35:30]), .y(S_out[23:20]));
    S4 box4(.x(S_in[29:24]), .y(S_out[19:16]));
    S5 box5(.x(S_in[23:18]), .y(S_out[15:12]));
    S6 box6(.x(S_in[17:12]), .y(S_out[11:8]));
    S7 box7(.x(S_in[11:6]), .y(S_out[7:4]));
    S8 box8(.x(S_in[5:0]), .y(S_out[3:0]));
endmodule

module S1 (input [5:0] x, output [3:0] y);
    reg [3:0] o_data;
    assign y = o_data;
    always @(*) begin
        case ({x[5], x[0]})
            2'd0 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd14;
                    4'd1 : o_data = 4'd4;
                    4'd2 : o_data = 4'd13;
                    4'd3 : o_data = 4'd1;
                    4'd4 : o_data = 4'd2;
                    4'd5 : o_data = 4'd15;
                    4'd6 : o_data = 4'd11;
                    4'd7 : o_data = 4'd8;
                    4'd8 : o_data = 4'd3;
                    4'd9 : o_data = 4'd10;
                    4'd10 : o_data = 4'd6;
                    4'd11 : o_data = 4'd12;
                    4'd12 : o_data = 4'd5;
                    4'd13 : o_data = 4'd9;
                    4'd14 : o_data = 4'd0;
                    4'd15 : o_data = 4'd7;
                    default : o_data = 0;
                endcase
            end
            2'd1 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd0;
                    4'd1 : o_data = 4'd15;
                    4'd2 : o_data = 4'd7;
                    4'd3 : o_data = 4'd4;
                    4'd4 : o_data = 4'd14;
                    4'd5 : o_data = 4'd2;
                    4'd6 : o_data = 4'd13;
                    4'd7 : o_data = 4'd1;
                    4'd8 : o_data = 4'd10;
                    4'd9 : o_data = 4'd6;
                    4'd10 : o_data = 4'd12;
                    4'd11 : o_data = 4'd11;
                    4'd12 : o_data = 4'd9;
                    4'd13 : o_data = 4'd5;
                    4'd14 : o_data = 4'd3;
                    4'd15 : o_data = 4'd8;
                    default : o_data = 0;
                endcase
            end
            2'd2 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd4;
                    4'd1 : o_data = 4'd1;
                    4'd2 : o_data = 4'd14;
                    4'd3 : o_data = 4'd8;
                    4'd4 : o_data = 4'd13;
                    4'd5 : o_data = 4'd6;
                    4'd6 : o_data = 4'd2;
                    4'd7 : o_data = 4'd11;
                    4'd8 : o_data = 4'd15;
                    4'd9 : o_data = 4'd12;
                    4'd10 : o_data = 4'd9;
                    4'd11 : o_data = 4'd7;
                    4'd12 : o_data = 4'd3;
                    4'd13 : o_data = 4'd10;
                    4'd14 : o_data = 4'd5;
                    4'd15 : o_data = 4'd0;
                    default : o_data = 0;
                endcase
            end
            2'd3 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd15;
                    4'd1 : o_data = 4'd12;
                    4'd2 : o_data = 4'd8;
                    4'd3 : o_data = 4'd2;
                    4'd4 : o_data = 4'd4;
                    4'd5 : o_data = 4'd9;
                    4'd6 : o_data = 4'd1;
                    4'd7 : o_data = 4'd7;
                    4'd8 : o_data = 4'd5;
                    4'd9 : o_data = 4'd11;
                    4'd10 : o_data = 4'd3;
                    4'd11 : o_data = 4'd14;
                    4'd12 : o_data = 4'd10;
                    4'd13 : o_data = 4'd0;
                    4'd14 : o_data = 4'd6;
                    4'd15 : o_data = 4'd13;
                    default : o_data = 0;
                endcase
            end
        endcase
    end
endmodule

module S2 (input [5:0] x, output [3:0] y);
    reg [3:0] o_data;
    assign y = o_data;
    always @(*) begin
        case ({x[5], x[0]})
            2'd0 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd15;
                    4'd1 : o_data = 4'd1;
                    4'd2 : o_data = 4'd8;
                    4'd3 : o_data = 4'd14;
                    4'd4 : o_data = 4'd6;
                    4'd5 : o_data = 4'd11;
                    4'd6 : o_data = 4'd3;
                    4'd7 : o_data = 4'd4;
                    4'd8 : o_data = 4'd9;
                    4'd9 : o_data = 4'd7;
                    4'd10 : o_data = 4'd2;
                    4'd11 : o_data = 4'd13;
                    4'd12 : o_data = 4'd12;
                    4'd13 : o_data = 4'd0;
                    4'd14 : o_data = 4'd5;
                    4'd15 : o_data = 4'd10;
                    default : o_data = 0;
                endcase
            end
            2'd1 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd3;
                    4'd1 : o_data = 4'd13;
                    4'd2 : o_data = 4'd4;
                    4'd3 : o_data = 4'd7;
                    4'd4 : o_data = 4'd15;
                    4'd5 : o_data = 4'd2;
                    4'd6 : o_data = 4'd8;
                    4'd7 : o_data = 4'd14;
                    4'd8 : o_data = 4'd12;
                    4'd9 : o_data = 4'd0;
                    4'd10 : o_data = 4'd1;
                    4'd11 : o_data = 4'd10;
                    4'd12 : o_data = 4'd6;
                    4'd13 : o_data = 4'd9;
                    4'd14 : o_data = 4'd11;
                    4'd15 : o_data = 4'd5;
                    default : o_data = 0;
                endcase
            end
            2'd2 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd0;
                    4'd1 : o_data = 4'd14;
                    4'd2 : o_data = 4'd7;
                    4'd3 : o_data = 4'd11;
                    4'd4 : o_data = 4'd10;
                    4'd5 : o_data = 4'd4;
                    4'd6 : o_data = 4'd13;
                    4'd7 : o_data = 4'd1;
                    4'd8 : o_data = 4'd5;
                    4'd9 : o_data = 4'd8;
                    4'd10 : o_data = 4'd12;
                    4'd11 : o_data = 4'd6;
                    4'd12 : o_data = 4'd9;
                    4'd13 : o_data = 4'd3;
                    4'd14 : o_data = 4'd2;
                    4'd15 : o_data = 4'd15;
                    default : o_data = 0;
                endcase
            end
            2'd3 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd13;
                    4'd1 : o_data = 4'd8;
                    4'd2 : o_data = 4'd10;
                    4'd3 : o_data = 4'd1;
                    4'd4 : o_data = 4'd3;
                    4'd5 : o_data = 4'd15;
                    4'd6 : o_data = 4'd4;
                    4'd7 : o_data = 4'd2;
                    4'd8 : o_data = 4'd11;
                    4'd9 : o_data = 4'd6;
                    4'd10 : o_data = 4'd7;
                    4'd11 : o_data = 4'd12;
                    4'd12 : o_data = 4'd0;
                    4'd13 : o_data = 4'd5;
                    4'd14 : o_data = 4'd14;
                    4'd15 : o_data = 4'd9;
                    default : o_data = 0;
                endcase
            end
        endcase
    end
endmodule

module S3 (input [5:0] x, output [3:0] y);
    reg [3:0] o_data;
    assign y = o_data;
    always @(*) begin
        case ({x[5], x[0]})
            2'd0 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd10;
                    4'd1 : o_data = 4'd0;
                    4'd2 : o_data = 4'd9;
                    4'd3 : o_data = 4'd14;
                    4'd4 : o_data = 4'd6;
                    4'd5 : o_data = 4'd3;
                    4'd6 : o_data = 4'd15;
                    4'd7 : o_data = 4'd5;
                    4'd8 : o_data = 4'd1;
                    4'd9 : o_data = 4'd13;
                    4'd10 : o_data = 4'd12;
                    4'd11 : o_data = 4'd7;
                    4'd12 : o_data = 4'd11;
                    4'd13 : o_data = 4'd4;
                    4'd14 : o_data = 4'd2;
                    4'd15 : o_data = 4'd8;
                    default : o_data = 0;
                endcase
            end
            2'd1 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd13;
                    4'd1 : o_data = 4'd7;
                    4'd2 : o_data = 4'd0;
                    4'd3 : o_data = 4'd9;
                    4'd4 : o_data = 4'd3;
                    4'd5 : o_data = 4'd4;
                    4'd6 : o_data = 4'd6;
                    4'd7 : o_data = 4'd10;
                    4'd8 : o_data = 4'd2;
                    4'd9 : o_data = 4'd8;
                    4'd10 : o_data = 4'd5;
                    4'd11 : o_data = 4'd14;
                    4'd12 : o_data = 4'd12;
                    4'd13 : o_data = 4'd11;
                    4'd14 : o_data = 4'd15;
                    4'd15 : o_data = 4'd1;
                    default : o_data = 0;
                endcase
            end
            2'd2 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd13;
                    4'd1 : o_data = 4'd6;
                    4'd2 : o_data = 4'd4;
                    4'd3 : o_data = 4'd9;
                    4'd4 : o_data = 4'd8;
                    4'd5 : o_data = 4'd15;
                    4'd6 : o_data = 4'd3;
                    4'd7 : o_data = 4'd0;
                    4'd8 : o_data = 4'd11;
                    4'd9 : o_data = 4'd1;
                    4'd10 : o_data = 4'd2;
                    4'd11 : o_data = 4'd12;
                    4'd12 : o_data = 4'd5;
                    4'd13 : o_data = 4'd10;
                    4'd14 : o_data = 4'd14;
                    4'd15 : o_data = 4'd7;
                    default : o_data = 0;
                endcase
            end
            2'd3 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd1;
                    4'd1 : o_data = 4'd10;
                    4'd2 : o_data = 4'd13;
                    4'd3 : o_data = 4'd0;
                    4'd4 : o_data = 4'd6;
                    4'd5 : o_data = 4'd9;
                    4'd6 : o_data = 4'd8;
                    4'd7 : o_data = 4'd7;
                    4'd8 : o_data = 4'd4;
                    4'd9 : o_data = 4'd15;
                    4'd10 : o_data = 4'd14;
                    4'd11 : o_data = 4'd3;
                    4'd12 : o_data = 4'd11;
                    4'd13 : o_data = 4'd5;
                    4'd14 : o_data = 4'd2;
                    4'd15 : o_data = 4'd12;
                    default : o_data = 0;
                endcase
            end
        endcase
    end
endmodule

module S4 (input [5:0] x, output [3:0] y);
    reg [3:0] o_data;
    assign y = o_data;
    always @(*) begin
        case ({x[5], x[0]})
            2'd0 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd7;
                    4'd1 : o_data = 4'd13;
                    4'd2 : o_data = 4'd14;
                    4'd3 : o_data = 4'd3;
                    4'd4 : o_data = 4'd0;
                    4'd5 : o_data = 4'd6;
                    4'd6 : o_data = 4'd9;
                    4'd7 : o_data = 4'd10;
                    4'd8 : o_data = 4'd1;
                    4'd9 : o_data = 4'd2;
                    4'd10 : o_data = 4'd8;
                    4'd11 : o_data = 4'd5;
                    4'd12 : o_data = 4'd11;
                    4'd13 : o_data = 4'd12;
                    4'd14 : o_data = 4'd4;
                    4'd15 : o_data = 4'd15;
                    default : o_data = 0;
                endcase
            end
            2'd1 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd13;
                    4'd1 : o_data = 4'd8;
                    4'd2 : o_data = 4'd11;
                    4'd3 : o_data = 4'd5;
                    4'd4 : o_data = 4'd6;
                    4'd5 : o_data = 4'd15;
                    4'd6 : o_data = 4'd0;
                    4'd7 : o_data = 4'd3;
                    4'd8 : o_data = 4'd4;
                    4'd9 : o_data = 4'd7;
                    4'd10 : o_data = 4'd2;
                    4'd11 : o_data = 4'd12;
                    4'd12 : o_data = 4'd1;
                    4'd13 : o_data = 4'd10;
                    4'd14 : o_data = 4'd14;
                    4'd15 : o_data = 4'd9;
                    default : o_data = 0;
                endcase
            end
            2'd2 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd10;
                    4'd1 : o_data = 4'd6;
                    4'd2 : o_data = 4'd9;
                    4'd3 : o_data = 4'd0;
                    4'd4 : o_data = 4'd12;
                    4'd5 : o_data = 4'd11;
                    4'd6 : o_data = 4'd7;
                    4'd7 : o_data = 4'd13;
                    4'd8 : o_data = 4'd15;
                    4'd9 : o_data = 4'd1;
                    4'd10 : o_data = 4'd3;
                    4'd11 : o_data = 4'd14;
                    4'd12 : o_data = 4'd5;
                    4'd13 : o_data = 4'd2;
                    4'd14 : o_data = 4'd8;
                    4'd15 : o_data = 4'd4;
                    default : o_data = 0;
                endcase
            end
            2'd3 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd3;
                    4'd1 : o_data = 4'd15;
                    4'd2 : o_data = 4'd0;
                    4'd3 : o_data = 4'd6;
                    4'd4 : o_data = 4'd10;
                    4'd5 : o_data = 4'd1;
                    4'd6 : o_data = 4'd13;
                    4'd7 : o_data = 4'd8;
                    4'd8 : o_data = 4'd9;
                    4'd9 : o_data = 4'd4;
                    4'd10 : o_data = 4'd5;
                    4'd11 : o_data = 4'd11;
                    4'd12 : o_data = 4'd12;
                    4'd13 : o_data = 4'd7;
                    4'd14 : o_data = 4'd2;
                    4'd15 : o_data = 4'd14;
                    default : o_data = 0;
                endcase
            end
        endcase
    end
endmodule

module S5 (input [5:0] x, output [3:0] y);
    reg [3:0] o_data;
    assign y = o_data;
    always @(*) begin
        case ({x[5], x[0]})
            2'd0 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd2;
                    4'd1 : o_data = 4'd12;
                    4'd2 : o_data = 4'd4;
                    4'd3 : o_data = 4'd1;
                    4'd4 : o_data = 4'd7;
                    4'd5 : o_data = 4'd10;
                    4'd6 : o_data = 4'd11;
                    4'd7 : o_data = 4'd6;
                    4'd8 : o_data = 4'd8;
                    4'd9 : o_data = 4'd5;
                    4'd10 : o_data = 4'd3;
                    4'd11 : o_data = 4'd15;
                    4'd12 : o_data = 4'd13;
                    4'd13 : o_data = 4'd0;
                    4'd14 : o_data = 4'd14;
                    4'd15 : o_data = 4'd9;
                    default : o_data = 0;
                endcase
            end
            2'd1 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd14;
                    4'd1 : o_data = 4'd11;
                    4'd2 : o_data = 4'd2;
                    4'd3 : o_data = 4'd12;
                    4'd4 : o_data = 4'd4;
                    4'd5 : o_data = 4'd7;
                    4'd6 : o_data = 4'd13;
                    4'd7 : o_data = 4'd1;
                    4'd8 : o_data = 4'd5;
                    4'd9 : o_data = 4'd0;
                    4'd10 : o_data = 4'd15;
                    4'd11 : o_data = 4'd10;
                    4'd12 : o_data = 4'd3;
                    4'd13 : o_data = 4'd9;
                    4'd14 : o_data = 4'd8;
                    4'd15 : o_data = 4'd6;
                    default : o_data = 0;
                endcase
            end
            2'd2 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd4;
                    4'd1 : o_data = 4'd2;
                    4'd2 : o_data = 4'd1;
                    4'd3 : o_data = 4'd11;
                    4'd4 : o_data = 4'd10;
                    4'd5 : o_data = 4'd13;
                    4'd6 : o_data = 4'd7;
                    4'd7 : o_data = 4'd8;
                    4'd8 : o_data = 4'd15;
                    4'd9 : o_data = 4'd9;
                    4'd10 : o_data = 4'd12;
                    4'd11 : o_data = 4'd5;
                    4'd12 : o_data = 4'd6;
                    4'd13 : o_data = 4'd3;
                    4'd14 : o_data = 4'd0;
                    4'd15 : o_data = 4'd14;
                    default : o_data = 0;
                endcase
            end
            2'd3 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd11;
                    4'd1 : o_data = 4'd8;
                    4'd2 : o_data = 4'd12;
                    4'd3 : o_data = 4'd7;
                    4'd4 : o_data = 4'd1;
                    4'd5 : o_data = 4'd14;
                    4'd6 : o_data = 4'd2;
                    4'd7 : o_data = 4'd13;
                    4'd8 : o_data = 4'd6;
                    4'd9 : o_data = 4'd15;
                    4'd10 : o_data = 4'd0;
                    4'd11 : o_data = 4'd9;
                    4'd12 : o_data = 4'd10;
                    4'd13 : o_data = 4'd4;
                    4'd14 : o_data = 4'd5;
                    4'd15 : o_data = 4'd3;
                    default : o_data = 0;
                endcase
            end
        endcase
    end
endmodule

module S6 (input [5:0] x, output [3:0] y);
    reg [3:0] o_data;
    assign y = o_data;
    always @(*) begin
        case ({x[5], x[0]})
            2'd0 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd12;
                    4'd1 : o_data = 4'd1;
                    4'd2 : o_data = 4'd10;
                    4'd3 : o_data = 4'd15;
                    4'd4 : o_data = 4'd9;
                    4'd5 : o_data = 4'd2;
                    4'd6 : o_data = 4'd6;
                    4'd7 : o_data = 4'd8;
                    4'd8 : o_data = 4'd0;
                    4'd9 : o_data = 4'd13;
                    4'd10 : o_data = 4'd3;
                    4'd11 : o_data = 4'd4;
                    4'd12 : o_data = 4'd14;
                    4'd13 : o_data = 4'd7;
                    4'd14 : o_data = 4'd5;
                    4'd15 : o_data = 4'd11;
                    default : o_data = 0;
                endcase
            end
            2'd1 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd10;
                    4'd1 : o_data = 4'd15;
                    4'd2 : o_data = 4'd4;
                    4'd3 : o_data = 4'd2;
                    4'd4 : o_data = 4'd7;
                    4'd5 : o_data = 4'd12;
                    4'd6 : o_data = 4'd9;
                    4'd7 : o_data = 4'd5;
                    4'd8 : o_data = 4'd6;
                    4'd9 : o_data = 4'd1;
                    4'd10 : o_data = 4'd13;
                    4'd11 : o_data = 4'd14;
                    4'd12 : o_data = 4'd0;
                    4'd13 : o_data = 4'd11;
                    4'd14 : o_data = 4'd3;
                    4'd15 : o_data = 4'd8;
                    default : o_data = 0;
                endcase
            end
            2'd2 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd9;
                    4'd1 : o_data = 4'd14;
                    4'd2 : o_data = 4'd15;
                    4'd3 : o_data = 4'd5;
                    4'd4 : o_data = 4'd2;
                    4'd5 : o_data = 4'd8;
                    4'd6 : o_data = 4'd12;
                    4'd7 : o_data = 4'd3;
                    4'd8 : o_data = 4'd7;
                    4'd9 : o_data = 4'd0;
                    4'd10 : o_data = 4'd4;
                    4'd11 : o_data = 4'd10;
                    4'd12 : o_data = 4'd1;
                    4'd13 : o_data = 4'd13;
                    4'd14 : o_data = 4'd11;
                    4'd15 : o_data = 4'd6;
                    default : o_data = 0;
                endcase
            end
            2'd3 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd4;
                    4'd1 : o_data = 4'd3;
                    4'd2 : o_data = 4'd2;
                    4'd3 : o_data = 4'd12;
                    4'd4 : o_data = 4'd9;
                    4'd5 : o_data = 4'd5;
                    4'd6 : o_data = 4'd15;
                    4'd7 : o_data = 4'd10;
                    4'd8 : o_data = 4'd11;
                    4'd9 : o_data = 4'd14;
                    4'd10 : o_data = 4'd1;
                    4'd11 : o_data = 4'd7;
                    4'd12 : o_data = 4'd6;
                    4'd13 : o_data = 4'd0;
                    4'd14 : o_data = 4'd8;
                    4'd15 : o_data = 4'd13;
                    default : o_data = 0;
                endcase
            end
        endcase
    end
endmodule

module S7 (input [5:0] x, output [3:0] y);
    reg [3:0] o_data;
    assign y = o_data;
    always @(*) begin
        case ({x[5], x[0]})
            2'd0 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd4;
                    4'd1 : o_data = 4'd11;
                    4'd2 : o_data = 4'd2;
                    4'd3 : o_data = 4'd14;
                    4'd4 : o_data = 4'd15;
                    4'd5 : o_data = 4'd0;
                    4'd6 : o_data = 4'd8;
                    4'd7 : o_data = 4'd13;
                    4'd8 : o_data = 4'd3;
                    4'd9 : o_data = 4'd12;
                    4'd10 : o_data = 4'd9;
                    4'd11 : o_data = 4'd7;
                    4'd12 : o_data = 4'd5;
                    4'd13 : o_data = 4'd10;
                    4'd14 : o_data = 4'd6;
                    4'd15 : o_data = 4'd1;
                    default : o_data = 0;
                endcase
            end
            2'd1 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd13;
                    4'd1 : o_data = 4'd0;
                    4'd2 : o_data = 4'd11;
                    4'd3 : o_data = 4'd7;
                    4'd4 : o_data = 4'd4;
                    4'd5 : o_data = 4'd9;
                    4'd6 : o_data = 4'd1;
                    4'd7 : o_data = 4'd10;
                    4'd8 : o_data = 4'd14;
                    4'd9 : o_data = 4'd3;
                    4'd10 : o_data = 4'd5;
                    4'd11 : o_data = 4'd12;
                    4'd12 : o_data = 4'd2;
                    4'd13 : o_data = 4'd15;
                    4'd14 : o_data = 4'd8;
                    4'd15 : o_data = 4'd6;
                    default : o_data = 0;
                endcase
            end
            2'd2 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd1;
                    4'd1 : o_data = 4'd4;
                    4'd2 : o_data = 4'd11;
                    4'd3 : o_data = 4'd13;
                    4'd4 : o_data = 4'd12;
                    4'd5 : o_data = 4'd3;
                    4'd6 : o_data = 4'd7;
                    4'd7 : o_data = 4'd14;
                    4'd8 : o_data = 4'd10;
                    4'd9 : o_data = 4'd15;
                    4'd10 : o_data = 4'd6;
                    4'd11 : o_data = 4'd8;
                    4'd12 : o_data = 4'd0;
                    4'd13 : o_data = 4'd5;
                    4'd14 : o_data = 4'd9;
                    4'd15 : o_data = 4'd2;
                    default : o_data = 0;
                endcase
            end
            2'd3 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd6;
                    4'd1 : o_data = 4'd11;
                    4'd2 : o_data = 4'd13;
                    4'd3 : o_data = 4'd8;
                    4'd4 : o_data = 4'd1;
                    4'd5 : o_data = 4'd4;
                    4'd6 : o_data = 4'd10;
                    4'd7 : o_data = 4'd7;
                    4'd8 : o_data = 4'd9;
                    4'd9 : o_data = 4'd5;
                    4'd10 : o_data = 4'd0;
                    4'd11 : o_data = 4'd15;
                    4'd12 : o_data = 4'd14;
                    4'd13 : o_data = 4'd2;
                    4'd14 : o_data = 4'd3;
                    4'd15 : o_data = 4'd12;
                    default : o_data = 0;
                endcase
            end
        endcase
    end
endmodule

module S8 (input [5:0] x, output [3:0] y);
    reg [3:0] o_data;
    assign y = o_data;
    always @(*) begin
        case ({x[5], x[0]})
            2'd0 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd13;
                    4'd1 : o_data = 4'd2;
                    4'd2 : o_data = 4'd8;
                    4'd3 : o_data = 4'd4;
                    4'd4 : o_data = 4'd6;
                    4'd5 : o_data = 4'd15;
                    4'd6 : o_data = 4'd11;
                    4'd7 : o_data = 4'd1;
                    4'd8 : o_data = 4'd10;
                    4'd9 : o_data = 4'd9;
                    4'd10 : o_data = 4'd3;
                    4'd11 : o_data = 4'd14;
                    4'd12 : o_data = 4'd5;
                    4'd13 : o_data = 4'd0;
                    4'd14 : o_data = 4'd12;
                    4'd15 : o_data = 4'd7;
                    default : o_data = 0;
                endcase
            end
            2'd1 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd1;
                    4'd1 : o_data = 4'd15;
                    4'd2 : o_data = 4'd13;
                    4'd3 : o_data = 4'd8;
                    4'd4 : o_data = 4'd10;
                    4'd5 : o_data = 4'd3;
                    4'd6 : o_data = 4'd7;
                    4'd7 : o_data = 4'd4;
                    4'd8 : o_data = 4'd12;
                    4'd9 : o_data = 4'd5;
                    4'd10 : o_data = 4'd6;
                    4'd11 : o_data = 4'd11;
                    4'd12 : o_data = 4'd0;
                    4'd13 : o_data = 4'd14;
                    4'd14 : o_data = 4'd9;
                    4'd15 : o_data = 4'd2;
                    default : o_data = 0;
                endcase
            end
            2'd2 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd7;
                    4'd1 : o_data = 4'd11;
                    4'd2 : o_data = 4'd4;
                    4'd3 : o_data = 4'd1;
                    4'd4 : o_data = 4'd9;
                    4'd5 : o_data = 4'd12;
                    4'd6 : o_data = 4'd14;
                    4'd7 : o_data = 4'd2;
                    4'd8 : o_data = 4'd0;
                    4'd9 : o_data = 4'd6;
                    4'd10 : o_data = 4'd10;
                    4'd11 : o_data = 4'd13;
                    4'd12 : o_data = 4'd15;
                    4'd13 : o_data = 4'd3;
                    4'd14 : o_data = 4'd5;
                    4'd15 : o_data = 4'd8;
                    default : o_data = 0;
                endcase
            end
            2'd3 : begin
                case (x[4:1])
                    4'd0 : o_data = 4'd2;
                    4'd1 : o_data = 4'd1;
                    4'd2 : o_data = 4'd14;
                    4'd3 : o_data = 4'd7;
                    4'd4 : o_data = 4'd4;
                    4'd5 : o_data = 4'd10;
                    4'd6 : o_data = 4'd8;
                    4'd7 : o_data = 4'd13;
                    4'd8 : o_data = 4'd15;
                    4'd9 : o_data = 4'd12;
                    4'd10 : o_data = 4'd9;
                    4'd11 : o_data = 4'd0;
                    4'd12 : o_data = 4'd3;
                    4'd13 : o_data = 4'd5;
                    4'd14 : o_data = 4'd6;
                    4'd15 : o_data = 4'd11;
                    default : o_data = 0;
                endcase
            end
        endcase
    end
endmodule


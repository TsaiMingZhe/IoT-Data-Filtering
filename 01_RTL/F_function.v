module F_function (input [47:0] key, input [31:0] F_in, output [31:0] F_out);
    wire [47:0] o_exp, i_sbox;
    wire [31:0] o_sbox;
    assign i_sbox = key ^ o_exp;
    Expansion exp(.x(F_in), .y(o_exp));
    Sbox s_box(.S_in(i_sbox), .S_out(o_sbox));
    P p1(.x(o_sbox), .y(F_out));
endmodule

module Expansion (input [31:0] x, output [47:0] y);
    wire[47:0]  data;
    assign y = ~data;
    assign data = ~{x[0], x[31], x[30], x[29], x[28], x[27], x[28], x[27], 
                x[26], x[25], x[24], x[23], x[24], x[23], x[22], x[21], 
                x[20], x[19], x[20], x[19], x[18], x[17], x[16], x[15], 
                x[16], x[15], x[14], x[13], x[12], x[11], x[12], x[11], 
                x[10], x[9], x[8], x[7], x[8], x[7], x[6], x[5], 
                x[4], x[3], x[4], x[3], x[2], x[1], x[0], x[31]};
endmodule

module P (input [31:0] x, output [31:0] y);
    wire[31:0]  data;
    assign y = ~data;
    assign data = ~{x[16], x[25], x[12], x[11], x[3], x[20], x[4], x[15], 
                x[31], x[17], x[9], x[6], x[27], x[14], x[1], x[22], 
                x[30], x[24], x[8], x[18], x[0], x[5], x[29], x[23], 
                x[13], x[19], x[2], x[26], x[10], x[21], x[28], x[7]};
endmodule
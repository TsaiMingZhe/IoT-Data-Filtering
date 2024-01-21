module IOTDF (input clk, input rst, input in_en, input [7:0] iot_in, input [2:0] fn_sel, output busy, output valid, output [127:0] iot_out);
    integer i;
////output assign
    reg         busy_w, busy_r, valid_w, valid_r;
    reg [127:0] iot_out_w, iot_out_r;
    assign busy = busy_r;
    assign valid = valid_r;
    assign iot_out = iot_out_r;
////reg and wire
    wire        DES_valid, CRC_valid, GB_valid;
    wire        DES_en, CRC_en, GB_en; 
    wire[2:0]   o_CRC;
    wire[63:0]  o_DES;
    wire[47:0]  sub_key;
    reg [3:0]   state, next_state;
    reg [3:0]   load_cnt, key_cnt;
    reg [7:0]   in_reg[15:0];
    wire[63:0]  Left_data, Right_data;
    wire[127:0] o_GB;
////submodule
    Key_generator kg(.fn(fn_sel), .clk(clk), .rst(rst), .key_cnt(key_cnt), .i_mk(Left_data), .o_sk(sub_key));
    Plaintext pt(.state(state), .clk(clk), .rst(rst), .key(sub_key), .key_cnt(key_cnt), .i_pt(Right_data), .o_ct(o_DES), .o_valid(DES_valid));
    CRC crc(.clk(clk), .rst(rst), .en(CRC_en), .i_data({Left_data, Right_data}), .o_data(o_CRC), .o_valid(CRC_valid));
    Gray_Bin GB(.en(GB_en), .fn(fn_sel), .clk(clk), .rst(rst), .i_data({Left_data, Right_data}), .o_data(o_GB), .o_valid(GB_valid));
////
    assign Left_data = {in_reg[15], in_reg[14], in_reg[13], in_reg[12], in_reg[11], in_reg[10], in_reg[9], in_reg[8]};
    assign Right_data = {in_reg[7], in_reg[6], in_reg[5], in_reg[4], in_reg[3], in_reg[2], in_reg[1], in_reg[0]};
    assign CRC_en = (state == `get_crc);
    assign GB_en = (state == `conv_GB);
////
    always @(*) begin
        case (state)
            `idle : next_state = `load;
            `load : begin
                if(&load_cnt)begin
                    case (fn_sel)
                        `Encrypt, `Decrypt : next_state = `DES;
                        `CRC_gen : next_state = `get_crc;
                        `Bin2Gray : next_state = `conv_GB;
                        `Gray2Bin : next_state = `conv_GB;
                        default : next_state = state;
                    endcase
                end else next_state = `load;
            end
            `DES : next_state = (DES_valid) ? `iot_out : `DES;
            `get_crc : next_state = (CRC_valid) ? `iot_out : `get_crc;
            `conv_GB : next_state = (GB_valid) ? `iot_out : `conv_GB;
            `iot_out : next_state = `idle;
            default : next_state = state;
        endcase
        //output
        busy_w = (state == `load) ? &load_cnt[3:1] : (state != `idle);
        valid_w = (state == `iot_out);
        case (fn_sel)
            `Encrypt, `Decrypt : iot_out_w = (state == `iot_out) ? {Left_data, o_DES} : 0;
            `CRC_gen : iot_out_w = (state == `iot_out) ? {125'b0, o_CRC} : 0;
            `Bin2Gray, `Gray2Bin : iot_out_w = (state == `iot_out) ? o_GB : 0;
            default : iot_out_w = iot_out_r; 
        endcase
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            busy_r <= 1; valid_r <= 0; iot_out_r <= 0;
            state <= 0;
            load_cnt <= 0;
            key_cnt <= 0;
            for(i = 0;i < 16; i = i + 1) in_reg[i] <= 0;
        end else begin
            busy_r <= busy_w; valid_r <= valid_w; iot_out_r <= iot_out_w;
            state <= next_state;
            load_cnt <= (in_en) ? load_cnt + 1 : load_cnt;
            key_cnt <= (state == `DES) ? key_cnt + 1 : 0;
            in_reg[0] <= (in_en) ? iot_in : in_reg[0];
            for(i = 1;i < 16; i = i + 1) in_reg[i] <= (in_en) ? in_reg[i - 1] : in_reg[i];
        end
    end
endmodule

module Key_generator (input[2:0] fn, input clk, input rst, input[3:0] key_cnt, input[63:0] i_mk, output[47:0] o_sk);
    wire[55:0]  cipher_key, x;
    reg [27:0]  inL_w, inL, inR_w, inR;
    assign x = {inL, inR};
    assign cipher_key = //LUT PC1
        {i_mk[7], i_mk[15], i_mk[23], i_mk[31], i_mk[39], i_mk[47], i_mk[55], i_mk[63], 
         i_mk[6], i_mk[14], i_mk[22], i_mk[30], i_mk[38], i_mk[46], i_mk[54], i_mk[62], 
         i_mk[5], i_mk[13], i_mk[21], i_mk[29], i_mk[37], i_mk[45], i_mk[53], i_mk[61], 
         i_mk[4], i_mk[12], i_mk[20], i_mk[28], i_mk[1], i_mk[9], i_mk[17], i_mk[25], 
         i_mk[33], i_mk[41], i_mk[49], i_mk[57], i_mk[2], i_mk[10], i_mk[18], i_mk[26], 
         i_mk[34], i_mk[42], i_mk[50], i_mk[58], i_mk[3], i_mk[11], i_mk[19], i_mk[27], 
         i_mk[35], i_mk[43], i_mk[51], i_mk[59], i_mk[36], i_mk[44], i_mk[52], i_mk[60]};
    assign o_sk = //LUT PC2
        {x[42], x[39], x[45], x[32], x[55], x[51], x[53], x[28], 
         x[41], x[50], x[35], x[46], x[33], x[37], x[44], x[52], 
         x[30], x[48], x[40], x[49], x[29], x[36], x[43], x[54], 
         x[15], x[4], x[25], x[19], x[9], x[1], x[26], x[16], 
         x[5], x[11], x[23], x[8], x[12], x[7], x[17], x[0], 
         x[22], x[3], x[10], x[14], x[6], x[20], x[27], x[24]};
    always @(*) begin
        if (fn == `Encrypt) begin
            case (key_cnt)
                4'h0 : {inL_w, inR_w} = {{cipher_key[54:28], cipher_key[55]}, {cipher_key[26:0], cipher_key[27]}};
                4'h1, 4'h8, 4'hF : {inL_w, inR_w} = {{inL[26:0], inL[27]}, {inR[26:0], inR[27]}};
                default : {inL_w, inR_w} = {{inL[25:0], inL[27:26]}, {inR[25:0], inR[27:26]}};
            endcase
        end else if (fn == `Decrypt) begin
            case (key_cnt)
                4'h0 : {inL_w, inR_w} = {cipher_key[55:28], cipher_key[27:0]};
                4'h1, 4'h8, 4'hF : {inL_w, inR_w} = {{inL[0], inL[27:1]}, {inR[0], inR[27:1]}};
                default : {inL_w, inR_w} = {{inL[1:0], inL[27:2]}, {inR[1:0], inR[27:2]}};
            endcase            
        end else {inL_w, inR_w} = 0;
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            inL <= 0;   inR <= 0;
        end else begin
            inL <= inL_w;   inR <= inR_w;
        end
    end    
endmodule

module Plaintext (input[3:0] state, input clk, input rst, input[47:0] key, input[3:0] key_cnt, input[63:0] i_pt, output[63:0] o_ct, output o_valid);
    wire[31:0]  dataL, dataR, f_out, LxorF;
    wire[63:0]  x;
    reg [3:0]   DES_cnt;
    reg [31:0]  Ln, Rn;
    assign o_valid = &DES_cnt;
    assign x = {Ln, Rn};
    //Initial permutation
    assign dataL = {i_pt[6], i_pt[14], i_pt[22], i_pt[30], i_pt[38], i_pt[46], i_pt[54], i_pt[62], 
                    i_pt[4], i_pt[12], i_pt[20], i_pt[28], i_pt[36], i_pt[44], i_pt[52], i_pt[60], 
                    i_pt[2], i_pt[10], i_pt[18], i_pt[26], i_pt[34], i_pt[42], i_pt[50], i_pt[58], 
                    i_pt[0], i_pt[8], i_pt[16], i_pt[24], i_pt[32], i_pt[40], i_pt[48], i_pt[56]};
    assign dataR = {i_pt[7], i_pt[15], i_pt[23], i_pt[31], i_pt[39], i_pt[47], i_pt[55], i_pt[63], 
                    i_pt[5], i_pt[13], i_pt[21], i_pt[29], i_pt[37], i_pt[45], i_pt[53], i_pt[61], 
                    i_pt[3], i_pt[11], i_pt[19], i_pt[27], i_pt[35], i_pt[43], i_pt[51], i_pt[59], 
                    i_pt[1], i_pt[9], i_pt[17], i_pt[25], i_pt[33], i_pt[41], i_pt[49], i_pt[57]};
    //Final permutation
    assign o_ct = {x[24], x[56], x[16], x[48], x[8], x[40], x[0], x[32], 
                   x[25], x[57], x[17], x[49], x[9], x[41], x[1], x[33], 
                   x[26], x[58], x[18], x[50], x[10], x[42], x[2], x[34], 
                   x[27], x[59], x[19], x[51], x[11], x[43], x[3], x[35], 
                   x[28], x[60], x[20], x[52], x[12], x[44], x[4], x[36], 
                   x[29], x[61], x[21], x[53], x[13], x[45], x[5], x[37], 
                   x[30], x[62], x[22], x[54], x[14], x[46], x[6], x[38], 
                   x[31], x[63], x[23], x[55], x[15], x[47], x[7], x[39]};
    assign LxorF = Ln ^ f_out;
    F_function f(.key(key), .F_in(Rn), .F_out(f_out));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            DES_cnt <= 0;
            Ln <= 0;
            Rn <= 0;
        end else begin
            DES_cnt <= key_cnt;
            if(state == `DES) begin
                Ln <= (~|key_cnt & ~|DES_cnt) ? dataL : (~|key_cnt & (&DES_cnt)) ? LxorF : Rn;
                Rn <= (~|key_cnt & ~|DES_cnt) ? dataR : (~|key_cnt & (&DES_cnt)) ? Rn : LxorF;                
            end else begin
                Ln <= Ln;
                Rn <= Rn;
            end

        end
    end
endmodule

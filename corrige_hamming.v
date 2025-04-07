module corrige_hamming (
  input [14:0] entrada, 
  output reg [10:0] saida 
);

wire [3:0] erro_posicao;
reg [14:0] entrada_corrigida;

assign erro_posicao[0] = entrada[0] ^ entrada[2] ^ entrada[4] ^ entrada[6] ^ entrada[8] ^ entrada[10] ^ entrada[12] ^ entrada[14];
assign erro_posicao[1] = entrada[1] ^ entrada[2] ^ entrada[5] ^ entrada[6] ^ entrada[9] ^ entrada[10] ^ entrada[13] ^ entrada[14];
assign erro_posicao[2] = entrada[3] ^ entrada[4] ^ entrada[5] ^ entrada[6] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];
assign erro_posicao[3] = entrada[7] ^ entrada[8] ^ entrada[9] ^ entrada[10] ^ entrada[11] ^ entrada[12] ^ entrada[13] ^ entrada[14];

always @(*) begin
  entrada_corrigida = entrada; 

  if (erro_posicao != 4'b0000) begin
    entrada_corrigida[erro_posicao - 1] = ~entrada_corrigida[erro_posicao - 1];
  end

  saida = {entrada_corrigida[14], entrada_corrigida[13], entrada_corrigida[12], entrada_corrigida[11], entrada_corrigida[10], entrada_corrigida[9], entrada_corrigida[8], entrada_corrigida[6], entrada_corrigida[5], entrada_corrigida[4], entrada_corrigida[2]};
end

endmodule

module injetor(
  input [14:0] entrada,
  input [3:0] n,
  input erro,
  output reg [14:0] saida
);

// implemente seu código aqui
always @(entrada, n, erro) begin
  saida = entrada;
  if(erro && (n < 15)) begin
    saida[n] = ~saida[n]; 
  end
end

endmodule

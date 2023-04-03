// Autor: Yuri Siqueira Dantas
// Feito no EDA Playground 
module identificador
	(
		input  clk,
		input  reset,
		input  in, // entrada serial
      input  [3:0] refe,// referência
		output reg flag // flag para disparar quando a sequência for identificada 
		);

  logic [3:0] aux;                

  always_ff @(posedge clk, posedge reset)
	begin
      if(reset)
		begin
			aux <= 4'd0;//auxiliar para receber 4 bits da entrada e verificar com a referência 
		end
		else begin
          aux[3] <= in; 
          aux[2] <= aux[3];
          aux[1] <= aux[2];
          aux[0] <= aux[1];
		end
	end

	always_comb begin
      if(aux == refe) flag = 1; //verificando a referência 

		else flag = 0;
	end

endmodule

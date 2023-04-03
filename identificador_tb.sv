//Autor: Yuri Siqueira Dantas
// Feito no EDA playground

module tb;
	logic clk, rst;
  logic [3:0] refe_u;
	logic in_u;
	logic flag_u;
  logic [3:0] aux_u;
	identificador dut(
		.clk (clk),
		.reset (rst),
      .in (in_u),
      .refe (refe_u),
      .flag (flag_u)
		);
  int fixed_seed =10; // escolhendo uma seed para o urandom
		
	initial 
	begin
      $dumpfile("dump.vcd");
      $dumpvars;
     
      $urandom (fixed_seed); //utilizando o random 
      	#1 rst = 1'b1;
      	clk = 1'b0;
		#1 rst = 1'b0;
		#1 rst = 1'b1;
    	#1 rst = 1'b0;

      for(int i = 0; i < 4; i++) begin  //4 sequencias serão identificadas
          refe_u = $urandom_range(0,15);
        $display("Sequencia a ser identificada:%b ", refe_u); 
        for (int j = 0; j < 1000; j++) begin // a entrada serial sera gerada 1000x
              in_u = $urandom_range(0,1);
				#1 clk = 1;
				#1 clk = 0;
              $display("%b , %b", in_u, flag_u); 
              if (flag_u == 1)
                  begin
                    $display("SEQUENCIA IDENTIFICADA: %b ", refe_u); 			
                    j = 1000;
                  end
			end
		end
		$finish();
	end
	
endmodule

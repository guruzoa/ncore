`include "cache_pkg.sv"
module data_memory_cache_sim(
			 input logic clk,
			 input 	     cache::cache_req_t data_req,
			 input       cache::cache_data_t data_write,
			 output      cache::cache_data_t data_read
);   
   parameter size = 1024;   
   cache::cache_data_t data_mem[0:size-1];
   cache::cache_data_t result;
      
   initial begin
      for (int i=0; i < size; i++) begin
	 data_mem[i] = '0;
      end
   end

   
   assign data_read = result;
      
   always_ff @(posedge(clk)) begin
      result <= data_mem[data_req.index];
      if (data_req.we) begin
	 data_mem[data_req.index] <= data_write;	 
      end
   end
endmodule

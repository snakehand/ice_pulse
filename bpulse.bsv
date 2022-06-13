interface Bpulser;
    method Bool get_blink() ;
endinterface

(* synthesize, no_default_reset *)
module bpulse (Bpulser);
   Reg#(Bool) this_out <- mkRegU();
   Reg#(UInt#(24))  this_cnt <- mkRegU();

   rule cnt;  // predicate condition always true, so omitted
      this_cnt <= this_cnt + 1;
      // if (this_cnt == 0) this_out <= ! this_out;
      UInt#(8) a = truncate(this_cnt >> 16);
      UInt#(8) b = truncate(this_cnt);
      this_out <= a > b;
      $display("%0d", this_cnt);
   endrule: cnt

   method get_blink() ;
      return this_out;
   endmethod

endmodule: bpulse

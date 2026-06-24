`include "module.v"
module muxtest ;
    reg [15:0] inputs;
    reg [3:0] sel;
    wire out;
    mux16to1 mux1 (.in(inputs),.sel(sel),.out(out));
    
    initial 
    begin
        $dumpfile(mux16to1.vcd);
        $dumpfile(0,muxtest);
        $monitor($time,"inputs=%h,sel=%h,out=%b");
        #5 inputs=16'h3f0a; sel=4'h0;
        #5 sel=4'h1;
        #5 sel=4'h6;
        #5 sel=4'h2;
        #5 sel=4'hc;
        #5 $finish;
    end
        
endmodule
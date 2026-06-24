module mux16to1 (
    in,sel,out
);
    input [15:0] in;
    input [3:0] sel;
    output out;
    assign out  = in[sel];
endmodule



module muxtest ;
    reg [15:0] inputs;
    reg [3:0] sel;
    wire out;
    mux16to1 mux1 (.in(inputs),.sel(sel),.out(out));
    
    initial 
    begin
        $dumpfile("mux16to1.vcd");
        $dumpvars(0,muxtest);
        $monitor("%0t inputs=%h,sel=%h,out=%b", $time, inputs, sel, out);
        #5 inputs=16'h3f0a; sel=4'h0;
        #5 sel=4'h1;
        #5 sel=4'h6;
        #5 sel=4'h2;
        #5 sel=4'hc;
        #5 $finish;
    end
        
endmodule
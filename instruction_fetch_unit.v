
module ifu(
    input clock,reset,
    output reg[31:0]  pc
);
  // 32-bit program counter is initialized to zero


    always @(posedge clock, posedge reset)
    begin
        if(reset == 1)  //If reset is one, clear the program counter
        pc <= 0;
        else
        pc <= pc+4;   // Increment program counter on positive clock edge
    end

endmodule
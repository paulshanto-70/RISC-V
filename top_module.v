module PROCESSOR( 
    input clock, 
    input reset,
    output zero
);
    wire [31:0]pc;
    wire [31:0] instruction_code;
    wire [3:0] alu_control;
    wire regwrite;
     ifu IFU_module(clock, reset, pc);


    instruction_mem imu(pc,reset,instruction_code);
    
	
    control_unit control_module(instruction_code[31:25], instruction_code[14:12],instruction_code[6:0], alu_control, regwrite);
	
    data_path datapath_module(instruction_code[19:15], instruction_code[24:20], instruction_code[11:7], alu_control, regwrite, clock, reset, zero);

endmodule
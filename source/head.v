// ALUopcode
`define ALUAdd 2'b00
`define ALUSub 2'b01
`define ALUAnd 2'b10
`define ALUOr 2'b11

`define ALUMultiple 1'b0
`define ALUDivide 1'b1

// ExtSel
`define ZeroExd 1'b0
`define SignExd 1'b1

// PCSrc
`define NextIns 2'b00
`define RelJmp 2'b01 //relative jump
`define AbsJmp 2'b10 //absolute jump
`define RsJmp 2'b11 // Jump to Rs, by JR instrustion

// for instruction
// op code
`define opRFormat 6'b000000
`define opADD 6'b000000
`define opSUB 6'b000000
`define opAND 6'b000000
`define opOR 6'b000000
`define opSLL 6'b000000
`define opSLT 6'b000000
`define opJR 6'b000000
`define opSLTI 6'b010001
`define opADDI 6'b001000
`define opORI 6'b001101
`define opSW 6'b101011
`define opLW 6'b100011
`define opBEQ 6'b000100
`define opBNE 6'b000101
`define opBGTZ 6'b000111
`define opJ 6'b000010
`define opJAL 6'b011000
`define opHALT 6'b111111
// func code
`define funcADD 6'b100000
`define funcSUB 6'b100011
`define funcAND 6'b100100
`define funcOR 6'b100101
`define funcSLL 6'b000000
`define funcSLT 6'b101010
`define funcJR 6'b000001

// ALU state
`define sIdle 2'b00
`define sAdd 2'b01
`define sInverse 2'b10 // for Inverse
`define sMAdd 2'b11 // for Minus Add
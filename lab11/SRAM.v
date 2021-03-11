`include "./SRAMCELL.v"

module SRAM (Address, InData, OutData, bCE, bWE);

parameter AddressSize = 18;		// 2^18 = 256K
parameter WordSize = 8;			// 8 bits

// Port Declaration
// ...
// ...
input [AddressSize-1:0] Address;
input [WordSize-1:0] InData;
input bCE, bWE;
output [WordSize-1:0] OutData;
reg [WordSize-1:0] OutData;

// Internal Variable
// ...
wire [2**AddressSize-1:0] readOut;
reg   [WordSize-1:0] memory [2**AddressSize-1:0];
// Function Read
always @(bCE or bWE or Address)
begin
	// ...
	if (bCE==0 && bWE==1) begin
	OutData <= memory[Address];
	end
end

// Function Write
always @(bCE or bWE or Address or InData)
begin
	// ...
	if (bCE==0 && bWE==0)
	memory[Address] <= InData;
end

endmodule


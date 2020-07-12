// SystemVerilog implementation of Gameboy Color boot rom
module boot_rom
(
	input logic clk,
	input logic [7:0] addr,
	output logic [7:0] data
);
	logic [0:255][7:0] rom = '{
		'h31,'hFE,'hFF,'hAF,'h21,'hFF,'h9F,'h32,'hCB,'h7C,'h20,'hFB,'h21,'h26,'hFF,'h0E,
		'h11,'h3E,'h80,'h32,'hE2,'h0C,'h3E,'hF3,'hE2,'h32,'h3E,'h77,'h77,'h3E,'hFC,'hE0,
		'h47,'hF0,'h50,'hFE,'h42,'h28,'h75,'h11,'h04,'h01,'h21,'h10,'h80,'h1A,'h4F,'hCD,
		'hA0,'h00,'hCD,'hA0,'h00,'h13,'h7B,'hFE,'h34,'h20,'hF2,'h11,'hB2,'h00,'h06,'h08,
		'h1A,'h22,'h22,'h13,'h05,'h20,'hF9,'h3E,'h19,'hEA,'h10,'h99,'h21,'h2F,'h99,'h0E,
		'h0C,'h3D,'h28,'h08,'h32,'h0D,'h20,'hF9,'h2E,'h0F,'h18,'hF3,'h67,'h3E,'h64,'h57,
		'hE0,'h42,'h3E,'h91,'hE0,'h40,'h04,'h1E,'h02,'h0E,'h0C,'hF0,'h44,'hFE,'h90,'h20,
		'hFA,'h0D,'h20,'hF7,'h1D,'h20,'hF2,'h0E,'h13,'h24,'h7C,'h1E,'h83,'hFE,'h62,'h28,
		'h06,'h1E,'hC1,'hFE,'h64,'h20,'h06,'h7B,'hE2,'h0C,'h3E,'h87,'hE2,'hF0,'h42,'h90,
		'hE0,'h42,'h15,'h20,'hD2,'h05,'h20,'h64,'h16,'h20,'h18,'hCB,'hE0,'h40,'h18,'h5C,
		'h06,'h04,'hC5,'hCB,'h11,'h17,'hC1,'hCB,'h11,'h17,'h05,'h20,'hF5,'h22,'h22,'h22,
		'h22,'hC9,'h3C,'h42,'hB9,'hA5,'hB9,'hA5,'h42,'h3C,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,
		'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,
		'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,
		'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,
		'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'hFF,'h3E,'h01,'hE0,'h50};
	always_ff @(posedge clk)
	begin
		data <= rom[addr];
	end
endmodule

module fast_boot_rom
(
	input logic clk,
	input logic [7:0] addr,
	output logic [7:0] data
);
	logic [0:255][7:0] rom = '{
		'h31,'hFE,'hFF,'h21,'h00,'h80,'h22,'hCB,'h6C,'h28,'hFB,'h3E,'h80,'hE0,'h26,'hE0,
		'h11,'h3E,'hF3,'hE0,'h12,'hE0,'h25,'h3E,'h77,'hE0,'h24,'h3E,'hFC,'hE0,'h47,'h11,
		'h04,'h01,'h21,'h10,'h80,'h1A,'h47,'hCD,'h82,'h00,'hCD,'h82,'h00,'h13,'h7B,'hEE,
		'h34,'h20,'hF2,'h11,'hB1,'h00,'h0E,'h08,'h1A,'h13,'h22,'h23,'h0D,'h20,'hF9,'h3E,
		'h19,'hEA,'h10,'h99,'h21,'h2F,'h99,'h0E,'h0C,'h3D,'h28,'h08,'h32,'h0D,'h20,'hF9,
		'h2E,'h0F,'h18,'hF5,'h3E,'h91,'hE0,'h40,'h06,'h2D,'hCD,'hA3,'h00,'h3E,'h83,'hCD,
		'hAA,'h00,'h06,'h05,'hCD,'hA3,'h00,'h3E,'hC1,'hCD,'hAA,'h00,'h06,'h46,'hCD,'hA3,
		'h00,'h21,'hB0,'h01,'hE5,'hF1,'h21,'h4D,'h01,'h01,'h13,'h00,'h11,'hD8,'h00,'hC3,
		'hFE,'h00,'h3E,'h04,'h0E,'h00,'hCB,'h20,'hF5,'hCB,'h11,'hF1,'hCB,'h11,'h3D,'h20,
		'hF5,'h79,'h22,'h23,'h22,'h23,'hC9,'hE5,'h21,'h0F,'hFF,'hCB,'h86,'hCB,'h46,'h28,
		'hFC,'hE1,'hC9,'hCD,'h97,'h00,'h05,'h20,'hFA,'hC9,'hE0,'h13,'h3E,'h87,'hE0,'h14,
		'hC9,'h3C,'h42,'hB9,'hA5,'hB9,'hA5,'h42,'h3C,'h00,'h00,'h00,'h00,'h00,'h00,'h00,
		'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,
		'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,
		'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,
		'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'h00,'hE0,'h50};
	always_ff @(posedge clk)
	begin
		data <= rom[addr];
	end
endmodule


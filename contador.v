`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Instituto Tecnologico de Costa Rica
// Laboratorio de diseño de sistemas digital
// Profesor: Alfonso Chacon
//
// Estudiantes:
// Edgar Solera Bolaños
// Diego Salazar Sibaja 
//
// Control de máquina contra incendios
////////////////////////////////////////////////////////////////////////////////// 
module contador
#(parameter N = 2) 
(
	input clk,
	input reset,
	output [N-1:0] salida 
    );

reg [N-1:0] intermediario;


always @(posedge clk,posedge reset)
begin
	if(reset==1)
	intermediario <=0;
	else
	intermediario<= intermediario+1'b1;
end
	
assign salida=intermediario;
endmodule

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
module mem_T_baja(
    input adress,
    output reg [10:0] salida
    );

localparam A= 2'b0, B= 2'b1;
always @(adress)
		case (adress)
			A:
			salida=12'b11111111111;
			B:
			salida=12'b11101000001;
			endcase
endmodule

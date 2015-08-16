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
module MaquinaDeEstados(
	input Clk, 
	input Reset,
	input	Humo,T1,T2,CS,
	output TempAlto,TempMedio,HumoOut,Elec,EJECA,EJECB,EJECC,EJECD
    );
	 	 
	 localparam [2:0] s0= 3'b000,
							s1= 3'b001,
							s2= 3'b010,
							s3= 3'b011,
							s4= 3'b100,
							s5= 3'b101,
							s6= 3'b110,
							s7= 3'b111;		
							
		reg [2:0] State, NextState;
		reg A,B,C,D,RTA,RTM,RH,RCS;
		


		always @(posedge Clk, posedge Reset)
		begin
			if(Reset)
				State<=s0;
			else 
				State<=NextState;
		end
			
		always @*
		begin
		A=0;
		B=0;
		C=0;
		D=0;
		RTA=0;
		RTM=0;
		RH=0;
		RCS=0;
			case(State)
				s0:
					if( T1 )begin
						NextState=s1;
						RTA=1;
						A=1;
						end
					else begin
						NextState=s2;
						A=1;
						end
				s1:
				begin
					NextState=s2;
				end
				s2:
					if(~T1 & T2)begin
						NextState=s3;
						RTM=1;
						B=1;
						end
					else begin
						NextState=s4;
						B=1;
						end
				s3:
				begin
					NextState=s4;
				end
				s4:
					if(Humo) begin
						NextState=s5;
						RH=1;
						C=1;
						end
					else begin
						NextState=s6;
						C=1;
						end
				s5:
				begin
					NextState=s6;
				end
				s6:
					if(CS)
					begin
						NextState=s7;
						RCS=1;
						D=1;
					end
					else begin
						NextState=s0;
						D=1;
						end
				s7:
				begin
					NextState=s0;
				end
			
			default: NextState=s7;
			endcase
			end
		
	assign HumoOut=RH;
	assign TempAlto= RTA;
	assign TempMedio=RTM;
	assign Elec = RCS;
	assign EJECA=A;
	assign EJECB=B;
	assign EJECC=C;
	assign EJECD=D;

endmodule 

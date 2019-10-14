
{REDUND_ERROR} FUNCTION_BLOCK FB_Integrator (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		in : REAL;
	END_VAR
	VAR_OUTPUT
		out : REAL;
	END_VAR
	VAR
		dt : REAL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK FB_Motor (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		u : REAL;
	END_VAR
	VAR_OUTPUT
		phi : REAL;
		w : REAL;
	END_VAR
	VAR
		integrator : FB_Integrator;
		Tm : REAL;
		ke : REAL;
		dt : REAL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK FB_Regulator (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		e : REAL; (*рассогласование между задающим воздействием и реальной скоростью вращения вала ДПТ об/мин*)
	END_VAR
	VAR_OUTPUT
		u : REAL; (*напряжение на выходе ДПТ В*)
	END_VAR
	VAR
		k_p : REAL; (*П коэф регулятора*)
		k_i : REAL; (*И коэф регулятора*)
		integrator : FB_Integrator; (*Интегратор*)
		iyOld : REAL; (*храниение предыдущего значения схемы противонакопления*)
		max_abs_value : REAL; (*Umax*)
		dt : REAL; (*хе-хе-хе*)
		e_kp : REAL; (*промежуточное значение вычесления*)
	END_VAR
END_FUNCTION_BLOCK

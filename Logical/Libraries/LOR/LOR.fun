
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
		e : REAL; (*��������������� ����� �������� ������������ � �������� ��������� �������� ���� ��� ��/���*)
	END_VAR
	VAR_OUTPUT
		u : REAL; (*���������� �� ������ ��� �*)
	END_VAR
	VAR
		k_p : REAL; (*� ���� ����������*)
		k_i : REAL; (*� ���� ����������*)
		integrator : FB_Integrator; (*����������*)
		iyOld : REAL; (*��������� ����������� �������� ����� �����������������*)
		max_abs_value : REAL; (*Umax*)
		dt : REAL; (*��-��-��*)
		e_kp : REAL; (*������������� �������� ����������*)
	END_VAR
END_FUNCTION_BLOCK

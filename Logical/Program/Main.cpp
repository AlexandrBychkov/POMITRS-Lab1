
#include <bur/plctypes.h>

#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

// amount of memory to be allocated for heap storage must be specified for every ANSI C++ program with the bur_heap_size variable
unsigned long bur_heap_size = 0xFFFF; 

void _INIT ProgramInit(void)
{
	fb_motor.dt=0.0001;
	fb_motor.ke=2;
	fb_motor.Tm=0.4;
	fb_motor.integrator.dt=0.0001;

	fb_motor2.dt=0.0001;
	fb_motor2.ke=2;
	fb_motor2.Tm=0.4;
	fb_motor2.integrator.dt=0.0001;
	
	fb_regulator.dt=0.0001;
	fb_regulator.k_p=8;
	fb_regulator.k_i=20;
	fb_regulator.max_abs_value=24;
	fb_regulator.integrator.dt=0.0001;
	
	enable=1;
	count=0;

}

void _CYCLIC ProgramCyclic(void)
{
	if(enable)
	{
		count+=10;
		if(count<=2500)
		{
			speed=0;
		}
			
		else
		{
			speed=6;
			if(count>=5000)
			{
				count=0;
			}
		}
	}
	fb_regulator.e=speed - fb_motor.w;
	fb_motor2.u=speed;
	FB_Regulator(&fb_regulator);
	fb_motor.u=fb_regulator.u;
	FB_Motor(&fb_motor);
	FB_Motor(&fb_motor2);

}

void _EXIT ProgramExit(void)
{
	// Insert code here 

}


#include <bur/plctypes.h>
#ifdef __cplusplus
	extern "C"
	{
#endif
	#include "LOR.h"
#ifdef __cplusplus
	};
#endif
/* TODO: Add your comment here */
void FB_Motor(struct FB_Motor* inst)
{
	inst->integrator.in = (inst->u/inst->ke - inst->w)*inst->dt/inst->Tm;
	inst->integrator.out = inst->w;
	FB_Integrator(&(inst->integrator));
	inst->integrator.in = inst->w * inst->dt;
	inst->integrator.out = inst->phi;
	FB_Integrator(&(inst->integrator));
	inst->phi = inst->integrator.out;
}

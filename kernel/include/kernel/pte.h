#ifndef HEADER_PTE_H
#define HEADER_PTE_H

#include <stdint.h>

enum PAGE_PTE_FLAGS {
 
	I86_PTE_PRESENT		=	1,		//0000000000000000000000000000001
	I86_PTE_WRITABLE		=	2,		//0000000000000000000000000000010
	I86_PTE_USER			=	4,		//0000000000000000000000000000100
	I86_PTE_WRITETHOUGH		=	8,		//0000000000000000000000000001000
	I86_PTE_NOT_CACHEABLE	=	0x10,		//0000000000000000000000000010000
	I86_PTE_ACCESSED		=	0x20,		//0000000000000000000000000100000
	I86_PTE_DIRTY			=	0x40,		//0000000000000000000000001000000
	I86_PTE_PAT			=	0x80,		//0000000000000000000000010000000
	I86_PTE_CPU_GLOBAL		=	0x100,		//0000000000000000000000100000000
	I86_PTE_LV4_GLOBAL		=	0x200,		//0000000000000000000001000000000
   	I86_PTE_FRAME			=	0x7FFFF000 	//1111111111111111111000000000000
};

typedef uint32_t pt_entry;

extern void pt_entry_add_attrib(pt_entry * e, uint32_t attrib);
extern void pt_entry_del_attrib(pt_entry * e, uint32_t attrib);
extern void pt_entry_set_frame(pt_entry * e, uint32_t addr);
extern uint32_t pt_entry_is_present(pt_entry e);
extern uint32_t pt_entry_is_writable(pt_entry e);
extern uint32_t pt_entry_pfn(pt_entry e);

#endif
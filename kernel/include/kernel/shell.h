#define MAX_COMMANDS 100
#define MAX_COMMANDS_HISTORY 100

typedef struct
{
	char *name;
	char *description;
	void *func;
} command_table_t;

extern void add_new_command();
extern void help_command();
extern void hello_command();
extern void reboot_command();
extern void read_command();
extern void write_command();
extern void mbr_command();
extern void clear_command();
extern void empty_command();
extern uint8_t mouse_cycle;
extern int8_t mouse_byte[4];
extern int mouse_x;
extern int mouse_y;

typedef enum {
	LEFT_CLICK   = 0x01,
	RIGHT_CLICK  = 0x02,
	MIDDLE_CLICK = 0x04,

	MOUSE_SCROLL_UP = 0x10,
	MOUSE_SCROLL_DOWN = 0x20,
} mouse_click_t;

typedef struct {
	uint32_t magic;
	int32_t x_difference;
	int32_t y_difference;
	mouse_click_t buttons;
} mouse_device_packet_t;

#define MOUSE_MAGIC 0xFEED1234
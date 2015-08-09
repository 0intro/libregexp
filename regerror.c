#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "regexp9.h"

void
regerror(char *s)
{
	char buf[132];

	strncpy(buf, "regerror: ", sizeof(buf));
	strncat(buf, s, sizeof(buf)-1);
	strncat(buf, "\n", sizeof(buf)-1);
	write(2, buf, strlen(buf));
	exit(1);
}

#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "regexp9.h"

void
regerror(char *s)
{
	char buf[132];

	strcpy(buf, "regerror: ");
	strcat(buf, s);
	strcat(buf, "\n");
	write(2, buf, strlen(buf));
	exit(1);
}

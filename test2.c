#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "regexp9.h"

int
main()
{
	Resub rs[10];
	Reprog *p;
	char *s;

	p = regcomp("[^a-z]");
	s = "\n";
	if(regexec(p, s, rs, 10))
		printf("%s %p %p %p\n", s, s, rs[0].s.sp, rs[0].e.ep);
	s = "0";
	if(regexec(p, s, rs, 10))
		printf("%s %p %p %p\n", s, s, rs[0].s.sp, rs[0].e.ep);
	exit(0);
}

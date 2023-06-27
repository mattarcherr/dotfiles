//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/    /*Command*/	                    /*Update Interval*/	/*Update Signal*/
        /*{"",        "~/scripts/dwmblocks/sb-volume",         5,                  1}, 
	{"",        "~/scripts/dwmblocks/sb-lan",	     5,		         5}, */
	{"",        "~/scripts/dwmblocks/sb-clock",	     5,		         6},
	{"",        "~/scripts/dwmblocks/sb-power",          5,                  7},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 10;

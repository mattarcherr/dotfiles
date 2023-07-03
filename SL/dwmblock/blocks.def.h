//Modify this file to change what commands output to your statusbar, and recompile using the make command.

// DESKTOP CONFIGURATION
static const Block blocks[] = {
	/*Icon*/    /*Command*/	                    /*Update Interval*/	/*Update Signal*/
        //{"",        "~/scripts/dwmblocks/sb-volume",         5,                  1}, 
	{"",        "~/scripts/dwmblocks/sb-lan",	     5,		         2},
	{"",        "~/scripts/dwmblocks/sb-clock",	     5,		         3},
	{"",        "~/scripts/dwmblocks/sb-power",          5,                  4},
};


// LAPTOP CONFIGURATION
//static const Block blocks[] = {
//	/*Icon*/    /*Command*/	                    /*Update Interval*/	/*Update Signal*/
//        {"",        "~/scripts/dwmblocks/sb-volume",         5,                  1},
//        {"",        "~/scripts/dwmblocks/sb-battery",        5,                  2},
//        {"",        "~/scripts/dwmblocks/sb-backlight",      5,                  3},
//        {"",        "~/scripts/dwmblocks/sb-bluetooth",      5,                  4},
//	{"",        "~/scripts/dwmblocks/sb-wlan",	     5,		         5},
//	{"",        "~/scripts/dwmblocks/sb-clock",	     5,		         6},
//	{"",        "~/scripts/dwmblocks/sb-power",          5,                  7},
//};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 10;

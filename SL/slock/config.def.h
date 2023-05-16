/* user and group to drop privileges to */
static const char *user  = "matt";
static const char *group = "power";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#4A5771",     /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "#CC3333",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

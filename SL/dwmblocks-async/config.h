#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Allows clicking blocks
#define CLICKABLE_BLOCKS 1

// Define blocks for the status feed as X(icon, cmd, interval, signal).
// DESKTOP CONFIGURATION
#define BLOCKS(X)             \
    X("", "~/scripts/dwmblocks/sb-packages",   600,  1) \
    X("", "~/scripts/dwmblocks/sb-lan",        5,  2)  \
    X("", "~/scripts/dwmblocks/sb-clock",      30, 3)  \
    X("", "~/scripts/dwmblocks/sb-power",      1,  4) 

// LAPTOP CONFIGURATION
/*#define BLOCKS(X)             \
    X("", "~/scripts/dwmblocks/sb-volume",    5,  1) \
    X("", "~/scripts/dwmblocks/sb-battery",   60, 2) \
    X("", "~/scripts/dwmblocks/sb-backlight", 5,  3) \
    X("", "~/scripts/dwmblocks/sb-bluetooth", 60, 4) \
    X("", "~/scripts/dwmblocks/sb-wlan",      5,  5) \
    X("", "~/scripts/dwmblocks/sb-clock",     12, 6) \
    X("", "~/scripts/dwmblocks/sb-power",     1,  7) */

#endif  // CONFIG_H

# Functions for translating between decimal to radix-N positional systems with arbitrary symbols

import math

# Array of symbols used in the desired radix-N positional system.  The radix of the system is equal
# to the number of items in this array.  Symbols are placed in ascending order so that each symbol's
# index is the same as the symbol's decimal equivalent.  Currently populated with the symbols for
# the pentanonagesimal (radix-95) ASCII positional system.

radix_n_symbols = [' ', '!', '"', '#', '$', '%', '&', '\'', '(', ')',
                   '*', "+", ',', '-', '.', '/', '0', '1', '2', '3',
                   '4', '5', '6', '7', '8', '9', ':', ';', '<', '=',
                   '>', '?', '@', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
                   'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
                   'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[',
                   '\\', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 'e',
                   'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
                   'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',
                   'z', '{', '|', '}', '~']


# Convert decimal to radix-N, where N is the size of radix_n_symbols
def to_radix_n(dec_num):
    radix_n_num = []
    quotient = dec_num

    while quotient > 0:
        remainder = quotient % len(radix_n_symbols)
        quotient = math.floor(quotient / len(radix_n_symbols))
        radix_n_num.insert(0, radix_n_symbols[remainder])

    return ''.join(radix_n_num)


# Convert radix-N to decimal, where N is the size of radix_n_symbols
def to_dec(radix_n_num):
    radix_n_arr = list(radix_n_num)
    radix_n_arr.reverse()

    dec_num = 0
    for digit in range(0, (len(radix_n_arr))):
        dec_num += int((radix_n_symbols.index(radix_n_arr[digit]) * math.pow(len(radix_n_symbols), digit)))

    return dec_num


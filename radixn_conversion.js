// Functions for translating between decimal to radix-N positional systems with arbitrary symbols

// Array of symbols used in the desired radix-N positional system.  The radix of the system is equal
// to the number of items in this array.  Symbols are placed in ascending order so that each symbol's
// index is the same as the symbol's decimal equivalent.  Currently populated with the symbols for
// the pentanonagesimal (radix-95) ASCII positional system.
const radixNSymbols = [' ', '!', '"', '#', '$', '%', '&', '\'', '(', ')',
                      '*', "+", ',', '-', '.', '/', '0', '1', '2', '3',
                      '4', '5', '6', '7', '8', '9', ':', ';', '<', '=',
                      '>', '?', '@', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
                      'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
                      'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[',
                      '\\', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 'e',
                      'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
                      'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',
                      'z', '{', '|', '}', '~'];

                 
// Convert decimal to radix-N, where N is the size of radixNSymbols
function toRadixN(decNum) {
    const radixNNum = []
    let quotient = decNum;
    
    while (quotient > 0) {
        let remainder = quotient % radixNSymbols.length;
        quotient = Math.floor(quotient / radixNSymbols.length);
        radixNNum.unshift(radixNSymbols[remainder]);
    };
    return radixNNum.join('');
}

// Convert radix-N to decimal, where N is the size of radixNSymbols
function toDec(radixNNum) {

    const radixNArr = radixNNum.split('');
    radixNArr.reverse();
    let decNum = 0;

    for (let i=0; i < radixNArr.length; i++) {
        decNum += (radixNSymbols.indexOf(radixNArr[i]) * Math.pow(radixNSymbols.length, i))
    };
    return decNum;
} 

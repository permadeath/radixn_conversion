-- Functions for translating between decimal to radix-N positional systems with arbitrary symbols

--[[ Array of symbols used in the desired radix-N positional system.  The radix of the system is equal
	 to the number of items in this array.  Symbols are placed in ascending order so that each symbol's
	 index is the same as the symbol's decimal equivalent.  Currently populated with the symbols for
	 the pentanonagesimal (radix-95) ASCII positional system.]]--
	 
radixNSymbols = {' ', '!', '"', '#', '$', '%', '&', '\'', '(', ')',
                 '*', "+", ',', '-', '.', '/', '0', '1', '2', '3',
                 '4', '5', '6', '7', '8', '9', ':', ';', '<', '=',
                 '>', '?', '@', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
                 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q',
                 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[',
                 '\\', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 'e',
                 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
                 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',
                 'z', '{', '|', '}', '~'}
				 
-- Code stolen from StackOverflow to return the size of a table
function getTableLng(tbl)
	local getN = 0
	for n in pairs(tbl) do 
		getN = getN + 1 
	end
	return getN
end

-- Code stolen from StackOverflow to get the index of a value in a table
function indexOf(array, value)
	for i, v in ipairs(array) do
		if v == value then
			return i
		end
	end
	return nil
end

radix = getTableLng(radixNSymbols)
				 
-- Convert decimal to radix-N, where N is the size of radixNSymbols
function toRadixN(decNum)
radixNNum = {}
	quotient = decNum
	
	while (quotient > 0)
	do
		remainder = quotient % radix
		quotient = math.floor(quotient / radix)
		table.insert(radixNNum, 1, radixNSymbols[(remainder + 1)])
	end
	return table.concat(radixNNum)
end

-- Convert radix-N to decimal, where N is the size of radixNSymbols
function toDec(radixNNum)
	radixNTable = {}
	for char in radixNNum:gmatch "." do
		table.insert(radixNTable, 1, char)
	end
	decNum = 0
	
	for i = 1, getTableLng(radixNTable), 1
	do
		charIndex = (indexOf(radixNSymbols, radixNTable[i]) - 1)
		decNum = decNum + (charIndex * math.pow(radix, (i - 1)))
	end
	return math.floor(decNum)
end

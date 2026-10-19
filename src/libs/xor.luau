--!native
--!optimize 2

--// Lib Private Functions
function repeatKey(text: string, key: string)
	local result = ""
	local keyLen = #key

	for i = 1, #text do
		local keyIndex = ((i - 1) % keyLen) + 1
		result = result .. string.sub(key, keyIndex, keyIndex)
	end

	return result
end

function process(text: string, key: string)
	local result = {}
	local keyLen = #key

	for i = 1, #text do
		local textByte = string.byte(text, i)
		local keyByte = string.byte(key, (i - 1) % keyLen + 1)

		local xoredByte = bit32.bxor(textByte, keyByte)

		table.insert(result, string.char(xoredByte))
	end

	return table.concat(result)
end

--// Lib Public Functions
function encodeHex(text: string, key: string)
	local fullKey = repeatKey(text, key)
	local result = ""

	for i = 1, #text do
		local encodeByte = bit32.bxor(string.byte(text, i), string.byte(fullKey, i))
		result = result .. string.format("%02X", encodeByte)
	end

	return result
end

function decodeHex(hexText: string, key: string)
	local bytes = ""

	for i = 1, #hexText, 2 do
		local byteVal = tonumber(string.sub(hexText, i, i + 1), 16)
		bytes = bytes .. string.char(byteVal)
	end

	local fullKey = repeatKey(bytes, key)
	local result = ""

	for i = 1, #bytes do
		local decodeByte = bit32.bxor(string.byte(bytes, i), string.byte(fullKey, i))
		result = result .. string.char(decodeByte)
	end

	return result
end

--// Lib Decleration
return {
    encodeHex = encodeHex,
    decodeHex = decodeHex,
    encodeText = process,
    decodeText = process
}

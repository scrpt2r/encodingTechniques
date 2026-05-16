# encodingTechniques

Collection of encoding and bitwise techniques

## Structure

```
soundHandler.luau/ ← entry point
  ├─ libs ← xor.luau / base64.luau
```

## Usage

```lua
local replicatedStorage = game:GetService("ReplicatedStorage")

local xor = require(replicatedStorage.encodingTechniques).xor 
local base64 = require(replicatedStorage.encodingTechniques).base64

local text = "Hello World!"

local bEncoded = base64.encode(text)
local bDecoded = base64.decode(bEncoded)

local encodedHex = xor.encodeHex(text, bEncoded)
local decodedHex = xor.decodeHex(encodedHex, bEncoded)

local encodedText = xor.encodeText(text, bEncoded)
local decodedText = xor.decodeText(encodedText, bEncoded)

print(bEncoded) -- SGVsbG8gV29ybGQh
print(bDecoded) -- Hello World!

print(encodedHex) -- 1B223A1F0D676F08245E5D58
print(decodedHex) -- Hello World!

print(encodedText) --[[":
				       go$^]X]]
print(decodedText) -- Hello World!
```
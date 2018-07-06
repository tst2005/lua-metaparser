

Usual Operations :
- gettype
- getcontent & getcontentsize
- getattr


# How I choosen my AST format

## Metalua

The metalua notation is `\`Table{"a", "b", "c", pos=123}`

In real lua it is `{tag="Table", "a", "b", "c", pos=123}`

Pro/Cons
* "-" json incompatible
* "+" attribute supported
* "+" fast access to content size

```
	self = {
		tag="Table",
		"a",
		"b",
		"c",
		pos=123,
	}
	type = self.tag
	contentsize = #self
	attr = self -- except tag that is already used
	content = ipairs(self)
```

## my format 1.0

Pro/Cons
* "+" json compatible (no mixed array/hash table)
* "-" no attribute
* "-" slow access to content size

```
	self = {
		"Table",
		"a",
		"b",
		"c",
	}
	type = self[1]
	contentsize = #self-1
	content = ipairs(self, 2, -1)
```

## my format 1.1

Pro/Cons
* "+" json compat
* "+" attribute
* "+/-" content size

```
	self = {
		"Table",
		"a",
		"b",
		"c",
		{
			pos=123,
		}
	}
	type = self[1]
	contentsize = #self-2
	attr = self[#self]
	content = ipairs(self, 2, -2)
```

## my format 2.0

* "+" json compatible
* "+" support attribute
* "+" fast access to content size

```
	self = { -- array
		"Table",
		{ -- array (or other value)
			"a",
			"b",
			"c",
		},
		{ -- hash
			pos=123,
		}
	}
	type = self[1]
	contentsize = #self[2]
	attr = self[3]
	content = ipairs(self[2])
```


# Conclusion

I planned to use the format v2

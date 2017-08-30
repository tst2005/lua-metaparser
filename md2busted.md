# Busted unit testing framework

## should be awesome

* should be easy to use

```lua
assert.truthy("Yup.")
```

* should have lots of features

```lua
-- deep check comparisons!
assert.are.same({ table = "great"}, { table = "great" })

-- or check by reference!
assert.are_not.equal({ table = "great"}, { table = "great"})

assert.truthy("this is a string") -- truthy: not false or nil

assert.true(1 == 1)
assert.is_true(1 == 1)

assert.falsy(nil)
assert.has_error(function() error("wat") end, "wat")
```

* should provide some shortcuts to common functions

```lua
assert.are.unique({{ thing = 1 }, { thing = 2 }, { thing = 3 }})
```

* should have mocks and spies for functional tests

```lua
local thing = require("thing_module")
spy.on(thing, "greet")
thing.greet("hi!")

assert.spy(thing.greet).was.called()
assert.spy(thing.greet).was.called_with("hi!")
```

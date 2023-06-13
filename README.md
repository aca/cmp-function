# cmp-function

Trigger function, alternative to https://github.com/L3MON4D3/LuaSnip/discussions/917

```
cmp_sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "function" },
}
```

```
require('cmp_function').register({
    { label = 'hello', kind = 15, documentation = "hello world", func = function() print("hello world") end },
    { label = 'hello2', kind = 15, documentation = "hello2 world", func = function() print("hello2 world") end },
})
```

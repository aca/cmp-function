local source = {}

function source.register(items)
    source._items = items
end

---Return whether this source is available in the current context or not (optional).
---@return boolean
function source:is_available()
    return true
end

---Return the debug name of this source (optional).
---@return string
function source:get_debug_name()
    return 'function'
end

---Invoke completion (required).
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
--- https://learn.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.languageserver.protocol.completionitemkind?view=visualstudiosdk-2022
function source:complete(params, callback)
    callback(self._items)
end

-- ---Resolve completion item (optional). This is called right before the completion is about to be displayed.
-- ---Useful for setting the text shown in the documentation window (`completion_item.documentation`).
-- ---@param completion_item lsp.CompletionItem
-- ---@param callback fun(completion_item: lsp.CompletionItem|nil)
-- function source:resolve(completion_item, callback)
--   callback(completion_item)
-- end

---Executed after the item was selected.
---@param completion_item lsp.CompletionItem
---@param callback fun(completion_item: lsp.CompletionItem|nil)
function source:execute(completion_item, callback)
    for _, v in ipairs(self._items) do
        if completion_item.label == v.label then
            pcall(v.func)
        end
    end

    callback(completion_item)
end

return source

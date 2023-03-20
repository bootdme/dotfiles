local dap = require('dap')

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
    {
        name = 'Launch file',
        type = 'cppdbg',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = false,
        linux = {
            MIMode = 'gdb',
            miDebuggerPath = '/usr/bin/gdb',
        },
        osx = {
            MIMode = 'lldb',
        },
    },
    {
        name = 'Attach process',
        type = 'cppdbg',
        request = 'attach',
        processId = require('dap.utils').pick_process,
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        setupCommands = {
            {
                description = 'enable pretty printing',
                text = '-enable-pretty-printing',
                ignoreFailures = false,
            },
        },
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        -- miDebuggerPath = "/usr/bin/gdb",
        linux = {
            MIMode = 'gdb',
            miDebuggerPath = '/usr/bin/gdb',
        },
        osx = {
            MIMode = 'lldb',
        },
        cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

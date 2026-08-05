vim.pack.add({
    { src = "https://github.com/NicholasMata/nvim-dap-cs" },
    { src = "https://github.com/seblyng/roslyn.nvim" },
})

require("dap-cs").setup({
    debugger = {
        type = "coreclr",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
    },
})
require("roslyn").setup({
    extensions = {
        razor = {
            enabled = false,
            config = {},
        },
    },
})

vim.lsp.config("roslyn", {
    cmd = {
        vim.fn.executable("Microsoft.CodeAnalysis.LanguageServer") == 1 and "Microsoft.CodeAnalysis.LanguageServer" or "roslyn-language-server",
        "--logLevel",
        "Information",
        "--extensionLogDirectory",
        vim.fs.joinpath(vim.uv.os_tmpdir(), "roslyn_ls/logs"),
        "--stdio",
    },
    settings = {
        ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,

            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
        },
        ["csharp|completion"] = {
            dotnet_show_name_completion_suggestions = true,
            dotnet_show_completion_items_from_unimported_namespaces = true,
        },
        ["csharp|background_analysis"] = {
            background_analysis = {
                dotnet_analyzer_diagnostics_scope = "fullSolution",
                dotnet_compiler_diagnostics_scope = "fullSolution",
            },
        },
    },
})

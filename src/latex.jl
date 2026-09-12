# From https://github.com/fonsp/Pluto.jl/issues/1237

function latexify_md(args...; kwargs...)
    return LaTeX(repr(MIME"text/latex"(), latexify(args...; kwargs...)))
end

wrap_tex(x) = LaTeX(repr(MIME"text/latex"(), x))

#=
Issue also includes a suggestion to use
begin
	Markdown.html(io::IO, ls::LaTeXString) = 
		Markdown.html(io, Markdown.LaTeX(
			repr(MIME"text/latex"(), ls)
		))

	Markdown.htmlinline(io::IO, ls::LaTeXString) = 
		Markdown.htmlinline(io, Markdown.LaTeX(
			repr(MIME"text/latex"(), ls)
		))
end
=#



"""
Render LaTeX math text in an extra wide cell. This uses [PlutoUI.WideCell](https://featured.plutojl.org/basic/plutoui.jl#WideCell) to get an extra wide cell, and any content that does fit becomes scrollable: you can scroll the equation to reveal hidden parts.

# Example

```julia
widemath""\"
\\sqrt{some very long equation that does not fit in the screen normally} +
\\sqrt{some very long equation that does not fit in the screen normally} +
\\sqrt{some very long equation that does not fit in the screen normally}
"\""
```
"""
macro widemath_str(s)
	f(x) = Div([x]; style="min-width: max-content;") |> PlutoUI.WideCell
	LaTeX(s) |> MD |> f
end





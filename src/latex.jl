# From https://github.com/fonsp/Pluto.jl/issues/1237

using Latexify
using LaTeXStrings
export latexify_md, wrap_tex


latexify_md(args...; kwargs...) = Markdown.LaTeX(repr(MIME"text/latex"(), latexify(args...; kwargs...)))

wrap_tex(x) = Markdown.LaTeX(repr(MIME"text/latex"(), x))

#=
Issue also includes a suggestion to use
begin
	using Latexify
	using LaTeXStrings
	
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


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

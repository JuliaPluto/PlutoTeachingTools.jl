module PlutoTeachingTools

# Write your package code here.

using Random # , Distributions # not sure if we need that
using Markdown
using LaTeXStrings

export hint, tip 
export correct, still_missing, not_defined, keep_working, almost 
export TODO

"Hint box with arguement as text."
hint(text) = Markdown.MD(Markdown.Admonition("hint", "Hint", [text]));

"Tip box with arguement as text."
tip(text) = Markdown.MD(Markdown.Admonition("tip", "Pro Tip", [text]));

"Admonition box labeled a warning with arguement as text."
almost(text) = Markdown.MD(Markdown.Admonition("warning", "Almost there!", [text]));


"Admonition box with reminder to replace missing."
still_missing(text=md"Replace `missing` with your answer.") = Markdown.MD(Markdown.Admonition("warning", "Here we go!", [text]));

"Admonition box with reminder that variable name passed is not defined."
not_defined(variable_name) = Markdown.MD(Markdown.Admonition("danger", "Oopsie!", [md"Make sure that you define a variable called **$(Markdown.Code(string(variable_name)))**"]));

"Admonition box warning that the answer isn't quite right."
keep_working(text=md"The answer is not quite right.") = Markdown.MD(Markdown.Admonition("danger", "Keep working on it!", [text]));

yays = [md"Great!", md"Yay ❤", md"Great! 🎉", md"Well done!", md"Keep it up!", md"Good job!", md"Awesome!", md"You got the right answer!", md"Let's move on to the next section."];

"Box with random positive message."
correct(text=rand(yays)) = Markdown.MD(Markdown.Admonition("correct", "Got it!", [text]));

TODO_str = html"<span style='display: inline; font-size: 2em; color: purple; font-weight: 900;'>TODO</span>"
TODO() = TODO_str

""" Provides checkbox to toggle full width versus narrow with column for LiveDocs """
function WidthOverDocs(enabled=false)  # From PlutoThemes.jl
	checked = enabled ? "checked" : ""
	init = enabled ? "toggle_width(document.getElementById('width-over-livedocs'))" : ""
	return HTML("""
<!-- https://github.com/fonsp/Pluto.jl/issues/400#issuecomment-695040745 -->
<input
	type="checkbox"
	id="width-over-livedocs"
	name="width-over-livedocs"
    onclick="window.plutoOptIns.toggle_width(this)"
	$(checked)>
<label for="width-over-livedocs">
	Activate bigger width - hiding live docs
</label>
<style>
	body.width-over-docs #helpbox-wrapper {
    	display: none !important;
	}
	body.width-over-docs main {
		max-width: calc(100% - 4rem);
		margin-right: 2rem;
	}
</style>
<script>
	const toggle_width = function(t) {
		t.checked
		? document.body.classList.add("width-over-docs")
		: document.body.classList.remove("width-over-docs")
	}
	window.plutoOptIns = window.plutoOptIns || {}
	window.plutoOptIns.toggle_width = toggle_width
	$(init)
</script>
""")
end


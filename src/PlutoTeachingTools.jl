module PlutoTeachingTools

# Write your package code here.

using Random # , Distributions # not sure if we need that
using Markdown
using LaTeXStrings

export hint, tip 
export correct, still_missing, not_defined, keep_working, almost 
export TODO

hint(text) = Markdown.MD(Markdown.Admonition("hint", "Hint", [text]));

tip(text) = Markdown.MD(Markdown.Admonition("tip", "Pro Tip", [text]));

almost(text) = Markdown.MD(Markdown.Admonition("warning", "Almost there!", [text]));


still_missing(text=md"Replace `missing` with your answer.") = Markdown.MD(Markdown.Admonition("warning", "Here we go!", [text]));

not_defined(variable_name) = Markdown.MD(Markdown.Admonition("danger", "Oopsie!", [md"Make sure that you define a variable called **$(Markdown.Code(string(variable_name)))**"]));

keep_working(text=md"The answer is not quite right.") = Markdown.MD(Markdown.Admonition("danger", "Keep working on it!", [text]));

yays = [md"Great!", md"Yay ❤", md"Great! 🎉", md"Well done!", md"Keep it up!", md"Good job!", md"Awesome!", md"You got the right answer!", md"Let's move on to the next section."];

correct(text=rand(yays)) = Markdown.MD(Markdown.Admonition("correct", "Got it!", [text]));

TODO_str = html"<span style='display: inline; font-size: 2em; color: purple; font-weight: 900;'>TODO</span>"
TODO() = TODO_str

end

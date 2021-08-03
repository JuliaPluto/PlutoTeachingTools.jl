
using Random # , Distributions # not sure if we need that
using Markdown
using LaTeXStrings

export hint, tip, protip, almost, warning_box, danger 
export correct, still_missing, still_nothing, wrong_type
export var_not_defined, func_not_defined, keep_working
export not_defined  # deprecated
#export keep_working_if_var_contains_substr
export type_isa, type_eq
export code_for_check_type_funcs
export TODO
export display_msg_if_fail

"Hint box with arguement as text."
hint(text) = Markdown.MD(Markdown.Admonition("hint", "Hint", [text]));

"Tip box with arguement as text."
tip(text) = Markdown.MD(Markdown.Admonition("tip", "Tip", [text]));

"Tip box with arguement as text."
protip(text, invite = "Curious to learn more?";  boxlabel = "Pro Tip") = Foldable(invite, Markdown.MD(Markdown.Admonition("tip", boxlabel, [text])) );

"Admonition box labeled a warning with arguement as text."
almost(text) = Markdown.MD(Markdown.Admonition("warning", "Almost there!", [text]));

"warning box with arguement as text."
warning_box(text) = Markdown.MD(Markdown.Admonition("warning", "Warning:", [text]));

"Danger box with arguement as text."
danger(text) = Markdown.MD(Markdown.Admonition("danger", "Beware!", [text]));

"Admonition box with reminder to replace missing."
still_missing(text=md"Replace `missing` with your answer.") = Markdown.MD(Markdown.Admonition("warning", "Missing Response", [text]));

"Admonition box with reminder to replace nothing."
still_nothing(text=md"Replace `nothing` with your answer.") = Markdown.MD(Markdown.Admonition("warning", "Here we go!", [text]));

wrong_type() = Markdown.MD(Markdown.Admonition("danger", "Type Error", [md"Check the type of your response."]))

wrong_type(var::Symbol, type::Type; text=md"The type of $var should be $type") = Markdown.MD(Markdown.Admonition("danger", "Type Error", [text]))

"Admonition box with reminder that function name passed is not defined."
func_not_defined(func_name) = Markdown.MD(Markdown.Admonition("danger", "Oopsie!", [md"Make sure that you define a function called **$(Markdown.Code(string(func_name)))**"]));

"Admonition box with reminder that variable name passed is not defined."
var_not_defined(variable_name) = Markdown.MD(Markdown.Admonition("danger", "Oopsie!", [md"Make sure that you define a variable called **$(Markdown.Code(string(variable_name)))**"]));

"Admonition box with reminder that variable name passed is not defined.  (deprecated)"
not_defined(variable_name) = var_not_defined(variable_name)


"Admonition box warning that the answer isn't quite right."
keep_working(text=md"The answer is not quite right.") = Markdown.MD(Markdown.Admonition("danger", "Keep working on it!", [text]));

function keep_working_if_var_contains_substr(var::Symbol,str::Union{String,Markdown.MD},substr::String)
# I had to remove !@isdefined(var) due to how Pluto puts variables into different modules
# not exported, so provide function with same name in notebook
  if     ismissing(var)
         still_missing()
  elseif isnothing(var)
         still_nothing()
  else
      if typeof(str) == Markdown.MD
         str = Markdown.plain(str)
      end
      if occursin(substr,str)
         keep_working(md"Make sure to update the cell setting $var.")
      end
  end
end

type_isa(var, t::Union{Type,Vector{Type},Vector{DataType}}) = (any(typeof(var) .<: t))
type_eq(var, t::Union{Type,Vector{Type},Vector{DataType}}) = (any(typeof(var) .== t))

# To use functions in notebook, run eval(Meta.parse(code_for_check_type_funcs)) 
code_for_check_type_funcs = """
begin
function check_type_isa(sym::Symbol, var, t::Union{Type,Vector{Type},Vector{DataType}})
   if ismissing(var)
        passed = false
        text = md"The variable \$sym is still set to missing."
        msg = still_missing(text)
   elseif !type_isa(var,t) # (any(typeof(var) .<: t))
        passed = false
        text = "The type of \$sym is not correct.  It should be <: "
        if typeof(t) <: Type
           text = text * "\$t."
        else
           text = text * "one of "
           for tt in t
              if tt == last(t)
                 text = text * " or \$t."
              else
                 text = text * " \$t,"
              end
           end
        end
        msg = Markdown.MD(Markdown.Admonition("danger", "Type Error", [Markdown.MD(text)]))
   else
        passed = true
        msg = Markdown.MD("\$sym has the correct type.")
   end
   return (;passed, msg)
end
function check_type_eq(sym::Symbol, var, t::Union{Type,Vector{Type},Vector{DataType}})
   if ismissing(var)
        passed = false
        text = md"The variable \$sym is still set to missing."
        msg = still_missing(text)
   elseif !type_eq(var, t) # (any(typeof(var) == t))
        passed = false
        if typeof(t) <: Type
           text = "The type of \$sym should be \$t."
        else
           text = "The type of \$sym should be one of "
           for tt in t
              if tt == last(t)
                 text = text * " or \$t."
              else
                 text = text * " \$t,"
              end
           end
        end
        #text = md"The type of \$sym should be \$t."
        msg = Markdown.MD(Markdown.Admonition("danger", "Type Error", [Markdown.MD(text)]))
   else
        passed = true
        msg = Markdown.MD("\$sym has the correct type.")
   end
   return (;passed, msg)
end
end
"""

yays = [md"Great!", md"Yay ❤", md"Great! 🎉", md"Well done!", md"Keep it up!", md"Good job!", md"Awesome!", md"You got the right answer!", md"Let's move on to the next part."];

"Box with random positive message."
correct(text=rand(yays)) = Markdown.MD(Markdown.Admonition("correct", "Got it!", [text]));

TODO_str = html"<span style='display: inline; font-size: 2em; color: purple; font-weight: 900;'>TODO</span>"
TODO() = TODO_str

function display_msg_if_fail(x; msg_pass = nothing)
   if !x.passed
      x.msg
   else
      msg_pass
   end 
end


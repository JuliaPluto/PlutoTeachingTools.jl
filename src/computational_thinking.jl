
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
export TODO, nbsp
export display_msg_if_fail

"Hint box with arguement as text."
hint(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("hint", hint_str(lang), [text]));

"Tip box with arguement as text."
tip(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("tip", tip_str(lang), [text]));

"Tip box with arguement as text."
protip(text; lang::AbstractLanguage = default_language[], invite = protip_invite_str(lang), boxlabel = protip_boxlabel_str(lang)) = Foldable(invite, Markdown.MD(Markdown.Admonition("tip", boxlabel, [text])) );
protip(text, invite, lang::AbstractLanguage = default_language[]; boxlabel = protip_boxlabel_str(lang)) = protip(text; lang, invite, boxlabel);

"Admonition box labeled a warning with arguement as text."
almost(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("warning", almost_str(lang), [text]));

"warning box with arguement as text."
warning_box(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("warning", warning_box_str(lang), [text]));

"Danger box with arguement as text."
danger(text, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("danger", danger_str(lang), [text]));

"Admonition box with reminder to replace missing."
still_missing(;lang::AbstractLanguage = default_language[], text=still_missing_text_str(lang)) = Markdown.MD(Markdown.Admonition("warning", still_missing_str(lang), [text]));
still_missing(text, lang::AbstractLanguage = default_language[]) = still_missing(;lang, text);

"Admonition box with reminder to replace nothing."
still_nothing(; lang::AbstractLanguage = default_language[], text=still_nothing_text_str(lang)) = Markdown.MD(Markdown.Admonition("warning", still_nothing_str(lang), [text]));
still_nothing(text, lang::AbstractLanguage = default_language[]) = still_nothing(;lang, text);

wrong_type(lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("danger", wrong_type_str(lang), [wrong_type_text_str(lang)]))

wrong_type(var::Symbol, type::Type, lang::AbstractLanguage = default_language[]; text=wrong_type_text_str(lang, var, type)) = Markdown.MD(Markdown.Admonition("danger", wrong_type_str(lang), [text]))

"Admonition box with reminder that function name passed is not defined."
func_not_defined(func_name, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("danger", func_not_defined_str(lang), [func_not_defined_text_str(func_name, lang)]));

"Admonition box with reminder that variable name passed is not defined."
var_not_defined(variable_name, lang::AbstractLanguage = default_language[]) = Markdown.MD(Markdown.Admonition("danger", var_not_defined_str(lang), [var_not_defined_text_str(variable_name, lang)]));

"Admonition box with reminder that variable name passed is not defined. (deprecated)"
not_defined(variable_name, lang::AbstractLanguage = default_language[]) = var_not_defined(variable_name, lang)

"Admonition box warning that the answer isn't quite right."
keep_working(; lang::AbstractLanguage = default_language[], text=keep_working_text_str(lang)) = Markdown.MD(Markdown.Admonition("danger", keep_working_str(lang), [text]));
keep_working(text, lang::AbstractLanguage = default_language[]) = keep_working(;lang, text);

function keep_working_if_var_contains_substr(var::Symbol,str::Union{String,Markdown.MD},substr::String, lang::AbstractLanguage = default_language[])
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
         keep_working(keep_working_update_str(var, lang))
      end
  end
end

type_isa(var, t::Union{Type,Vector{Type},Vector{DataType}}) = (any(typeof(var) .<: t))
type_eq(var, t::Union{Type,Vector{Type},Vector{DataType}}) = (any(typeof(var) .== t))

# To use functions in notebook, run eval(Meta.parse(code_for_check_type_funcs)) 
code_for_check_type_funcs = """
begin
function check_type_isa(sym::Symbol, var, t::Union{Type,Vector{Type},Vector{DataType}}, lang::AbstractLanguage = PlutoTeachingTools.default_language[])
   if ismissing(var)
        passed = false
        text = PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang)
        msg = still_missing(text, lang)
   elseif !type_isa(var,t) # (any(typeof(var) .<: t))
        passed = false
        text = PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang)
        if typeof(t) <: Type
           text = text * "\$t."
        else
           text = text * PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang) * " "
           for tt in t
              if tt == last(t)
                 text = text * " " * PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang) * " \$t."
              else
                 text = text * " \$t,"
              end
           end
        end
        msg = Markdown.MD(Markdown.Admonition("danger", PlutoTeachingTools.check_type_isa_type_error_str(sym, lang), [Markdown.MD(text)]))
   else
        passed = true
        msg = PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang)
   end
   return (;passed, msg)
end
function check_type_eq(sym::Symbol, var, t::Union{Type,Vector{Type},Vector{DataType}}, lang::AbstractLanguage = PlutoTeachingTools.default_language[])
   if ismissing(var)
        passed = false
        text = PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang)
        msg = PlutoTeachingTools.still_missing(text, lang)
   elseif !type_eq(var, t) # (any(typeof(var) == t))
        passed = false
        if typeof(t) <: Type
           text = PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(sym, type, lang)
        else
           text = PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang)
           for tt in t
              if tt == last(t)
                 text = text * " " * PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang) * " \$t."
              else
                 text = text * " \$t,"
              end
           end
        end
        #text = md"The type of \$sym should be \$t."
        msg = Markdown.MD(Markdown.Admonition("danger", PlutoTeachingTools.check_type_eq_type_error_str(lang), [Markdown.MD(text)]))
   else
        passed = true
        msg = PlutoTeachingTools.check_type_eq_correct_str(sym, lang)
   end
   return (;passed, msg)
end
end
"""

"Box with random positive message."
correct(;lang::AbstractLanguage = default_language[], text=rand(yays(lang))) = Markdown.MD(Markdown.Admonition("correct", correct_str(lang), [text]));
correct(text, lang::AbstractLanguage = default_language[]) = correct(;lang, text);

TODO_str = html"<span style='display: inline; font-size: 2em; color: purple; font-weight: 900;'>TODO</span>"
TODO() = TODO_str

# Useful strings for embedding in markdown
nbsp = html"&nbsp;"

function display_msg_if_fail(x; msg_pass = nothing)
   if !x.passed
      x.msg
   else
      msg_pass
   end 
end


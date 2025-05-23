module PlutoTeachingTools

using PlutoUI.ExperimentalLayout: Div
using Markdown: @md_str, MD, Admonition, LaTeX
using HypertextLiteral: @htl, @htl_str
using Downloads: download # used in robustlocalresouce.jl
using PlutoUI: Resource, LocalResource # used in robustlocalresouce.jl
using PlutoUI: combine # used in footnotes.jl
using PlutoUI: Select # used in i8n/i8n.jl
using PlutoUI: details # used in present.jl for Foldable
using Latexify: latexify # used in latex.jl

include("i18n/i18n.jl") # framework for multiple language support
export AbstractLanguage, set_language!
export preferred_text

include("computational_thinking.jl")
export hint, tip, protip, almost, warning_box, question_box, answer_box, danger, keyconcept
export correct, still_missing, still_nothing, wrong_type
export var_not_defined, func_not_defined, keep_working
export not_defined  # deprecated
#export keep_working_if_var_contains_substr
export type_isa, type_eq
export code_for_check_type_funcs
export TODO, nbsp
export blockquote
export display_msg_if_fail

include("present.jl")
export present_button
export Foldable
export Columns, TwoColumn, ThreeColumn
export TwoColumnWideLeft, TwoColumnWideRight
export ChooseDisplayMode # combines present_button and WidthOverDocs

include("latex.jl")
export latexify_md, wrap_tex

include("aside.jl")
export aside, set_aside_width

include("robustlocalresource.jl")
export RobustLocalResource

include("other.jl")
export WidthOverDocs
export confetti

include("footnotes.jl")
export FootnotesInlineNumbered
export FootnotesBottomNumbered
export FootnotesNumbered
export FootnotesInlineStyleSuperscript
export FootnotesInlineStyleSubscript
export FootnotesInlineStyleBaseline

end # module

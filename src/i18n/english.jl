module PTTEnglish

using Markdown: @md_str, Code
using ..PlutoTeachingTools: PlutoTeachingTools, AbstractLanguage

abstract type English <: AbstractLanguage end
struct EnglishUS <: English end

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::English) = "Hint"
PlutoTeachingTools.tip_str(lang::English) = "Tip"
PlutoTeachingTools.protip_invite_str(lang::English) = "Curious to learn more?"

PlutoTeachingTools.protip_boxlabel_str(lang::English) = "Pro Tip"
PlutoTeachingTools.answer_invite_str(lang::English) = "Want to see the answer?"

PlutoTeachingTools.answer_boxlabel_str(lang::English) = "Answer"
PlutoTeachingTools.almost_str(lang::English) = "Almost there!"
PlutoTeachingTools.warning_box_str(lang::English) = "Warning:"
PlutoTeachingTools.question_box_str(lang::English) = "Question:"
PlutoTeachingTools.danger_str(lang::English) = "Beware!"
PlutoTeachingTools.keyconcept_str(lang::English) = "🎯 Key concept"
PlutoTeachingTools.still_missing_str(lang::English) = "Missing Response"
function PlutoTeachingTools.still_missing_text_str(lang::English)
    md"Replace `missing` with your answer."
end
PlutoTeachingTools.still_nothing_str(lang::English) = "Here we go!"
function PlutoTeachingTools.still_nothing_text_str(lang::English)
    md"Replace `nothing` with your answer."
end
PlutoTeachingTools.wrong_type_str(lang::English) = "Type Error"
PlutoTeachingTools.wrong_type_text_str(lang::English) = md"Check the type of your response."
function PlutoTeachingTools.wrong_type_text_str(lang::English, var, type)
    md"The type of $var should be $type"
end

PlutoTeachingTools.func_not_defined_str(lang::English) = "Oopsie!"
function PlutoTeachingTools.func_not_defined_text_str(func_name, lang::English)
    fn = Code(string(func_name))
    md"Make sure that you define a function called **$(fn)**"
end
PlutoTeachingTools.var_not_defined_str(lang::English) = "Oopsie!"
function PlutoTeachingTools.var_not_defined_text_str(variable_name, lang::English)
    vn = Code(string(variable_name))
    md"Make sure that you define a variable called **$(vn)**"
end
PlutoTeachingTools.keep_working_str(lang::English) = "Keep working on it!"

PlutoTeachingTools.keep_working_text_str(lang::English) = md"The answer is not quite right."
function PlutoTeachingTools.keep_working_update_str(var, lang::English)
    md"Make sure to update the cell setting $var."
end
function PlutoTeachingTools.yays(lang::English)
    [
        md"Great!",
        md"Yay ❤",
        md"Great! 🎉",
        md"Well done!",
        md"Keep it up!",
        md"Good job!",
        md"Awesome!",
        md"You got the right answer!",
        md"Let's move on to the next part.",
    ]
end
PlutoTeachingTools.correct_str(lang::English) = "Got it!"
PlutoTeachingTools.todo_str(lang::English) = "TODO"

function PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang::English)
    md"The variable $sym is still set to missing."
end
function PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang::English)
    "The type of $sym is not correct.  It should be <: "
end

PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang::English) = "one of"

PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang::English) = "or"

function PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang::English)
    md"$sym has the correct type."
end

PlutoTeachingTools.check_type_isa_type_error_str(sym, lang::English) = "Type Error"

function PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang::English)
    md"The variable $sym is still set to missing."
end

function PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(
    sym, type, lang::English
)
    "The type of $sym should be $type."
end

function PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang::English)
    "The type of $sym should be one of "
end

PlutoTeachingTools.check_type_eq_type_error_str(lang::English) = "Type Error"

function PlutoTeachingTools.check_type_eq_correct_str(sym, lang::English)
    md"$sym has the correct type."
end

# other.jl
PlutoTeachingTools.full_width_mode_str(lang::English) = "Full Width Mode"

# present.jl
PlutoTeachingTools.present_str(lang::English) = "present"
PlutoTeachingTools.present_mode_str(lang::English) = "Present Mode"

end

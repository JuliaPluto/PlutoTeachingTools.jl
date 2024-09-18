module PTTEnglish

using Markdown: @md_str, Code
using ..PlutoTeachingTools: PlutoTeachingTools, AbstractLanguage

abstract type English <: AbstractLanguage end
struct EnglishUS <: English end

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang<:English} = "Hint"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang<:English} = "Tip"
function PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang<:English}
    return "Curious to learn more?"
end
PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang<:English} = "Pro Tip"
function PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:English}
    return "Want to see the answer?"
end
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang<:English} = "Answer"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang<:English} = "Almost there!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang<:English} = "Warning:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang<:English} = "Question:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang<:English} = "Beware!"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang<:English} = "🎯 Key concept"
PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang<:English} = "Missing Response"
function PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang<:English}
    md"Replace `missing` with your answer."
end
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang<:English} = "Here we go!"
function PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang<:English}
    md"Replace `nothing` with your answer."
end
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang<:English} = "Type Error"
function PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:English}
    md"Check the type of your response."
end
function PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang<:English}
    md"The type of $var should be $type"
end
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang<:English} = "Oopsie!"
function PlutoTeachingTools.func_not_defined_text_str(
    func_name, lang::Lang
) where {Lang<:English}
    fn = Code(string(func_name))
    md"Make sure that you define a function called **$(fn)**"
end
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang<:English} = "Oopsie!"
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::Lang
) where {Lang<:English}
    vn = Code(string(variable_name))
    md"Make sure that you define a variable called **$(vn)**"
end
function PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang<:English}
    return "Keep working on it!"
end
function PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang<:English}
    md"The answer is not quite right."
end
function PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang<:English}
    md"Make sure to update the cell setting $var."
end
function PlutoTeachingTools.yays(lang::Lang) where {Lang<:English}
    return [
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
PlutoTeachingTools.correct_str(lang::Lang) where {Lang<:English} = "Got it!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang<:English} = "TODO"

function PlutoTeachingTools.check_type_isa_missing_text_str(
    sym, lang::Lang
) where {Lang<:English}
    md"The variable $sym is still set to missing."
end
function PlutoTeachingTools.check_type_isa_wrong_type_text_str(
    sym, lang::Lang
) where {Lang<:English}
    return "The type of $sym is not correct.  It should be <: "
end
function PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(
    lang::Lang
) where {Lang<:English}
    return "one of"
end
function PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(
    lang::Lang
) where {Lang<:English}
    return "or"
end
function PlutoTeachingTools.check_type_isa_not_missing_text_str(
    sym, lang::Lang
) where {Lang<:English}
    md"$sym has the correct type."
end
function PlutoTeachingTools.check_type_isa_type_error_str(
    sym, lang::Lang
) where {Lang<:English}
    return "Type Error"
end

function PlutoTeachingTools.check_type_eq_missing_text_str(
    sym, lang::Lang
) where {Lang<:English}
    md"The variable $sym is still set to missing."
end
function PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(
    sym, type, lang::Lang
) where {Lang<:English}
    return "The type of $sym should be $type."
end
function PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(
    sym, lang::Lang
) where {Lang<:English}
    return "The type of $sym should be one of "
end
function PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang<:English}
    return "Type Error"
end
function PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang<:English}
    md"$sym has the correct type."
end

# other.jl
PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang<:English} = "Full Width Mode"

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang<:English} = "present"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang<:English} = "Present Mode"

end

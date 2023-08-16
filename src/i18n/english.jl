module PTTEnglish

using Markdown

using ..PlutoTeachingTools

abstract type English  <: AbstractLanguage end
struct EnglishUS <: English end

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang <: English} = "Hint"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang <: English} = "Tip"
PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang <: English} = "Curious to learn more?"
PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang <: English} = "Pro Tip"
PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang <: English} = "Want to see the answer?"
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang <: English} = "Answer"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang <: English} = "Almost there!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang <: English} = "Warning:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang <: English} = "Question:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang <: English} = "Beware!"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang <: English} = "🎯 Key concept"
PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang <: English} = "Missing Response"
PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang <: English} = md"Replace `missing` with your answer."
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang <: English} = "Here we go!"
PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang <: English} = md"Replace `nothing` with your answer."
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang <: English} = "Type Error"
PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang <: English} = md"Check the type of your response."
PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang <: English} = md"The type of $var should be $type"
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang <: English} = "Oopsie!"
PlutoTeachingTools.func_not_defined_text_str(func_name, lang::Lang) where {Lang <: English} = md"Make sure that you define a function called **$(Markdown.Code(string(func_name)))**"
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang <: English} = "Oopsie!"
PlutoTeachingTools.var_not_defined_text_str(variable_name, lang::Lang) where {Lang <: English} = md"Make sure that you define a variable called **$(Markdown.Code(string(variable_name)))**"
PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang <: English} = "Keep working on it!"
PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang <: English} = md"The answer is not quite right."
PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang <: English} = md"Make sure to update the cell setting $var."
PlutoTeachingTools.yays(lang::Lang) where {Lang <: English} = [md"Great!", md"Yay ❤", md"Great! 🎉", md"Well done!", md"Keep it up!", md"Good job!", md"Awesome!", md"You got the right answer!", md"Let's move on to the next part."]
PlutoTeachingTools.correct_str(lang::Lang) where {Lang <: English} = "Got it!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang <: English} = "TODO"

PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang::Lang) where {Lang <: English} = md"The variable $sym is still set to missing."
PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang::Lang) where {Lang <: English} = "The type of $sym is not correct.  It should be <: "
PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang::Lang) where {Lang <: English} = "one of"
PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang::Lang) where {Lang <: English} = "or"
PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang::Lang) where {Lang <: English} = md"$sym has the correct type."
PlutoTeachingTools.check_type_isa_type_error_str(sym, lang::Lang) where {Lang <: English} = "Type Error"

PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang::Lang) where {Lang <: English} = md"The variable $sym is still set to missing."
PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(sym, type, lang::Lang) where {Lang <: English} = "The type of $sym should be $type."
PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang::Lang) where {Lang <: English} = "The type of $sym should be one of "
PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang <: English} = "Type Error"
PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang <: English} = md"$sym has the correct type."

# other.jl
PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang <: English} = "Full Width Mode"

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang <: English} = "present"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang <: English} = "Present Mode"

end

export AbstractLanguage, set_language!
abstract type AbstractLanguage end

# computational_thinking.jl
hint_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
tip_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
protip_invite_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
protip_boxlabel_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
almost_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
warning_box_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
danger_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
still_missing_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
still_missing_text_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
still_nothing_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
still_nothing_text_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
wrong_type_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
wrong_type_text_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
wrong_type_text_str(lang::Lang, var, type) where {Lang <: AbstractLanguage} = @error "Please define a translation."
func_not_defined_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
func_not_defined_text_str(func_name, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
var_not_defined_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
var_not_defined_text_str(variable_name, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
keep_working_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
keep_working_text_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
keep_working_update_str(var, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
yays(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
correct_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."

check_type_isa_missing_text_str(sym, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_isa_wrong_type_text_str(sym, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_isa_wrong_type_one_of_text_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_isa_wrong_type_or_text_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_isa_not_missing_text_str(sym, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_isa_type_error_str(sym, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."

check_type_eq_missing_text_str(sym, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_eq_wrong_type_single_text_str(sym, type, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_eq_wrong_type_multi_text_str(sym, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_eq_type_error_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
check_type_eq_correct_str(sym, lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."

# other.jl
full_width_mode_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."

# present.jl
present_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."
present_mode_str(lang::Lang) where {Lang <: AbstractLanguage} = @error "Please define a translation."

include("english.jl")
include("german.jl")

const default_language = Ref{AbstractLanguage}(PTTEnglish.EnglishUS())
function set_language!(lang::AbstractLanguage)
    global default_language[] = lang
end

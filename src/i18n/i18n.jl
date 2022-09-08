export AbstractLanguage, set_language!
export preferred_text
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

# Language Options
include("english.jl")
import .PTTEnglish: EnglishUS
include("german.jl")
import .PTTGerman: GermanGermany, GermanGermanyFormal, GermanGermanyColloquial

const languages_registered = Ref{Dict{String,AbstractLanguage}}(
        Dict( "en" => PTTEnglish.EnglishUS(),
	"en_us" => PTTEnglish.EnglishUS(),
        "de" => PTTGerman.GermanGermany(),
        "de_colloq" => PTTGerman.GermanGermanyColloquial(),
        "de_de" => PTTGerman.GermanGermany(),
        "de_de_colloq" => PTTGerman.GermanGermanyColloquial() ))

const language_codes_registered = Ref{Dict{AbstractLanguage,Vector{String}}}(
        Dict( PTTEnglish.EnglishUS() => ["en","en_us"],
        PTTGerman.GermanGermany() => ["de","de_de"],
        PTTGerman.GermanGermanyColloquial() => ["de_colloq", "de_de_colloq"]
        ))

# Allow users to register additional languages
function register_language!(str::AbstractString, lang::Lang) where { Lang <: AbstractLanguage } 
   languages_registered[][str] = lang
   language_codes_registered[][lang] = [str]
end


function register_language!(strs::AVS, lang::Lang) where {AS<:AbstractString, AVS<:AbstractVector{AS}, Lang<:AbstractLanguage} 
   for str in strs
       languages_registered[][str] = lang
   end
   language_codes_registered[][lang] = strs
end

# Pick language from language code
# see https://www.science.co.il/language/Locale-codes.php
function get_language(str::AbstractString)
   str = replace(lowercase(str), '-'=>'_')
   m =  match(r"^(\w+)\.",str)
   key = isnothing(m) ? str : first(m)
   if !haskey(languages_registered[],key) 	   
      # @info "Sorry, PlutoTeachingTools doesn't include that language."
      nothing # PTTEnglish.EnglishUS()
   else
      languages_registered[][key]
   end
end

# Keeping around until new version is better tested
function get_language_old(str::AbstractString)
   if contains(str,r"^en")
      PTTEnglish.EnglishUS()
   elseif contains(str,r"^de")
      PTTGerman.GermanGermany()
   else # Sorry, we don't have your language yet.
      # @info "Sorry, PlutoTeachingTools doesn't include that language."
      PTTEnglish.EnglishUS()
   end
end

function get_language_from_env(; default::Lang = PTTEnglish.EnglishUS() ) where { Lang<:AbstractLanguage }
   lang = default
   if @isdefined(ENV) && haskey(ENV,"LANG")
      lang = get_language(ENV["LANG"])
   end
   if isnothing(lang)
      lang = default
   end
   return lang
end

# Keep track of language to use
#const default_language = Ref{AbstractLanguage}(PTTEnglish.EnglishUS())
const default_language = Ref{AbstractLanguage}(get_language_from_env())

function set_language!(lang::AbstractLanguage)
    global default_language[] = lang
end

"""
`preferred_text( named_tuple [; language]  )`
Takes named tuple of language codes and corresponding text.
Returns text in currently selected language.
If text for current language is not provided, then returns first value of named tuple.

Examples:
   `preferred_text( (en="Hello", de="Hallo") )`
"""
function preferred_text(nt::NamedTuple; warn::Bool = false, lang::Lang = default_language[]) where { Lang <: AbstractLanguage } 
   lang_codes_w_text = string.(keys(nt)) 
   mask = map(t->isa(lang,t), typeof.(get_language.(lang_codes_w_text)))
   if !any(mask)
      if warn 
         @warn "`preferred_text` was not provided with text for current language." 
      end
      return first(nt)
   else
      nt[findfirst(mask)]
   end
end



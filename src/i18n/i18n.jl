
abstract type AbstractLanguage end

# computational_thinking.jl
hint_str(lang::AbstractLanguage) = @error "Please define a translation."
tip_str(lang::AbstractLanguage) = @error "Please define a translation."
answer_invite_str(lang::AbstractLanguage) = @error "Please define a translation."
answer_boxlabel_str(lang::AbstractLanguage) = @error "Please define a translation."
protip_invite_str(lang::AbstractLanguage) = @error "Please define a translation."
protip_boxlabel_str(lang::AbstractLanguage) = @error "Please define a translation."
almost_str(lang::AbstractLanguage) = @error "Please define a translation."
warning_box_str(lang::AbstractLanguage) = @error "Please define a translation."
question_box_str(lang::AbstractLanguage) = @error "Please define a translation."
keyconcept_str(lang::AbstractLanguage) = @error "Please define a translation."
danger_str(lang::AbstractLanguage) = @error "Please define a translation."
still_missing_str(lang::AbstractLanguage) = @error "Please define a translation."
still_missing_text_str(lang::AbstractLanguage) = @error "Please define a translation."
still_nothing_str(lang::AbstractLanguage) = @error "Please define a translation."
still_nothing_text_str(lang::AbstractLanguage) = @error "Please define a translation."
wrong_type_str(lang::AbstractLanguage) = @error "Please define a translation."
wrong_type_text_str(lang::AbstractLanguage) = @error "Please define a translation."
function wrong_type_text_str(lang::AbstractLanguage, var, type)
    @error "Please define a translation."
end
func_not_defined_str(lang::AbstractLanguage) = @error "Please define a translation."
function func_not_defined_text_str(func_name, lang::AbstractLanguage)
    @error "Please define a translation."
end
var_not_defined_str(lang::AbstractLanguage) = @error "Please define a translation."
function var_not_defined_text_str(variable_name, lang::AbstractLanguage)
    @error "Please define a translation."
end
keep_working_str(lang::AbstractLanguage) = @error "Please define a translation."
keep_working_text_str(lang::AbstractLanguage) = @error "Please define a translation."
keep_working_update_str(var, lang::AbstractLanguage) = @error "Please define a translation."
yays(lang::AbstractLanguage) = @error "Please define a translation."
correct_str(lang::AbstractLanguage) = @error "Please define a translation."
todo_str(lang::AbstractLanguage) = @error "Please define a translation."

function check_type_isa_missing_text_str(sym, lang::AbstractLanguage)
    @error "Please define a translation."
end
function check_type_isa_wrong_type_text_str(sym, lang::AbstractLanguage)
    @error "Please define a translation."
end
function check_type_isa_wrong_type_one_of_text_str(lang::AbstractLanguage)
    @error "Please define a translation."
end
function check_type_isa_wrong_type_or_text_str(lang::AbstractLanguage)
    @error "Please define a translation."
end
function check_type_isa_not_missing_text_str(sym, lang::AbstractLanguage)
    @error "Please define a translation."
end
function check_type_isa_type_error_str(sym, lang::AbstractLanguage)
    @error "Please define a translation."
end

function check_type_eq_missing_text_str(sym, lang::AbstractLanguage)
    @error "Please define a translation."
end
function check_type_eq_wrong_type_single_text_str(sym, type, lang::AbstractLanguage)
    @error "Please define a translation."
end
function check_type_eq_wrong_type_multi_text_str(sym, lang::AbstractLanguage)
    @error "Please define a translation."
end
check_type_eq_type_error_str(lang::AbstractLanguage) = @error "Please define a translation."
function check_type_eq_correct_str(sym, lang::AbstractLanguage)
    @error "Please define a translation."
end

# other.jl
full_width_mode_str(lang::AbstractLanguage) = @error "Please define a translation."

# present.jl
present_str(lang::AbstractLanguage) = @error "Please define a translation."
present_mode_str(lang::AbstractLanguage) = @error "Please define a translation."

# Language Options
include("english.jl")
import .PTTEnglish: EnglishUS
include("french.jl")
import .PTTFrench: FrenchBelgium, FrenchBelgiumFormal, FrenchBelgiumColloquial
include("german.jl")
import .PTTGerman: GermanGermany, GermanGermanyFormal, GermanGermanyColloquial
include("russian.jl")
import .PTTRussian: RussianRU
include("spanish.jl")
import .PTTSpanish: SpanishES, SpanishFormal, SpanishColloquial
include("chinese.jl")
import .PTTChinese: ChineseZH

const languages_registered = Dict(
    "en" => EnglishUS(),
    "en_us" => EnglishUS(),
    "fr" => FrenchBelgium(),
    "fr_colloq" => FrenchBelgiumColloquial(),
    "fr_formal" => FrenchBelgiumFormal(),
    "fr_be" => FrenchBelgium(),
    "fr_be_colloq" => FrenchBelgiumColloquial(),
    "fr_be_formal" => FrenchBelgiumFormal(),
    "de" => GermanGermany(),
    "de_colloq" => GermanGermanyColloquial(),
    "de_formal" => GermanGermanyFormal(),
    "de_de" => GermanGermany(),
    "de_de_colloq" => GermanGermanyColloquial(),
    "de_de_formal" => GermanGermanyFormal(),
    "ru" => RussianRU(),
    "ru_ru" => RussianRU(),
    "es" => SpanishES(),
    "es_colloq" => SpanishColloquial(),
    "es_formal" => SpanishFormal(),
    "es_es" => SpanishES(),
    "es_es_colloq" => SpanishColloquial(),
    "zh" => ChineseZH(),
    "zh_cn" => ChineseZH(),
)

const language_codes_registered = Dict(
    EnglishUS() => ["en", "en_us"],
    FrenchBelgium() => ["fr"], 
    FrenchBelgiumColloquial() => ["fr_colloq"],
    FrenchBelgiumFormal() => ["fr_formal"], 
    FrenchBelgium() => ["fr_be"], 
    FrenchBelgiumColloquial() => ["fr_be_colloq"], 
    FrenchBelgiumFormal() => ["fr_be_formal"], 
    GermanGermany() => ["de", "de_de"],
    GermanGermanyColloquial() => ["de_colloq", "de_de_colloq"],
    GermanGermanyFormal() => ["de_formal", "de_de_formal"],
    RussianRU() => ["ru", "ru_ru"],
    SpanishES() => ["es", "es_es"],
    SpanishFormal() => ["es_formal"],
    SpanishColloquial() => ["es_colloq", "es_es_colloq"],
    ChineseZH() => ["zh", "zh_cn"],
)

const select_lang_dropdown = Select([
    "en" => "English",
    "fr" => "French/Belgium",
    "de" => "German/Deutsch",
    "es" => "Spanish/Español",
    "ru" => "Russian/Русский",
    "zh" => "Chinese/中文",
]);

# Allow users to register additional languages
function register_language!(str::AbstractString, lang::AbstractLanguage)
    languages_registered[str] = lang
    return language_codes_registered[lang] = [str]
end

function register_language!(strs::AbstractVector{<:AbstractString}, lang::AbstractLanguage)
    for str in strs
        languages_registered[str] = lang
    end
    return language_codes_registered[lang] = strs
end

# Pick language from language code
# see https://www.science.co.il/language/Locale-codes.php
function get_language(str::AbstractString)
    str = replace(lowercase(str), '-' => '_')
    m = match(r"^(\w+)\.", str)
    key = isnothing(m) ? str : first(m.captures)
    if !haskey(languages_registered, key)
        # @info "Sorry, PlutoTeachingTools doesn't include that language."
        nothing # EnglishUS()
    else
        languages_registered[key]
    end
end

function get_language_from_env(; default::AbstractLanguage=EnglishUS())
    lang = default
    if @isdefined(ENV) && haskey(ENV, "LANG")
        lang = get_language(ENV["LANG"])
    end
    if isnothing(lang)
        lang = default
    end
    return lang
end

# Keep track of language to use
#const default_language = Ref{AbstractLanguage}(EnglishUS())
const default_language = Ref{AbstractLanguage}(get_language_from_env())

function __init__()
    default_language[] = get_language_from_env()
end

function set_language!(lang::AbstractLanguage)
    return default_language[] = lang
end

"""
`preferred_text( named_tuple [; language]  )`
Takes named tuple of language codes and corresponding text.
Returns text in currently selected language.
If text for current language is not provided, then returns first value of named tuple.

Examples:
   `preferred_text( (en="Hello", de="Hallo") )`
"""
function preferred_text(
    nt::NamedTuple; warn::Bool=false, lang::AbstractLanguage=default_language[]
)
    lang_codes_w_text = string.(keys(nt))
    mask = map(t -> isa(lang, t), typeof.(get_language.(lang_codes_w_text)))
    if !any(mask)
        if warn
            @warn "`preferred_text` was not provided with text for current language."
        end
        return first(nt)
    else
        nt[findfirst(mask)]
    end
end

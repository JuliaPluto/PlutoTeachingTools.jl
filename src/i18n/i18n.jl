
abstract type AbstractLanguage end

# computational_thinking.jl
hint_str(lang::Lang) where {Lang<:AbstractLanguage} = @error "Please define a translation."
tip_str(lang::Lang) where {Lang<:AbstractLanguage} = @error "Please define a translation."
function answer_invite_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function answer_boxlabel_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function protip_invite_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function protip_boxlabel_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function almost_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function warning_box_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function question_box_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function keyconcept_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function danger_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function still_missing_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function still_missing_text_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function still_nothing_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function still_nothing_text_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function wrong_type_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function wrong_type_text_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function wrong_type_text_str(lang::Lang, var, type) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function func_not_defined_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function func_not_defined_text_str(func_name, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function var_not_defined_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function var_not_defined_text_str(variable_name, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function keep_working_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function keep_working_text_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function keep_working_update_str(var, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
yays(lang::Lang) where {Lang<:AbstractLanguage} = @error "Please define a translation."
function correct_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
todo_str(lang::Lang) where {Lang<:AbstractLanguage} = @error "Please define a translation."

function check_type_isa_missing_text_str(sym, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_isa_wrong_type_text_str(sym, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_isa_wrong_type_one_of_text_str(
    lang::Lang
) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_isa_wrong_type_or_text_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_isa_not_missing_text_str(sym, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_isa_type_error_str(sym, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end

function check_type_eq_missing_text_str(sym, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_eq_wrong_type_single_text_str(
    sym, type, lang::Lang
) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_eq_wrong_type_multi_text_str(
    sym, lang::Lang
) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_eq_type_error_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function check_type_eq_correct_str(sym, lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end

# other.jl
function full_width_mode_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end

# present.jl
function present_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end
function present_mode_str(lang::Lang) where {Lang<:AbstractLanguage}
    @error "Please define a translation."
end

# Language Options
include("english.jl")
import .PTTEnglish: EnglishUS
include("german.jl")
import .PTTGerman: GermanGermany, GermanGermanyFormal, GermanGermanyColloquial
include("russian.jl")
import .PTTRussian: RussianRU
include("spanish.jl")
import .PTTSpanish: SpanishES, SpanishFormal, SpanishColloquial
include("chinese.jl")
import .PTTChinese: ChineseZH

const languages_registered = Ref{Dict{String,AbstractLanguage}}(
    Dict(
        "en" => EnglishUS(),
        "en_us" => EnglishUS(),
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
        "es_es" => SpanishES(),
        "es_es_colloq" => SpanishColloquial(),
        "zh" => ChineseZH(),
        "zh_cn" => ChineseZH(),
    ),
)

const language_codes_registered = Ref{Dict{AbstractLanguage,Vector{String}}}(
    Dict(
        EnglishUS() => ["en", "en_us"],
        GermanGermany() => ["de", "de_de"],
        GermanGermanyColloquial() => ["de_colloq", "de_de_colloq"],
        GermanGermanyFormal() => ["de_formal", "de_de_formal"],
        RussianRU() => ["ru", "ru_ru"],
        SpanishES() => ["es", "es_es"],
        SpanishColloquial() => ["es_colloq", "es_es_colloq"],
        ChineseZH() => ["zh", "zh_cn"],
    ),
)

# Allow users to register additional languages
function register_language!(str::AbstractString, lang::Lang) where {Lang<:AbstractLanguage}
    languages_registered[][str] = lang
    return language_codes_registered[][lang] = [str]
end

function register_language!(
    strs::AVS, lang::Lang
) where {AS<:AbstractString,AVS<:AbstractVector{AS},Lang<:AbstractLanguage}
    for str in strs
        languages_registered[][str] = lang
    end
    return language_codes_registered[][lang] = strs
end

# Pick language from language code
# see https://www.science.co.il/language/Locale-codes.php
function get_language(str::AbstractString)
    str = replace(lowercase(str), '-' => '_')
    m = match(r"^(\w+)\.", str)
    key = isnothing(m) ? str : first(m.captures)
    if !haskey(languages_registered[], key)
        # @info "Sorry, PlutoTeachingTools doesn't include that language."
        nothing # EnglishUS()
    else
        languages_registered[][key]
    end
end

# Keeping around until new version is better tested
function get_language_old(str::AbstractString)
    if contains(str, r"^en")
        EnglishUS()
    elseif contains(str, r"^de")
        GermanGermany()
    elseif contains(str, r"^es")
        SpanishFormal()
    else # Sorry, we don't have your language yet.
        # @info "Sorry, PlutoTeachingTools doesn't include that language."
        EnglishUS()
    end
end

function get_language_from_env(; default::Lang=EnglishUS()) where {Lang<:AbstractLanguage}
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

function set_language!(lang::AbstractLanguage)
    return global default_language[] = lang
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
    nt::NamedTuple; warn::Bool=false, lang::Lang=default_language[]
) where {Lang<:AbstractLanguage}
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

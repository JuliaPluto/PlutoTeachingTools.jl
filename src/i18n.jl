export PTTTranslation, pushTranslation

abstract type PTTTranslation end

locales(translation::PTTTranslation)::Vector{String} = translation.locales
translate(translation::PTTTranslation, key::Union{String, Markdown.MD})::Union{String, Markdown.MD} = translation.translations[key]
Base.getindex(translation::PTTTranslation, key::Union{String, Markdown.MD}) = translate(translation, key)

translations = Dict{String, PTTTranslation}()
currLocale = "en_US"

function pushTranslation(localePrefix::String, translation::PTTTranslation)
  translations[localePrefix] = translation
end

function getTranslation()
  return getTranslation(currLocale)
end

function getTranslation(locale::String)
  localePrefix = split(locale, "_")[1]
  return translations[localePrefix]
end

function i18n(s::String)
  translation = getTranslation()
  return translation[s]
end

function i18n(s::Markdown.MD)
  translation = getTranslation()
  return translation[s]
end

macro __str(s::String)
  return i18n(s)
end

# For English we can just use the keys directly
struct PTTTranslationEnglish <: PTTTranslation end

locales(translation::PTTTranslationEnglish)::Vector{String} = ["en_US", "en_GB"]
translate(translation::PTTTranslationEnglish, key::Union{String, Markdown.MD})::Union{String, Markdown.MD} = key

pushTranslation("en", PTTTranslationEnglish())
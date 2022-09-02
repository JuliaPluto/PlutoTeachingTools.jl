export AbstractLanguage, set_language!
abstract type AbstractLanguage end

include("english.jl")

const default_language = Ref{AbstractLanguage}(EnglishUS())
function set_language!(lang::AbstractLanguage)
    global default_language[] = lang
end

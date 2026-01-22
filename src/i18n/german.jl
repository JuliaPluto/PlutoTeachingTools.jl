module PTTGerman

using Markdown: @md_str, Code
using ..PlutoTeachingTools: PlutoTeachingTools, AbstractLanguage

abstract type German <: AbstractLanguage end
struct GermanGermanyFormal <: German end
struct GermanGermanyColloquial <: German end
const GermanGermany = GermanGermanyFormal

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::German) = "Hinweis"
PlutoTeachingTools.tip_str(lang::German) = "Tipp"
PlutoTeachingTools.protip_invite_str(lang::German) = "Neugierig auf mehr?"
PlutoTeachingTools.protip_boxlabel_str(lang::German) = "Profi-Tipp"
PlutoTeachingTools.answer_invite_str(lang::German) = "Willst du die Antwort sehen?"
PlutoTeachingTools.answer_boxlabel_str(lang::German) = "Antwort"
PlutoTeachingTools.almost_str(lang::German) = "Fast am Ziel!"
PlutoTeachingTools.warning_box_str(lang::German) = "Warnung:"
PlutoTeachingTools.question_box_str(lang::German) = "Frage:"
PlutoTeachingTools.danger_str(lang::German) = "Achtung!"
PlutoTeachingTools.keyconcept_str(lang::German) = "🎯 Schlüsselkonzept"
PlutoTeachingTools.still_missing_str(lang::German) = "Fehlende Antwort"
function PlutoTeachingTools.still_missing_text_str(lang::GermanGermanyFormal)
    md"Ersetzen Sie `missing` mit Ihrer Antwort."
end
function PlutoTeachingTools.still_missing_text_str(lang::GermanGermanyColloquial)
    md"Ersetze `missing` mit deiner Antwort."
end
PlutoTeachingTools.still_nothing_str(lang::German) = "Fehlende Antwort"
function PlutoTeachingTools.still_nothing_text_str(lang::GermanGermanyFormal)
    md"Ersetzen Sie `nothing` mit Ihrer Antwort."
end
function PlutoTeachingTools.still_nothing_text_str(lang::GermanGermanyColloquial)
    md"Ersetze `nothing` mit deiner Antwort."
end
PlutoTeachingTools.wrong_type_str(lang::German) = "Typfehler"
function PlutoTeachingTools.wrong_type_text_str(lang::GermanGermanyFormal)
    md"Kontrollieren Sie den Typ Ihrer Antwort."
end
function PlutoTeachingTools.wrong_type_text_str(lang::GermanGermanyColloquial)
    md"Kontrolliere den Typ deiner Antwort."
end
function PlutoTeachingTools.wrong_type_text_str(lang::German, var, type)
    md"Der Typ von $var sollte $type sein."
end
PlutoTeachingTools.func_not_defined_str(lang::German) = "Uups!"
function PlutoTeachingTools.func_not_defined_text_str(func_name, lang::GermanGermanyFormal)
    fn = Code(string(func_name))
    md"Stellen Sie sicher, eine Funktion mit dem Namen **$(fn)** zu definieren."
end
function PlutoTeachingTools.func_not_defined_text_str(
    func_name, lang::GermanGermanyColloquial
)
    fn = Code(string(func_name))
    md"Stelle sicher, eine Funktion mit dem Namen **$(fn)** zu definieren."
end
PlutoTeachingTools.var_not_defined_str(lang::German) = "Uups!"
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::GermanGermanyFormal
)
    vn = Code(string(variable_name))
    md"Stellen Sie sicher, eine Variable mit dem Namen **$(vn)** zu definieren."
end
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::GermanGermanyColloquial
)
    vn = Code(string(variable_name))
    md"Stelle sicher, eine Variable mit dem Namen **$(vn)** zu definieren."
end
function PlutoTeachingTools.keep_working_str(lang::GermanGermanyFormal)
    return "Versuchen Sie es weiter!"
end
function PlutoTeachingTools.keep_working_str(lang::GermanGermanyColloquial)
    return "Versuch es weiter!"
end
function PlutoTeachingTools.keep_working_text_str(lang::German)
    md"Die Antwort ist noch nicht ganz richtig."
end
function PlutoTeachingTools.keep_working_update_str(var, lang::GermanGermanyFormal)
    md"Stellen Sie sicher, dass die Zelle mit der Variable $var erneut evaluiert wird."
end
function PlutoTeachingTools.keep_working_update_str(var, lang::GermanGermanyColloquial)
    md"Stelle sicher, dass die Zelle mit der Variable $var erneut evaluiert wird."
end
function PlutoTeachingTools.yays(lang::GermanGermanyFormal)
    return [
        md"Großartig!",
        md"Juchu ❤",
        md"Großartig! 🎉",
        md"Gut gemacht!",
        md"Weiter so!",
        md"Gute Arbeit!",
        md"Super!",
        md"Ihre Antwort ist richtig!",
        md"Weiter geht's mit der nächsten Antwort.",
    ]
end
function PlutoTeachingTools.yays(lang::GermanGermanyColloquial)
    return [
        md"Großartig!",
        md"Juchu ❤",
        md"Großartig! 🎉",
        md"Gut gemacht!",
        md"Weiter so!",
        md"Gute Arbeit!",
        md"Super!",
        md"Deine Antwort ist richtig!",
        md"Weiter geht's mit der nächsten Antwort.",
    ]
end
PlutoTeachingTools.correct_str(lang::German) = "Richtig!"
PlutoTeachingTools.todo_str(lang::German) = "TO-DO"

function PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang::German)
    md"Die Variable $sym ist immer noch `missing`."
end
function PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang::German)
    "Der Typ von $sym ist nicht richtig. Richtig wäre <: "
end
PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang::German) = "einer von"
PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang::German) = "oder"
function PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang::German)
    md"$sym hat den korrekten Typ."
end
PlutoTeachingTools.check_type_isa_type_error_str(sym, lang::German) = "Typfehler"
function PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang::German)
    md"Die Variable $sym ist immer noch `missing`."
end
function PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(
    sym, type, lang::German
)
    "Der Typ von $sym sollte $type sein."
end
function PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang::German)
    "Der Typ von $sym sollte einer der folgenden sein: "
end
PlutoTeachingTools.check_type_eq_type_error_str(lang::German) = "Typfehler"
function PlutoTeachingTools.check_type_eq_correct_str(sym, lang::German)
    md"$sym hat den korrekten Typ."
end

# other.jl
function PlutoTeachingTools.full_width_mode_str(lang::German)
    return "Modus \"Volle Breite\""
end

# present.jl
PlutoTeachingTools.present_str(lang::German) = "präsentieren"
PlutoTeachingTools.present_mode_str(lang::German) = "Präsentationsmodus"

end

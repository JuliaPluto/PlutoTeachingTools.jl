module PTTGerman

using Markdown

using ..PlutoTeachingTools

abstract type German  <: AbstractLanguage end
struct GermanGermanyFormal <: German end
struct GermanGermanyColloquial <: German end
GermanGermany = GermanGermanyFormal

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang <: German} = "Hinweis"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang <: German} = "Tipp"
PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang <: German} = "Neugierig auf mehr?"
PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang <: German} = "Profi-Tipp"
PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang <: German} = "Willst du die Antwort sehen?"
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang <: German} = "Antwort"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang <: German} = "Fast am Ziel!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang <: German} = "Warnung:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang <: German} = "Frage:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang <: German} = "Achtung!"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang <: German} = "🎯 Schlüsselkonzept"
PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang <: German} = "Fehlende Antwort"
PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang <: GermanGermanyFormal} = md"Ersetzen Sie `missing` mit Ihrer Antwort."
PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang <: GermanGermanyColloquial} = md"Ersetze `missing` mit deiner Antwort."
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang <: German} = "Fehlende Antwort"
PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang <: GermanGermanyFormal} = md"Ersetzen Sie `nothing` mit Ihrer Antwort."
PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang <: GermanGermanyColloquial} = md"Ersetze `nothing` mit deiner Antwort."
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang <: German} = "Typfehler"
PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang <: GermanGermanyFormal} = md"Kontrollieren Sie den Typ Ihrer Antwort."
PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang <: GermanGermanyColloquial} = md"Kontrolliere den Typ deiner Antwort."
PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang <: German} = md"Der Typ von $var sollte $type sein."
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang <: German} = "Uups!"
PlutoTeachingTools.func_not_defined_text_str(func_name, lang::Lang) where {Lang <: GermanGermanyFormal} = md"Stellen Sie sicher, eine Funktion mit dem Namen **$(Markdown.Code(string(func_name)))** zu definieren."
PlutoTeachingTools.func_not_defined_text_str(func_name, lang::Lang) where {Lang <: GermanGermanyColloquial} = md"Stelle sicher, eine Funktion mit dem Namen **$(Markdown.Code(string(func_name)))** zu definieren."
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang <: German} = "Uups!"
PlutoTeachingTools.var_not_defined_text_str(variable_name, lang::Lang) where {Lang <: GermanGermanyFormal} = md"Stellen Sie sicher, eine Variable mit dem Namen **$(Markdown.Code(string(variable_name)))** zu definieren."
PlutoTeachingTools.var_not_defined_text_str(variable_name, lang::Lang) where {Lang <: GermanGermanyColloquial} = md"Stelle sicher, eine Variable mit dem Namen **$(Markdown.Code(string(variable_name)))** zu definieren."
PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang <: GermanGermanyFormal} = "Versuchen Sie es weiter!"
PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang <: GermanGermanyColloquial} = "Versuch es weiter!"
PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang <: German} = md"Die Antwort ist noch nicht ganz richtig."
PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang <: GermanGermanyFormal} = md"Stellen Sie sicher, dass die Zelle mit der Variable $var erneut evaluiert wird."
PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang <: GermanGermanyColloquial} = md"Stelle sicher, dass die Zelle mit der Variable $var erneut evaluiert wird."
PlutoTeachingTools.yays(lang::Lang) where {Lang <: GermanGermanyFormal} = [md"Großartig!", md"Juchu ❤", md"Großartig! 🎉", md"Gut gemacht!", md"Weiter so!", md"Gute Arbeit!", md"Super!", md"Ihre Antwort ist richtig!", md"Weiter geht's mit der nächsten Antwort."]
PlutoTeachingTools.yays(lang::Lang) where {Lang <: GermanGermanyColloquial} = [md"Großartig!", md"Juchu ❤", md"Großartig! 🎉", md"Gut gemacht!", md"Weiter so!", md"Gute Arbeit!", md"Super!", md"Deine Antwort ist richtig!", md"Weiter geht's mit der nächsten Antwort."]
PlutoTeachingTools.correct_str(lang::Lang) where {Lang <: German} = "Richtig!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang <: German} = "TO-DO"

PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang::Lang) where {Lang <: German} = md"Die Variable $sym ist immer noch `missing`."
PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang::Lang) where {Lang <: German} = "Der Typ von $sym ist nicht richtig. Richtig wäre <: "
PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang::Lang) where {Lang <: German} = "einer von"
PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang::Lang) where {Lang <: German} = "oder"
PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang::Lang) where {Lang <: German} = md"$sym hat den korrekten Typ."
PlutoTeachingTools.check_type_isa_type_error_str(sym, lang::Lang) where {Lang <: German} = "Typfehler"

PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang::Lang) where {Lang <: German} = md"Die Variable $sym ist immer noch `missing`."
PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(sym, type, lang::Lang) where {Lang <: German} = "Der Typ von $sym sollte $type sein."
PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang::Lang) where {Lang <: German} = "Der Typ von $sym sollte einer der folgenden sein: "
PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang <: German} = "Typfehler"
PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang <: German} = md"$sym hat den korrekten Typ."

# other.jl
PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang <: German} = "Modus \"Volle Breite\""

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang <: German} = "präsentieren"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang <: German} = "Präsentationsmodus"

end

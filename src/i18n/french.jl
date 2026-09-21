module PTTFrench

using Markdown: @md_str, Code
using ..PlutoTeachingTools: PlutoTeachingTools, AbstractLanguage

abstract type French <: AbstractLanguage end
abstract type FrenchFormal <: French end
abstract type FrenchColloquial <: French end
struct FrenchBelgiumFormal <: FrenchFormal end
struct FrenchBelgiumColloquial <: FrenchColloquial end
FrenchBelgium = FrenchBelgiumColloquial

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang<:French} = "Indice"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang<:French} = "Astuce"
function PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang<:French}
    return "Envie d'en savoir plus?"
end
PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang<:French} = "Astuce Avancée"
function PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:FrenchFormal}
    return "Voulez-vous voir la réponse?"
end
function PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:FrenchColloquial}
    return "Veux-tu voir la réponse?"
end
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang<:French} = "Réponse"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang<:French} = "Presque!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang<:French} = "Attention:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang<:French} = "Question:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang<:FrenchFormal} = "Méfiez-vous!"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang<:FrenchColloquial} = "Méfie-toi!"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang<:French} = "🎯 Concept clé"
PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang<:French} = "Réponse Manquante"
function PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang<:FrenchFormal}
    md"Remplacez `missing` par votre réponse."
end
function PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang<:FrenchColloquial}
    md"Remplace `missing` par ta réponse."
end
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang<:French} = "C'est parti!"
function PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang<:FrenchFormal}
    md"Remplacez `nothing` par votre réponse."
end
function PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang<:FrenchColloquial}
    md"Remplace `nothing` par ta réponse."
end
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang<:French} = "Erreur de Type"
function PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:FrenchFormal}
    md"Vérifiez le type de votre réponse."
end
function PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:FrenchColloquial}
    md"Vérifie le type de ta réponse."
end
function PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang<:French}
    md"Le type de $var devrait être $type"
end
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang<:French} = "Oups!"
function PlutoTeachingTools.func_not_defined_text_str(
    func_name, lang::Lang
) where {Lang<:FrenchFormal}
    fn = Code(string(func_name))
    md"Vérifiez que vous définissez une fonction appelée **$(fn)**"
end
function PlutoTeachingTools.func_not_defined_text_str(
    func_name, lang::Lang
) where {Lang<:FrenchColloquial}
    fn = Code(string(func_name))
    md"Vérifie que tu définis une fonction appelée **$(fn)**"
end
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang<:French} = "Oups!"
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::Lang
) where {Lang<:FrenchFormal}
    vn = Code(string(variable_name))
    md"Vérifiez que vous définissez une variable appelée **$(vn)**"
end
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::Lang
) where {Lang<:FrenchColloquial}
    vn = Code(string(variable_name))
    md"Vérifie que tu définis une variable appelée **$(vn)**"
end
function PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang<:French}
    return "Encore un effort!"
end
function PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang<:French}
    md"La réponse n'est pas tout à fait juste."
end
function PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang<:FrenchFormal}
    md"Vérifiez de mettre à jour la cellule en assignant une valeur à $var."
end
function PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang<:FrenchColloquial}
    md"Vérifie de mettre à jour la cellule en assignant une valeur à $var."
end
function PlutoTeachingTools.yays(lang::Lang) where {Lang<:French}
    return [
        md"Génial!",
        md"Parfait ❤",
        md"Génial! 🎉",
        md"Bien joué!",
        md"Continue comme ça!",
        md"Bon travail!",
        md"Impressionnant!",
        md"C'est la bonne réponse!",
        md"Passons à la partie suivante.",
    ]
end
PlutoTeachingTools.correct_str(lang::Lang) where {Lang<:French} = "Bien joué!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang<:French} = "À FAIRE"

function PlutoTeachingTools.check_type_isa_missing_text_str(
    sym, lang::Lang
) where {Lang<:French}
    md"La variable $sym est encore assignée à missing."
end
function PlutoTeachingTools.check_type_isa_wrong_type_text_str(
    sym, lang::Lang
) where {Lang<:French}
    return "Le type de $sym n'est pas correct.  Il devrait être <: "
end
function PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(
    lang::Lang
) where {Lang<:French}
    return "un de"
end
function PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(
    lang::Lang
) where {Lang<:French}
    return "ou"
end
function PlutoTeachingTools.check_type_isa_not_missing_text_str(
    sym, lang::Lang
) where {Lang<:French}
    md"$sym a le type correct."
end
function PlutoTeachingTools.check_type_isa_type_error_str(
    sym, lang::Lang
) where {Lang<:French}
    return "Erreur de Type"
end

function PlutoTeachingTools.check_type_eq_missing_text_str(
    sym, lang::Lang
) where {Lang<:French}
    md"La variable $sym est encore assignée à missing."
end
function PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(
    sym, type, lang::Lang
) where {Lang<:French}
    return "Le type de $sym devrait être $type."
end
function PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(
    sym, lang::Lang
) where {Lang<:French}
    return "Le type de $sym devrait faire partie de "
end
function PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang<:French}
    return "Erreur de Type"
end
function PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang<:French}
    md"$sym a le type correct."
end

# other.jl
PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang<:French} = "Mode Pleine Largeur"
PlutoTeachingTools.expected_failure_str(lang::Lang) where {Lang<:French} = "Échec attendu"
PlutoTeachingTools.expected_failure_text_str(lang::Lang) where {Lang<:French} = "Le code était censé échouer, mais il a été évalué avec succès."
PlutoTeachingTools.expected_error_message_str(lang::Lang) where {Lang<:French} = "Message d'erreur attendu"

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang<:French} = "présentation"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang<:French} = "Mode Présentation"

end

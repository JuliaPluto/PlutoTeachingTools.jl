module PTTRussian

using Markdown: @md_str, Code
using ..PlutoTeachingTools: PlutoTeachingTools, AbstractLanguage

abstract type Russian <: AbstractLanguage end
struct RussianRU <: Russian end

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang<:Russian} = "Подсказка"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang<:Russian} = "Совет"
function PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang<:Russian}
    return "Хотите узнать больше?"
end
function PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang<:Russian}
    return "Совет профессионала"
end
function PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:Russian}
    return "Хотите посмотреть ответ?"
end
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang<:Russian} = "Ответ"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang<:Russian} = "Почти правильно!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang<:Russian} = "Внимание:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang<:Russian} = "Вопрос:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang<:Russian} = "Осторожно!"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang<:Russian} = "🎯 Ключевое понятие"
function PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang<:Russian}
    return "Отсутствующий ответ"
end
function PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang<:Russian}
    md"Замените `missing` на ваш ответ."
end
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang<:Russian} = "Начинаем!"
function PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang<:Russian}
    md"Замените `nothing` на ваш ответ."
end
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang<:Russian} = "Ошибка типа"
function PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:Russian}
    md"Проверьте тип вашего ответа."
end
function PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang<:Russian}
    md"Тип $var должен быть $type"
end
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang<:Russian} = "Ой!"
function PlutoTeachingTools.func_not_defined_text_str(
    func_name, lang::Lang
) where {Lang<:Russian}
    fn = Code(string(func_name))
    md"Убедитесь, что вы определили функцию под названием **$(fn)**"
end
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang<:Russian} = "Ой!"
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::Lang
) where {Lang<:Russian}
    vn = Code(string(variable_name))
    md"Убедитесь, что вы определили переменную под названием **$(vn)**"
end
function PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang<:Russian}
    return "Продолжайте работу!"
end
function PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang<:Russian}
    md"Ответ не вполне правильный."
end
function PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang<:Russian}
    md"Обязательно обновите параметр ячейки $var."
end
function PlutoTeachingTools.yays(lang::Lang) where {Lang<:Russian}
    return [
        md"Отлично!",
        md"Ура ❤",
        md"Здорово! 🎉",
        md"Молодец!",
        md"Продолжайте в том же духе!",
        md"Хорошая работа!",
        md"Здорово!",
        md"Получен правильный ответ!",
        md"Переходим к следующему разделу",
    ]
end
PlutoTeachingTools.correct_str(lang::Lang) where {Lang<:Russian} = "Получилось!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang<:Russian} = "НУЖНО СДЕЛАТЬ"

function PlutoTeachingTools.check_type_isa_missing_text_str(
    sym, lang::Lang
) where {Lang<:Russian}
    md"Переменная $sym по-прежнему имеет значение `missing`."
end
function PlutoTeachingTools.check_type_isa_wrong_type_text_str(
    sym, lang::Lang
) where {Lang<:Russian}
    return "Тип $sym задан неверно.  Он должен быть <: "
end
function PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(
    lang::Lang
) where {Lang<:Russian}
    return "один из"
end
function PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(
    lang::Lang
) where {Lang<:Russian}
    return "или"
end
function PlutoTeachingTools.check_type_isa_not_missing_text_str(
    sym, lang::Lang
) where {Lang<:Russian}
    md"тип переменной $sym правильный."
end
function PlutoTeachingTools.check_type_isa_type_error_str(
    sym, lang::Lang
) where {Lang<:Russian}
    return "Ошибка типа"
end

function PlutoTeachingTools.check_type_eq_missing_text_str(
    sym, lang::Lang
) where {Lang<:Russian}
    md"Переменная $sym по-прежнему имеет значение `missing`."
end
function PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(
    sym, type, lang::Lang
) where {Lang<:Russian}
    return "Тип переменной $sym должен быть $type."
end
function PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(
    sym, lang::Lang
) where {Lang<:Russian}
    return "Тип переменной $sym должен быть один из "
end
function PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang<:Russian}
    return "Ошибка типа"
end
function PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang<:Russian}
    md"тип переменной $sym правилен."
end

# other.jl
function PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang<:Russian}
    return "Режим полной ширины"
end

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang<:Russian} = "презентация"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang<:Russian} = "Режим презентации"

end

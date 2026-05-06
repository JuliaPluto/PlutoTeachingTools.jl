module PTTRussian

using Markdown: @md_str, Code
using ..PlutoTeachingTools: PlutoTeachingTools, AbstractLanguage

abstract type Russian <: AbstractLanguage end
struct RussianRU <: Russian end

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Russian) = "Подсказка"
PlutoTeachingTools.tip_str(lang::Russian) = "Совет"
function PlutoTeachingTools.protip_invite_str(lang::Russian)
    return "Хотите узнать больше?"
end
function PlutoTeachingTools.protip_boxlabel_str(lang::Russian)
    return "Совет профессионала"
end
function PlutoTeachingTools.answer_invite_str(lang::Russian)
    return "Хотите посмотреть ответ?"
end
PlutoTeachingTools.answer_boxlabel_str(lang::Russian) = "Ответ"
PlutoTeachingTools.almost_str(lang::Russian) = "Почти правильно!"
PlutoTeachingTools.warning_box_str(lang::Russian) = "Внимание:"
PlutoTeachingTools.question_box_str(lang::Russian) = "Вопрос:"
PlutoTeachingTools.danger_str(lang::Russian) = "Осторожно!"
PlutoTeachingTools.keyconcept_str(lang::Russian) = "🎯 Ключевое понятие"
function PlutoTeachingTools.still_missing_str(lang::Russian)
    return "Отсутствующий ответ"
end
function PlutoTeachingTools.still_missing_text_str(lang::Russian)
    md"Замените `missing` на ваш ответ."
end
PlutoTeachingTools.still_nothing_str(lang::Russian) = "Начинаем!"
function PlutoTeachingTools.still_nothing_text_str(lang::Russian)
    md"Замените `nothing` на ваш ответ."
end
PlutoTeachingTools.wrong_type_str(lang::Russian) = "Ошибка типа"
function PlutoTeachingTools.wrong_type_text_str(lang::Russian)
    md"Проверьте тип вашего ответа."
end
function PlutoTeachingTools.wrong_type_text_str(lang::Russian, var, type)
    md"Тип $var должен быть $type"
end
PlutoTeachingTools.func_not_defined_str(lang::Russian) = "Ой!"
function PlutoTeachingTools.func_not_defined_text_str(func_name, lang::Russian)
    fn = Code(string(func_name))
    md"Убедитесь, что вы определили функцию под названием **$(fn)**"
end
PlutoTeachingTools.var_not_defined_str(lang::Russian) = "Ой!"
function PlutoTeachingTools.var_not_defined_text_str(variable_name, lang::Russian)
    vn = Code(string(variable_name))
    md"Убедитесь, что вы определили переменную под названием **$(vn)**"
end
function PlutoTeachingTools.keep_working_str(lang::Russian)
    return "Продолжайте работу!"
end
function PlutoTeachingTools.keep_working_text_str(lang::Russian)
    md"Ответ не вполне правильный."
end
function PlutoTeachingTools.keep_working_update_str(var, lang::Russian)
    md"Обязательно обновите параметр ячейки $var."
end
function PlutoTeachingTools.yays(lang::Russian)
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
PlutoTeachingTools.correct_str(lang::Russian) = "Получилось!"
PlutoTeachingTools.todo_str(lang::Russian) = "НУЖНО СДЕЛАТЬ"

function PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang::Russian)
    md"Переменная $sym по-прежнему имеет значение `missing`."
end
function PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang::Russian)
    return "Тип $sym задан неверно.  Он должен быть <: "
end
function PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang::Russian)
    return "один из"
end
function PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang::Russian)
    return "или"
end
function PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang::Russian)
    md"тип переменной $sym правильный."
end
function PlutoTeachingTools.check_type_isa_type_error_str(sym, lang::Russian)
    return "Ошибка типа"
end

function PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang::Russian)
    md"Переменная $sym по-прежнему имеет значение `missing`."
end
function PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(
    sym, type, lang::Russian
)
    return "Тип переменной $sym должен быть $type."
end
function PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang::Russian)
    return "Тип переменной $sym должен быть один из "
end
function PlutoTeachingTools.check_type_eq_type_error_str(lang::Russian)
    return "Ошибка типа"
end
function PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Russian)
    md"тип переменной $sym правилен."
end

# other.jl
function PlutoTeachingTools.full_width_mode_str(lang::Russian)
    return "Режим полной ширины"
end
PlutoTeachingTools.expected_failure_str(lang::Russian) = "Ожидаемая ошибка"
PlutoTeachingTools.expected_failure_text_str(lang::Russian) = "Ожидалось, что код завершится с ошибкой, но он выполнился успешно."
PlutoTeachingTools.expected_error_message_str(lang::Russian) = "Ожидаемое сообщение об ошибке"

# present.jl
PlutoTeachingTools.present_str(lang::Russian) = "презентация"
PlutoTeachingTools.present_mode_str(lang::Russian) = "Режим презентации"

end

Форма `Create` предназначена для валидации 2 аттрибутов и создания нового экземпляра класса `SomeModel`.

Базовая модель формы `Base`, задает шаблон поведения для всех форм, которые будут от нее наследоваться. А имеено:
- Добавляет поведение `Virtus` форм.
- Обязует каждый класс-наследник отвечать на сообщение `record`.
- Каждый экземпляр формы должен иметь приватный метод `persist!`, результатом выполнения которого является сохранение целевой сущности.
- Интерфейс сохранения у каждой формы предопределен следующим образом. После получения сообщения `save` выполняется валидация переданных аттрибутов (поведение получено из `Virtus`). Если проверка не проходит, возвращается `false`. После сохранения формы (если не возникло ошибки), вернется `true`.

Выгода такого подхода заключается в том, что все формы будут иметь аналогичный интерфейс, а логика целевой операции с сущностью (сохранение, обновление, удаление... ) не будет дублироваться в каждой форме.

Недостаток - наследование.

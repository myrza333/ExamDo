insert into questions (topic, question, answer, wrong_answers) values
('HTML/CSS', 'Какой тег используется для самого важного заголовка на странице?', '<h1>', array['<head>', '<header>', '<title>']),
('HTML/CSS', 'Какое CSS-свойство меняет цвет текста?', 'color', array['background-color', 'font-color', 'text-color']),
('HTML/CSS', 'Что делает свойство display: flex?', 'Делает элемент flex-контейнером для дочерних элементов', array['Растягивает элемент на всю ширину родителя и переносит соседей на новую строку', 'Делает элемент строчным, чтобы он стоял в одной строке с текстом', 'Включает сетку из строк и колонок для дочерних элементов']),
('HTML/CSS', 'Какой селектор выберет элемент с атрибутом id="main"?', '#main', array['.main', 'main', '*main']),
('HTML/CSS', 'Из каких частей состоит блочная модель (box model) в CSS?', 'content, padding, border, margin', array['content, padding, outline, gap', 'content, spacing, border, offset', 'width, padding, border, position']),
('HTML/CSS', 'Какой атрибут тега <img> задаёт альтернативный текст, если картинка не загрузилась?', 'alt', array['title', 'src', 'label']),
('HTML/CSS', 'Относительно чего позиционируется элемент с position: absolute?', 'Относительно ближайшего предка с position не static', array['Всегда относительно окна браузера', 'Относительно своего места в потоке', 'Относительно ближайшего предка с display: flex']),
('HTML/CSS', 'Какая единица измерения зависит от размера шрифта корневого элемента <html>?', 'rem', array['em', 'vw', 'vh']),
('DOM', 'Какой метод возвращает первый элемент, подходящий под CSS-селектор?', 'document.querySelector()', array['document.querySelectorAll()', 'document.getElementsByClassName()', 'document.getElementById()']),
('DOM', 'Как правильно повесить обработчик клика на элемент?', 'element.addEventListener("click", handler)', array['element.addEventListener(handler, "click")', 'element.attachListener("click", handler)', 'element.on("click", handler)']),
('DOM', 'Что такое DOM?', 'Дерево объектов, которым браузер представляет HTML-страницу', array['Встроенное в браузер хранилище для данных и настроек страницы', 'Стандарт, который описывает, как браузер применяет CSS к HTML-тегам', 'Модуль JavaScript для отправки запросов на сервер']);

insert into questions (topic, question, answer, wrong_answers) values
('HTML/CSS', 'Какой тег используется для самого важного заголовка на странице?', '<h1>', array['<head>', '<header>', '<title>']),
('HTML/CSS', 'Какое CSS-свойство меняет цвет текста?', 'color', array['background-color', 'font-color', 'text-color']),
('HTML/CSS', 'Что делает свойство display: flex?', 'Делает элемент flex-контейнером, и его дочерние элементы выстраиваются по главной оси', array['Скрывает элемент со страницы', 'Делает элемент строчным, как <span>', 'Позиционирует элемент относительно окна браузера']),
('HTML/CSS', 'Какой селектор выберет элемент с атрибутом id="main"?', '#main', array['.main', 'main', '*main']),
('HTML/CSS', 'Из каких частей состоит блочная модель (box model) в CSS?', 'content, padding, border, margin', array['content, flex, grid, margin', 'width, height, color, font', 'header, main, footer, aside']),
('HTML/CSS', 'Какой атрибут тега <img> задаёт альтернативный текст, если картинка не загрузилась?', 'alt', array['title', 'src', 'href']),
('HTML/CSS', 'Относительно чего позиционируется элемент с position: absolute?', 'Относительно ближайшего предка с position, отличным от static', array['Всегда относительно окна браузера', 'Относительно своего обычного места в потоке', 'Относительно соседнего элемента']),
('HTML/CSS', 'Какая единица измерения зависит от размера шрифта корневого элемента <html>?', 'rem', array['em', 'px', 'vh']),
('DOM', 'Какой метод возвращает первый элемент, подходящий под CSS-селектор?', 'document.querySelector()', array['document.querySelectorAll()', 'document.getElementsByClassName()', 'document.getElementsByTagName()']),
('DOM', 'Как правильно повесить обработчик клика на элемент?', 'element.addEventListener("click", handler)', array['element.click(handler)', 'element.on("click", handler)', 'element.listen("click", handler)']),
('DOM', 'Что такое DOM?', 'Объектная модель документа: дерево объектов, которым браузер представляет HTML-страницу', array['База данных, встроенная в браузер', 'Язык для описания стилей страницы', 'Сервер, который отдаёт HTML-страницы']);

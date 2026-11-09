insert into tasks (level, topic, title, description, fn, params, tests, forbidden, required, solution, explanation) values
('hard', 'map', 'Полные имена', 'Напиши функцию fullNames, которая с помощью map превращает массив { first, last } в массив строк "first last".', 'fullNames', 'users',
'[{"input":[[{"first":"Иван","last":"Петров"},{"first":"Anna","last":"Lee"}]],"output":["Иван Петров","Anna Lee"]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function fullNames(users) {
  return users.map((user) => `${user.first} ${user.last}`);
}$$,
array['map перебирает пользователей.', 'Для каждого собираем строку через шаблонную строку с ${}.', 'Возвращаем массив строк.']),

('hard', 'map', 'Скидка на товары', 'Напиши функцию applyDiscount, которая с помощью map возвращает новые объекты { name, price } с ценой, уменьшенной на percent процентов. Исходные объекты не меняй.', 'applyDiscount', 'products, percent',
'[{"input":[[{"name":"Чай","price":200},{"name":"Сок","price":50}],10],"output":[{"name":"Чай","price":180},{"name":"Сок","price":45}]},{"input":[[],50],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function applyDiscount(products, percent) {
  return products.map((p) => ({
    ...p,
    price: p.price - (p.price * percent) / 100,
  }));
}$$,
array['Скидка — это price * percent / 100.', 'Внутри map создаём новый объект через spread ...p и перезаписываем price.', 'Объект в стрелочной функции оборачиваем в круглые скобки, иначе фигурные скобки примутся за тело функции.']),

('hard', 'map', 'Удвоить матрицу', 'Напиши функцию doubleMatrix, которая с помощью map удваивает каждое число в двумерном массиве.', 'doubleMatrix', 'matrix',
'[{"input":[[[1,2],[3,4]]],"output":[[2,4],[6,8]]},{"input":[[[]]],"output":[[]]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function doubleMatrix(matrix) {
  return matrix.map((row) => row.map((n) => n * 2));
}$$,
array['Внешний map перебирает строки матрицы.', 'Внутренний map перебирает числа в строке и удваивает их.', 'Получается новая матрица той же формы.']),

('hard', 'map', 'Пары из объекта', 'Напиши функцию objectToPairs, которая превращает объект в массив пар [ключ, значение] с помощью Object.keys и map.', 'objectToPairs', 'obj',
'[{"input":[{"a":1,"b":2}],"output":[["a",1],["b",2]]},{"input":[{}],"output":[]}]',
array['for','while','forEach','Object.entries'], array['map','Object.keys'],
$$function objectToPairs(obj) {
  return Object.keys(obj).map((key) => [key, obj[key]]);
}$$,
array['Object.keys(obj) возвращает массив ключей.', 'map превращает каждый ключ в пару [key, obj[key]].']),

('hard', 'map', 'Нумерованный список', 'Напиши функцию numbered, которая с помощью map превращает ["a","b"] в ["1. a","2. b"].', 'numbered', 'items',
'[{"input":[["чай","сок"]],"output":["1. чай","2. сок"]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function numbered(items) {
  return items.map((item, i) => `${i + 1}. ${item}`);
}$$,
array['Второй аргумент функции в map — индекс i.', 'Нумерация начинается с 1, поэтому пишем i + 1.', 'Собираем строку шаблоном.']),

('hard', 'map', 'Оценки буквами', 'Напиши функцию gradeLabels, которая с помощью map превращает баллы в буквы: 90+ "A", 75+ "B", 60+ "C", иначе "F".', 'gradeLabels', 'scores',
'[{"input":[[95,80,60,10]],"output":["A","B","C","F"]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function gradeLabels(scores) {
  return scores.map((score) => {
    if (score >= 90) {
      return "A";
    } else if (score >= 75) {
      return "B";
    } else if (score >= 60) {
      return "C";
    }
    return "F";
  });
}$$,
array['Внутри map можно писать полноценную функцию с if/else.', 'Проверяем пороги от большего к меньшему.', 'Каждый балл превращается в букву.']),

('hard', 'filter', 'Уникальные через filter', 'Напиши функцию uniqueFilter, которая с помощью filter и indexOf убирает повторы, оставляя первое появление.', 'uniqueFilter', 'arr',
'[{"input":[[1,2,1,3,2]],"output":[1,2,3]},{"input":[[]],"output":[]},{"input":[["a","a","b"]],"output":["a","b"]}]',
array['for','while','forEach','new Set','Set('], array['filter','indexOf'],
$$function uniqueFilter(arr) {
  return arr.filter((item, i) => arr.indexOf(item) === i);
}$$,
array['indexOf возвращает индекс ПЕРВОГО появления элемента.', 'Если индекс первого появления равен текущему индексу i, это первое появление — оставляем.', 'Повторы имеют другой индекс и отбрасываются.']),

('hard', 'filter', 'В диапазоне', 'Напиши функцию inRange, которая с помощью filter оставляет числа от min до max включительно.', 'inRange', 'arr, min, max',
'[{"input":[[1,5,10,15],5,10],"output":[5,10]},{"input":[[1,2],5,9],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function inRange(arr, min, max) {
  return arr.filter((n) => n >= min && n <= max);
}$$,
array['Число подходит, если оно не меньше min И не больше max.', 'Соединяем два условия через &&.']),

('hard', 'filter', 'Посты по тегу', 'Напиши функцию byTag, которая с помощью filter возвращает посты { title, tags }, у которых в массиве tags есть tag.', 'byTag', 'posts, tag',
'[{"input":[[{"title":"A","tags":["js","web"]},{"title":"B","tags":["css"]}],"js"],"output":[{"title":"A","tags":["js","web"]}]},{"input":[[],"js"],"output":[]}]',
array['for','while','forEach'], array['filter','includes'],
$$function byTag(posts, tag) {
  return posts.filter((post) => post.tags.includes(tag));
}$$,
array['Для каждого поста проверяем массив его тегов.', 'includes возвращает true, если тег есть в массиве.', 'filter оставляет посты, где это условие true.']),

('hard', 'filter', 'Палиндромы', 'Напиши функцию palindromes, которая с помощью filter оставляет только слова-палиндромы.', 'palindromes', 'words',
'[{"input":[["level","hello","abba","js"]],"output":["level","abba"]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function palindromes(words) {
  return words.filter((word) => word.split("").reverse().join("") === word);
}$$,
array['Слово — палиндром, если оно равно себе задом наперёд.', 'Разворачиваем строку: split("") делает массив букв, reverse() разворачивает, join("") склеивает обратно.', 'filter оставляет слова, где развёрнутое равно исходному.']),

('hard', 'filter', 'Дорогие в наличии', 'Напиши функцию availableExpensive, которая с помощью filter возвращает товары { name, price, inStock } дороже или равные min и в наличии.', 'availableExpensive', 'products, min',
'[{"input":[[{"name":"A","price":500,"inStock":true},{"name":"B","price":900,"inStock":false},{"name":"C","price":100,"inStock":true}],300],"output":[{"name":"A","price":500,"inStock":true}]},{"input":[[],1],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function availableExpensive(products, min) {
  return products.filter((p) => p.inStock && p.price >= min);
}$$,
array['Товар подходит, если он в наличии И цена не меньше min.', 'Оба условия соединяем через &&.']),

('hard', 'filter', 'Общие элементы', 'Напиши функцию common, которая с помощью filter и includes возвращает элементы массива a, которые есть в массиве b.', 'common', 'a, b',
'[{"input":[[1,2,3,4],[2,4,6]],"output":[2,4]},{"input":[[1,2],[]],"output":[]}]',
array['for','while','forEach'], array['filter','includes'],
$$function common(a, b) {
  return a.filter((item) => b.includes(item));
}$$,
array['Перебираем элементы массива a через filter.', 'b.includes(item) проверяет, есть ли элемент в b.', 'Остаются только общие элементы.']),

('hard', 'reduce', 'Группировка по длине', 'Напиши функцию groupByLength, которая с помощью reduce группирует слова в объект: ключ — длина, значение — массив слов.', 'groupByLength', 'words',
'[{"input":[["a","bb","cc","d"]],"output":{"1":["a","d"],"2":["bb","cc"]}},{"input":[[]],"output":{}}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function groupByLength(words) {
  return words.reduce((groups, word) => {
    const len = word.length;
    if (!groups[len]) {
      groups[len] = [];
    }
    groups[len].push(word);
    return groups;
  }, {});
}$$,
array['Начальное значение аккумулятора — пустой объект {}.', 'Для каждого слова берём его длину как ключ.', 'Если массива для этой длины ещё нет, создаём его и добавляем слово.', 'Обязательно возвращаем аккумулятор groups из функции.']),

('hard', 'reduce', 'Частота через reduce', 'Напиши функцию countReduce, которая с помощью reduce возвращает объект частот элементов массива строк.', 'countReduce', 'arr',
'[{"input":[["a","b","a"]],"output":{"a":2,"b":1}},{"input":[[]],"output":{}}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function countReduce(arr) {
  return arr.reduce((counts, item) => {
    counts[item] = (counts[item] || 0) + 1;
    return counts;
  }, {});
}$$,
array['Аккумулятор — пустой объект.', 'Выражение (counts[item] || 0) + 1 работает и для нового, и для уже встреченного элемента.', 'Возвращаем объект на каждом шаге.']),

('hard', 'reduce', 'Самый старший', 'Напиши функцию oldest, которая с помощью reduce возвращает пользователя { name, age } с самым большим age. Массив не пустой.', 'oldest', 'users',
'[{"input":[[{"name":"A","age":20},{"name":"B","age":40},{"name":"C","age":30}]],"output":{"name":"B","age":40}},{"input":[[{"name":"X","age":1}]],"output":{"name":"X","age":1}}]',
array['for','while','forEach','map','filter','sort','Math.max'], array['reduce'],
$$function oldest(users) {
  return users.reduce((best, user) => (user.age > best.age ? user : best));
}$$,
array['Без начального значения аккумулятором станет первый пользователь.', 'На каждом шаге оставляем того, у кого age больше.', 'В конце остаётся самый старший.']),

('hard', 'reduce', 'Распрямить через reduce', 'Напиши функцию flattenReduce, которая с помощью reduce и concat превращает массив массивов в плоский массив.', 'flattenReduce', 'arr',
'[{"input":[[[1,2],[3],[4,5]]],"output":[1,2,3,4,5]},{"input":[[]],"output":[]}]',
array['for','while','forEach','flat','flatMap'], array['reduce','concat'],
$$function flattenReduce(arr) {
  return arr.reduce((result, inner) => result.concat(inner), []);
}$$,
array['Начальное значение — пустой массив.', 'concat склеивает массивы и возвращает новый.', 'На каждом шаге присоединяем очередной вложенный массив.']),

('hard', 'reduce', 'Среднее через reduce', 'Напиши функцию averageReduce, которая с помощью reduce возвращает среднее значение. Для пустого массива верни 0.', 'averageReduce', 'arr',
'[{"input":[[2,4,6]],"output":4},{"input":[[]],"output":0},{"input":[[1,2]],"output":1.5}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function averageReduce(arr) {
  if (arr.length === 0) {
    return 0;
  }
  const sum = arr.reduce((total, n) => total + n, 0);
  return sum / arr.length;
}$$,
array['Пустой массив обрабатываем отдельно, иначе получится деление на 0.', 'Через reduce считаем сумму.', 'Делим сумму на длину массива.']),

('hard', 'reduce', 'Имена по id через reduce', 'Напиши функцию namesById, которая с помощью reduce превращает массив { id, name } в объект { id: name }.', 'namesById', 'users',
'[{"input":[[{"id":1,"name":"A"},{"id":2,"name":"B"}]],"output":{"1":"A","2":"B"}},{"input":[[]],"output":{}}]',
array['for','while','forEach','map','filter','Object.fromEntries'], array['reduce'],
$$function namesById(users) {
  return users.reduce((result, user) => {
    result[user.id] = user.name;
    return result;
  }, {});
}$$,
array['Аккумулятор — пустой объект.', 'Для каждого пользователя записываем result[id] = name.', 'Возвращаем аккумулятор.']),

('hard', 'find', 'Заказ с товаром', 'Напиши функцию findOrderWith, которая с помощью find возвращает первый заказ { id, items }, в массиве items которого есть productId. Если нет — null.', 'findOrderWith', 'orders, productId',
'[{"input":[[{"id":1,"items":[5,6]},{"id":2,"items":[7,8]}],8],"output":{"id":2,"items":[7,8]}},{"input":[[{"id":1,"items":[1]}],9],"output":null}]',
array['for','while','forEach','filter'], array['find'],
$$function findOrderWith(orders, productId) {
  const order = orders.find((o) => o.items.includes(productId));
  return order === undefined ? null : order;
}$$,
array['find перебирает заказы.', 'Условие: в массиве items заказа есть productId (includes).', 'Если ничего не нашли, возвращаем null вместо undefined.']),

('hard', 'find', 'Первый повтор', 'Напиши функцию firstRepeat, которая с помощью find возвращает первый элемент, который уже встречался раньше в массиве. Если повторов нет — null.', 'firstRepeat', 'arr',
'[{"input":[[1,2,3,2,1]],"output":2},{"input":[[1,2,3]],"output":null},{"input":[["a","b","a"]],"output":"a"}]',
array['for','while','forEach','filter','new Set'], array['find','indexOf'],
$$function firstRepeat(arr) {
  const result = arr.find((item, i) => arr.indexOf(item) < i);
  return result === undefined ? null : result;
}$$,
array['indexOf даёт индекс первого появления элемента.', 'Если он меньше текущего индекса i, значит элемент уже встречался — это повтор.', 'find вернёт первый такой элемент. Если не найдёт — возвращаем null.']),

('hard', 'find', 'Свободная комната', 'Напиши функцию freeRoom, которая с помощью find возвращает name первой комнаты { name, free, seats }, которая свободна и вмещает не меньше people человек. Иначе null.', 'freeRoom', 'rooms, people',
'[{"input":[[{"name":"A","free":false,"seats":10},{"name":"B","free":true,"seats":4},{"name":"C","free":true,"seats":8}],5],"output":"C"},{"input":[[{"name":"A","free":true,"seats":2}],3],"output":null}]',
array['for','while','forEach','filter'], array['find'],
$$function freeRoom(rooms, people) {
  const room = rooms.find((r) => r.free && r.seats >= people);
  return room ? room.name : null;
}$$,
array['Условие для find: комната свободна И мест достаточно.', 'find возвращает объект комнаты или undefined.', 'Если комната нашлась, возвращаем её name, иначе null.']),

('hard', 'some / every', 'Есть ли повторы', 'Напиши функцию hasDuplicates, которая с помощью some и indexOf проверяет, есть ли в массиве повторяющиеся элементы.', 'hasDuplicates', 'arr',
'[{"input":[[1,2,3,1]],"output":true},{"input":[[1,2,3]],"output":false},{"input":[[]],"output":false}]',
array['for','while','forEach','filter','new Set','Set('], array['some','indexOf'],
$$function hasDuplicates(arr) {
  return arr.some((item, i) => arr.indexOf(item) !== i);
}$$,
array['Для каждого элемента сравниваем индекс его первого появления с текущим индексом.', 'Если они разные, элемент встречался раньше — это повтор.', 'some вернёт true при первом найденном повторе.']),

('hard', 'some / every', 'Отсортирован через every', 'Напиши функцию sortedEvery, которая с помощью every проверяет, что массив отсортирован по возрастанию.', 'sortedEvery', 'arr',
'[{"input":[[1,2,2,5]],"output":true},{"input":[[3,1]],"output":false},{"input":[[]],"output":true}]',
array['for','while','forEach','sort'], array['every'],
$$function sortedEvery(arr) {
  return arr.every((n, i) => i === 0 || arr[i - 1] <= n);
}$$,
array['У первого элемента нет предыдущего, поэтому для i === 0 условие сразу true.', 'Для остальных проверяем, что предыдущий не больше текущего.', 'every вернёт true, только если условие выполнилось везде.']),

('hard', 'some / every', 'Все сдали', 'Напиши функцию allPassed, которая проверяет, что у КАЖДОГО студента { name, grades } ВСЕ оценки не меньше min. Используй every дважды.', 'allPassed', 'students, min',
'[{"input":[[{"name":"A","grades":[4,5]},{"name":"B","grades":[3,4]}],3],"output":true},{"input":[[{"name":"A","grades":[4,2]}],3],"output":false},{"input":[[],3],"output":true}]',
array['for','while','forEach','filter','some'], array['every'],
$$function allPassed(students, min) {
  return students.every((s) => s.grades.every((g) => g >= min));
}$$,
array['Внешний every проверяет каждого студента.', 'Внутренний every проверяет каждую оценку студента.', 'Результат true, только если все оценки всех студентов не меньше min.']),

('hard', 'Строки', 'Заглавные буквы слов', 'Напиши функцию capitalizeWords, которая делает первую букву каждого слова заглавной. Слова разделены одним пробелом. Сделай это циклом.', 'capitalizeWords', 'str',
'[{"input":["hello world"],"output":"Hello World"},{"input":["js"],"output":"Js"},{"input":[""],"output":""}]',
array['split','map','join','replace','forEach'], array['for'],
$$function capitalizeWords(str) {
  let result = "";
  for (let i = 0; i < str.length; i++) {
    if (i === 0 || str[i - 1] === " ") {
      result += str[i].toUpperCase();
    } else {
      result += str[i];
    }
  }
  return result;
}$$,
array['Идём по строке посимвольно.', 'Буква начинает слово, если она первая в строке или перед ней стоит пробел.', 'Такую букву переводим в верхний регистр, остальные оставляем как есть.']),

('hard', 'Строки', 'Сколько слов', 'Напиши функцию countWords, которая возвращает количество слов. Между словами может быть несколько пробелов, пробелы бывают в начале и в конце.', 'countWords', 'str',
'[{"input":["hello world"],"output":2},{"input":["  много   пробелов  тут "],"output":3},{"input":["   "],"output":0},{"input":[""],"output":0}]',
array['split','match','replace','trim','filter','reduce'], array['for'],
$$function countWords(str) {
  let count = 0;
  for (let i = 0; i < str.length; i++) {
    if (str[i] !== " " && (i === 0 || str[i - 1] === " ")) {
      count++;
    }
  }
  return count;
}$$,
array['Слово начинается там, где стоит не пробел, а перед ним пробел или начало строки.', 'Считаем такие места циклом.', 'Лишние пробелы между словами и по краям не мешают — их просто пропускаем.']),

('hard', 'Строки', 'Сжатие строки', 'Напиши функцию compress, которая сжимает строку: "aaabcc" → "a3b1c2". После каждой буквы пишется, сколько раз она повторилась подряд.', 'compress', 'str',
'[{"input":["aaabcc"],"output":"a3b1c2"},{"input":["abc"],"output":"a1b1c1"},{"input":[""],"output":""},{"input":["zzzz"],"output":"z4"}]',
array['match','replace','split','reduce'], array['for'],
$$function compress(str) {
  let result = "";
  let count = 1;
  for (let i = 0; i < str.length; i++) {
    if (str[i] === str[i + 1]) {
      count++;
    } else {
      result += str[i] + count;
      count = 1;
    }
  }
  return result;
}$$,
array['Считаем, сколько раз подряд повторяется текущая буква.', 'Если следующая буква такая же, увеличиваем счётчик.', 'Когда серия закончилась, дописываем букву и число и сбрасываем счётчик в 1.', 'Для последней буквы str[i + 1] будет undefined, поэтому серия корректно закроется.']);

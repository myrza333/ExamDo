insert into tasks (level, topic, title, description, fn, params, tests, forbidden, required, solution, explanation) values
('easy', 'map', 'Удвоить через map', 'Напиши функцию doubleMap, которая с помощью map возвращает новый массив, где каждое число умножено на 2.', 'doubleMap', 'arr',
'[{"input":[[1,2,3]],"output":[2,4,6]},{"input":[[]],"output":[]},{"input":[[-5]],"output":[-10]}]',
array['for','while','forEach'], array['map'],
$$function doubleMap(arr) {
  return arr.map((n) => n * 2);
}$$,
array['map проходит по каждому элементу и создаёт новый массив той же длины.', 'Функция внутри map получает число n и возвращает n * 2.', 'Возвращаем результат map — исходный массив не меняется.']),

('easy', 'map', 'Числа в строки', 'Напиши функцию toStrings, которая с помощью map превращает массив чисел в массив строк.', 'toStrings', 'arr',
'[{"input":[[1,2,3]],"output":["1","2","3"]},{"input":[[0,-4]],"output":["0","-4"]},{"input":[[]],"output":[]}]',
array['for','while','forEach','join'], array['map'],
$$function toStrings(arr) {
  return arr.map((n) => String(n));
}$$,
array['Для каждого числа вызываем String(n) — это превращает число в строку.', 'map собирает результаты в новый массив.', 'Возвращаем его.']),

('easy', 'map', 'Имена через map', 'Напиши функцию namesMap, которая с помощью map возвращает массив имён из массива пользователей { name, age }.', 'namesMap', 'users',
'[{"input":[[{"name":"Аня","age":20},{"name":"Bob","age":5}]],"output":["Аня","Bob"]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function namesMap(users) {
  return users.map((user) => user.name);
}$$,
array['map перебирает пользователей.', 'Из каждого объекта возвращаем только поле name.', 'Получается массив имён.']),

('easy', 'map', 'Квадраты через map', 'Напиши функцию squaresMap, которая с помощью map возвращает массив квадратов чисел.', 'squaresMap', 'arr',
'[{"input":[[1,2,3]],"output":[1,4,9]},{"input":[[-3]],"output":[9]},{"input":[[]],"output":[]}]',
array['for','while','forEach','Math.pow'], array['map'],
$$function squaresMap(arr) {
  return arr.map((n) => n * n);
}$$,
array['Внутри map умножаем число само на себя.', 'map возвращает новый массив из результатов.']),

('easy', 'map', 'Прибавить индекс', 'Напиши функцию addIndex, которая с помощью map прибавляет к каждому числу его индекс в массиве.', 'addIndex', 'arr',
'[{"input":[[10,10,10]],"output":[10,11,12]},{"input":[[0,0]],"output":[0,1]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function addIndex(arr) {
  return arr.map((n, i) => n + i);
}$$,
array['Функция в map получает два аргумента: элемент и его индекс.', 'Возвращаем n + i.', 'Так первый элемент увеличится на 0, второй на 1 и т.д.']),

('easy', 'map', 'Все большими буквами', 'Напиши функцию upperAll, которая с помощью map переводит все слова массива в верхний регистр.', 'upperAll', 'words',
'[{"input":[["hello","js"]],"output":["HELLO","JS"]},{"input":[["Привет"]],"output":["ПРИВЕТ"]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function upperAll(words) {
  return words.map((word) => word.toUpperCase());
}$$,
array['У строк есть метод toUpperCase(), он возвращает строку большими буквами.', 'Применяем его к каждому слову внутри map.']),

('easy', 'map', 'Длины слов', 'Напиши функцию lengths, которая с помощью map возвращает массив длин слов.', 'lengths', 'words',
'[{"input":[["a","abc","hello"]],"output":[1,3,5]},{"input":[[""]],"output":[0]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function lengths(words) {
  return words.map((word) => word.length);
}$$,
array['У каждой строки есть свойство length.', 'Внутри map возвращаем word.length.']),

('easy', 'map', 'Чётность чисел', 'Напиши функцию evenFlags, которая с помощью map возвращает массив true/false: true — если число чётное.', 'evenFlags', 'arr',
'[{"input":[[1,2,3,4]],"output":[false,true,false,true]},{"input":[[0]],"output":[true]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function evenFlags(arr) {
  return arr.map((n) => n % 2 === 0);
}$$,
array['Выражение n % 2 === 0 само по себе даёт true или false.', 'Возвращаем его из функции внутри map.']),

('easy', 'map', 'Плюс 10 к цене', 'Напиши функцию addTen, которая с помощью map прибавляет 10 к каждой цене.', 'addTen', 'prices',
'[{"input":[[100,250]],"output":[110,260]},{"input":[[0]],"output":[10]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['map'],
$$function addTen(prices) {
  return prices.map((price) => price + 10);
}$$,
array['Внутри map к каждой цене прибавляем 10.', 'map возвращает новый массив цен.']),

('easy', 'filter', 'Чётные через filter', 'Напиши функцию evensFilter, которая с помощью filter оставляет только чётные числа.', 'evensFilter', 'arr',
'[{"input":[[1,2,3,4,6]],"output":[2,4,6]},{"input":[[1,3]],"output":[]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function evensFilter(arr) {
  return arr.filter((n) => n % 2 === 0);
}$$,
array['filter оставляет только те элементы, для которых функция вернула true.', 'Условие чётности: n % 2 === 0.', 'Возвращаем отфильтрованный массив.']),

('easy', 'filter', 'Положительные через filter', 'Напиши функцию positivesFilter, которая с помощью filter оставляет только числа больше нуля.', 'positivesFilter', 'arr',
'[{"input":[[1,-2,3,0]],"output":[1,3]},{"input":[[-1]],"output":[]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function positivesFilter(arr) {
  return arr.filter((n) => n > 0);
}$$,
array['Условие для filter: n > 0.', 'Ноль не пройдёт, потому что он не больше нуля.']),

('easy', 'filter', 'Длинные слова', 'Напиши функцию longWords, которая с помощью filter оставляет слова длиннее n символов.', 'longWords', 'words, n',
'[{"input":[["a","abcd","hello"],3],"output":["abcd","hello"]},{"input":[["hi"],5],"output":[]},{"input":[[],1],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function longWords(words, n) {
  return words.filter((word) => word.length > n);
}$$,
array['Длина слова — word.length.', 'В filter оставляем слова, где word.length > n.']),

('easy', 'filter', 'Взрослые через filter', 'Напиши функцию adultsFilter, которая с помощью filter возвращает пользователей с age 18 и больше.', 'adultsFilter', 'users',
'[{"input":[[{"name":"A","age":20},{"name":"B","age":15}]],"output":[{"name":"A","age":20}]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function adultsFilter(users) {
  return users.filter((user) => user.age >= 18);
}$$,
array['filter получает каждого пользователя.', 'Оставляем тех, у кого user.age >= 18.', 'Возвращаются сами объекты, а не только имена.']),

('easy', 'filter', 'Убрать нули', 'Напиши функцию removeZeros, которая с помощью filter убирает все нули из массива.', 'removeZeros', 'arr',
'[{"input":[[0,1,0,2]],"output":[1,2]},{"input":[[0,0]],"output":[]},{"input":[[5]],"output":[5]}]',
array['for','while','forEach'], array['filter'],
$$function removeZeros(arr) {
  return arr.filter((n) => n !== 0);
}$$,
array['Оставляем все элементы, которые не равны 0.', 'Условие: n !== 0.']),

('easy', 'filter', 'Слова на букву a', 'Напиши функцию startsWithA, которая с помощью filter оставляет слова, начинающиеся с маленькой буквы "a".', 'startsWithA', 'words',
'[{"input":[["apple","banana","avocado"]],"output":["apple","avocado"]},{"input":[["Apple"]],"output":[]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function startsWithA(words) {
  return words.filter((word) => word[0] === "a");
}$$,
array['Первая буква слова — word[0].', 'Сравниваем её с "a". Регистр важен: "A" не подходит.']),

('easy', 'filter', 'Больше чем x через filter', 'Напиши функцию greaterThan, которая с помощью filter оставляет числа строго больше x.', 'greaterThan', 'arr, x',
'[{"input":[[1,5,8,10],5],"output":[8,10]},{"input":[[1,2],10],"output":[]},{"input":[[],0],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function greaterThan(arr, x) {
  return arr.filter((n) => n > x);
}$$,
array['x доступен внутри функции filter, потому что функция видит переменные снаружи (замыкание).', 'Оставляем числа, для которых n > x.']),

('easy', 'filter', 'Активные пользователи', 'Напиши функцию activeUsers, которая с помощью filter возвращает пользователей, у которых active равно true.', 'activeUsers', 'users',
'[{"input":[[{"name":"A","active":true},{"name":"B","active":false}]],"output":[{"name":"A","active":true}]},{"input":[[]],"output":[]}]',
array['for','while','forEach'], array['filter'],
$$function activeUsers(users) {
  return users.filter((user) => user.active);
}$$,
array['Поле active уже содержит true или false.', 'Поэтому его можно сразу вернуть из функции внутри filter.']),

('easy', 'filter', 'Нечётные через filter', 'Напиши функцию oddsFilter, которая с помощью filter оставляет только нечётные числа.', 'oddsFilter', 'arr',
'[{"input":[[1,2,3,4,5]],"output":[1,3,5]},{"input":[[2,4]],"output":[]},{"input":[[-3]],"output":[-3]}]',
array['for','while','forEach'], array['filter'],
$$function oddsFilter(arr) {
  return arr.filter((n) => n % 2 !== 0);
}$$,
array['Нечётное число даёт ненулевой остаток при делении на 2.', 'Для отрицательных остаток будет -1, поэтому проверяем !== 0, а не === 1.']),

('easy', 'reduce', 'Сумма через reduce', 'Напиши функцию sumReduce, которая с помощью reduce возвращает сумму чисел массива.', 'sumReduce', 'arr',
'[{"input":[[1,2,3]],"output":6},{"input":[[]],"output":0},{"input":[[-5,5]],"output":0}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function sumReduce(arr) {
  return arr.reduce((sum, n) => sum + n, 0);
}$$,
array['reduce проходит по массиву и накапливает одно значение — аккумулятор.', 'Функция получает текущую сумму sum и элемент n и возвращает sum + n.', 'Второй аргумент 0 — начальное значение. Без него reduce упадёт на пустом массиве.']),

('easy', 'reduce', 'Произведение через reduce', 'Напиши функцию productReduce, которая с помощью reduce возвращает произведение чисел. Для пустого массива — 1.', 'productReduce', 'arr',
'[{"input":[[2,3,4]],"output":24},{"input":[[]],"output":1},{"input":[[5]],"output":5}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function productReduce(arr) {
  return arr.reduce((result, n) => result * n, 1);
}$$,
array['Для произведения начальное значение 1.', 'На каждом шаге умножаем накопленный результат на элемент.']),

('easy', 'reduce', 'Максимум через reduce', 'Напиши функцию maxReduce, которая с помощью reduce возвращает самое большое число. Массив не пустой.', 'maxReduce', 'arr',
'[{"input":[[3,9,2]],"output":9},{"input":[[-1,-8]],"output":-1},{"input":[[4]],"output":4}]',
array['for','while','forEach','map','filter','Math.max','sort'], array['reduce'],
$$function maxReduce(arr) {
  return arr.reduce((max, n) => (n > max ? n : max));
}$$,
array['Без начального значения reduce возьмёт первый элемент как стартовый max.', 'На каждом шаге возвращаем больший из max и n через тернарный оператор.', 'В конце в аккумуляторе окажется максимум.']),

('easy', 'reduce', 'Количество чётных через reduce', 'Напиши функцию countEvenReduce, которая с помощью reduce считает количество чётных чисел.', 'countEvenReduce', 'arr',
'[{"input":[[1,2,3,4]],"output":2},{"input":[[]],"output":0},{"input":[[1,3]],"output":0}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function countEvenReduce(arr) {
  return arr.reduce((count, n) => (n % 2 === 0 ? count + 1 : count), 0);
}$$,
array['Аккумулятор — это счётчик, начинаем с 0.', 'Если число чётное, возвращаем count + 1, иначе count без изменений.']),

('easy', 'reduce', 'Общий возраст', 'Напиши функцию totalAge, которая с помощью reduce возвращает сумму возрастов пользователей { name, age }.', 'totalAge', 'users',
'[{"input":[[{"name":"A","age":20},{"name":"B","age":15}]],"output":35},{"input":[[]],"output":0}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function totalAge(users) {
  return users.reduce((sum, user) => sum + user.age, 0);
}$$,
array['Аккумулятор sum начинаем с 0.', 'К нему прибавляем user.age каждого пользователя.']),

('easy', 'reduce', 'Склеить слова', 'Напиши функцию concatWords, которая с помощью reduce склеивает все слова в одну строку без пробелов.', 'concatWords', 'words',
'[{"input":[["a","b","c"]],"output":"abc"},{"input":[[]],"output":""},{"input":[["Exam","Do"]],"output":"ExamDo"}]',
array['for','while','forEach','map','filter','join'], array['reduce'],
$$function concatWords(words) {
  return words.reduce((result, word) => result + word, "");
}$$,
array['Начальное значение — пустая строка "".', 'На каждом шаге прибавляем слово к строке.']),

('easy', 'reduce', 'Сумма положительных', 'Напиши функцию sumPositive, которая с помощью reduce возвращает сумму только положительных чисел.', 'sumPositive', 'arr',
'[{"input":[[1,-2,3]],"output":4},{"input":[[-1,-2]],"output":0},{"input":[[]],"output":0}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function sumPositive(arr) {
  return arr.reduce((sum, n) => (n > 0 ? sum + n : sum), 0);
}$$,
array['Начинаем с 0.', 'Если число положительное, прибавляем его, иначе оставляем сумму без изменений.']),

('easy', 'reduce', 'Сколько длинных слов', 'Напиши функцию countLong, которая с помощью reduce считает слова длиннее n символов.', 'countLong', 'words, n',
'[{"input":[["a","abcd","hello"],3],"output":2},{"input":[[],2],"output":0},{"input":[["hi"],1],"output":1}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function countLong(words, n) {
  return words.reduce((count, word) => (word.length > n ? count + 1 : count), 0);
}$$,
array['Аккумулятор — счётчик с нуля.', 'Если длина слова больше n, увеличиваем счётчик на 1.']),

('easy', 'reduce', 'Корзина через reduce', 'Напиши функцию cartReduce, которая с помощью reduce считает общую стоимость товаров { price, qty }.', 'cartReduce', 'cart',
'[{"input":[[{"price":100,"qty":2},{"price":50,"qty":1}]],"output":250},{"input":[[]],"output":0}]',
array['for','while','forEach','map','filter'], array['reduce'],
$$function cartReduce(cart) {
  return cart.reduce((total, item) => total + item.price * item.qty, 0);
}$$,
array['Начальное значение total = 0.', 'Для каждого товара прибавляем price * qty.']),

('easy', 'find', 'Первое чётное', 'Напиши функцию firstEven, которая с помощью find возвращает первое чётное число или null, если чётных нет.', 'firstEven', 'arr',
'[{"input":[[1,3,4,6]],"output":4},{"input":[[1,3]],"output":null},{"input":[[]],"output":null}]',
array['for','while','forEach','filter'], array['find'],
$$function firstEven(arr) {
  const result = arr.find((n) => n % 2 === 0);
  return result === undefined ? null : result;
}$$,
array['find возвращает первый элемент, для которого условие true.', 'Если ничего не нашлось, find возвращает undefined.', 'По условию нужно вернуть null, поэтому проверяем результат на undefined.']),

('easy', 'find', 'Найти по имени', 'Напиши функцию findByName, которая с помощью find возвращает пользователя с нужным name или null.', 'findByName', 'users, name',
'[{"input":[[{"name":"A","age":1},{"name":"B","age":2}],"B"],"output":{"name":"B","age":2}},{"input":[[{"name":"A","age":1}],"Z"],"output":null}]',
array['for','while','forEach','filter'], array['find'],
$$function findByName(users, name) {
  const user = users.find((u) => u.name === name);
  return user === undefined ? null : user;
}$$,
array['find ищет пользователя, у которого u.name === name.', 'Если не нашли — получаем undefined и превращаем его в null.']),

('easy', 'find', 'Первое длинное слово', 'Напиши функцию firstLong, которая с помощью find возвращает первое слово длиннее n символов или null.', 'firstLong', 'words, n',
'[{"input":[["hi","hello","world"],3],"output":"hello"},{"input":[["a"],3],"output":null}]',
array['for','while','forEach','filter'], array['find'],
$$function firstLong(words, n) {
  const word = words.find((w) => w.length > n);
  return word === undefined ? null : word;
}$$,
array['Условие для find: w.length > n.', 'find остановится на первом подходящем слове.', 'undefined заменяем на null.']),

('easy', 'find', 'Первое отрицательное через find', 'Напиши функцию firstNegativeFind, которая с помощью find возвращает первое отрицательное число или null.', 'firstNegativeFind', 'arr',
'[{"input":[[3,-1,-5]],"output":-1},{"input":[[1,2]],"output":null}]',
array['for','while','forEach','filter'], array['find'],
$$function firstNegativeFind(arr) {
  const result = arr.find((n) => n < 0);
  return result === undefined ? null : result;
}$$,
array['Условие для find: n < 0.', 'Если ничего не нашли, возвращаем null.']),

('easy', 'find', 'Товар по id', 'Напиши функцию findProduct, которая с помощью find возвращает товар с нужным id или null.', 'findProduct', 'products, id',
'[{"input":[[{"id":1,"name":"Чай"},{"id":2,"name":"Сок"}],1],"output":{"id":1,"name":"Чай"}},{"input":[[],1],"output":null}]',
array['for','while','forEach','filter'], array['find'],
$$function findProduct(products, id) {
  const product = products.find((p) => p.id === id);
  return product === undefined ? null : product;
}$$,
array['Ищем товар, у которого p.id === id.', 'Если не нашли, возвращаем null.']),

('easy', 'find', 'Первое больше x', 'Напиши функцию firstGreater, которая с помощью find возвращает первое число строго больше x или null.', 'firstGreater', 'arr, x',
'[{"input":[[1,5,8],4],"output":5},{"input":[[1,2],9],"output":null}]',
array['for','while','forEach','filter'], array['find'],
$$function firstGreater(arr, x) {
  const result = arr.find((n) => n > x);
  return result === undefined ? null : result;
}$$,
array['Условие для find: n > x.', 'Возвращаем найденное число или null.']),

('easy', 'some / every', 'Есть ли отрицательное', 'Напиши функцию hasNegative, которая с помощью some возвращает true, если в массиве есть хотя бы одно отрицательное число.', 'hasNegative', 'arr',
'[{"input":[[1,-2,3]],"output":true},{"input":[[1,2]],"output":false},{"input":[[]],"output":false}]',
array['for','while','forEach','filter','find'], array['some'],
$$function hasNegative(arr) {
  return arr.some((n) => n < 0);
}$$,
array['some возвращает true, если условие выполнилось хотя бы для одного элемента.', 'Для пустого массива some всегда возвращает false.']),

('easy', 'some / every', 'Все положительные', 'Напиши функцию allPositive, которая с помощью every возвращает true, если все числа больше нуля.', 'allPositive', 'arr',
'[{"input":[[1,2,3]],"output":true},{"input":[[1,0,3]],"output":false},{"input":[[]],"output":true}]',
array['for','while','forEach','filter','find'], array['every'],
$$function allPositive(arr) {
  return arr.every((n) => n > 0);
}$$,
array['every возвращает true, только если условие выполнилось для всех элементов.', 'Для пустого массива every возвращает true — нет ни одного элемента, который нарушил бы условие.']),

('easy', 'some / every', 'Есть ли взрослый', 'Напиши функцию hasAdult, которая с помощью some проверяет, есть ли пользователь с age 18 или больше.', 'hasAdult', 'users',
'[{"input":[[{"name":"A","age":10},{"name":"B","age":30}]],"output":true},{"input":[[{"name":"A","age":10}]],"output":false}]',
array['for','while','forEach','filter','find'], array['some'],
$$function hasAdult(users) {
  return users.some((user) => user.age >= 18);
}$$,
array['Условие для some: user.age >= 18.', 'Достаточно одного такого пользователя, чтобы вернуть true.']),

('easy', 'some / every', 'Все чётные', 'Напиши функцию allEven, которая с помощью every возвращает true, если все числа чётные.', 'allEven', 'arr',
'[{"input":[[2,4,6]],"output":true},{"input":[[2,3]],"output":false},{"input":[[]],"output":true}]',
array['for','while','forEach','filter','find'], array['every'],
$$function allEven(arr) {
  return arr.every((n) => n % 2 === 0);
}$$,
array['every проверяет условие для каждого элемента.', 'Если хоть одно число нечётное, вернётся false.']),

('easy', 'some / every', 'Есть ли слово', 'Напиши функцию hasWord, которая с помощью some проверяет, есть ли в массиве слово word.', 'hasWord', 'words, word',
'[{"input":[["js","ts"],"ts"],"output":true},{"input":[["js"],"go"],"output":false}]',
array['for','while','forEach','filter','find','includes','indexOf'], array['some'],
$$function hasWord(words, word) {
  return words.some((w) => w === word);
}$$,
array['Условие для some: w === word.', 'Вернётся true, если такое слово встретилось хотя бы раз.']),

('easy', 'some / every', 'Все слова длинные', 'Напиши функцию allLong, которая с помощью every проверяет, что все слова длиннее n символов.', 'allLong', 'words, n',
'[{"input":[["hello","world"],3],"output":true},{"input":[["hello","hi"],3],"output":false},{"input":[[],5],"output":true}]',
array['for','while','forEach','filter','find'], array['every'],
$$function allLong(words, n) {
  return words.every((w) => w.length > n);
}$$,
array['Условие для every: w.length > n.', 'Если хоть одно слово короче или равно n, вернётся false.']),

('easy', 'Строки', 'Развернуть строку', 'Напиши функцию reverseString, которая возвращает строку задом наперёд. Сделай это циклом.', 'reverseString', 'str',
'[{"input":["hello"],"output":"olleh"},{"input":["a"],"output":"a"},{"input":[""],"output":""}]',
array['split','reverse','join','reduce'], array['for'],
$$function reverseString(str) {
  let result = "";
  for (let i = str.length - 1; i >= 0; i--) {
    result += str[i];
  }
  return result;
}$$,
array['Начинаем с пустой строки.', 'Идём по строке с последнего символа к первому.', 'Добавляем каждый символ в result.', 'Возвращаем result.']),

('easy', 'Строки', 'Сколько гласных', 'Напиши функцию countVowels, которая возвращает количество английских гласных a, e, i, o, u в строке (строка в нижнем регистре).', 'countVowels', 'str',
'[{"input":["hello"],"output":2},{"input":["sky"],"output":0},{"input":["aeiou"],"output":5}]',
array['split','match','replace','filter','reduce'], array['for'],
$$function countVowels(str) {
  let count = 0;
  for (let i = 0; i < str.length; i++) {
    const ch = str[i];
    if (ch === "a" || ch === "e" || ch === "i" || ch === "o" || ch === "u") {
      count++;
    }
  }
  return count;
}$$,
array['Счётчик начинаем с 0.', 'Перебираем символы строки циклом for.', 'Проверяем символ на каждую гласную через ||.', 'Если это гласная, увеличиваем счётчик.']),

('easy', 'Строки', 'Сколько раз символ', 'Напиши функцию countChar, которая возвращает, сколько раз символ ch встречается в строке.', 'countChar', 'str, ch',
'[{"input":["banana","a"],"output":3},{"input":["hello","z"],"output":0},{"input":["",""],"output":0}]',
array['split','match','replace','filter','reduce'], array['for'],
$$function countChar(str, ch) {
  let count = 0;
  for (let i = 0; i < str.length; i++) {
    if (str[i] === ch) {
      count++;
    }
  }
  return count;
}$$,
array['Перебираем символы строки.', 'Если str[i] равен ch, увеличиваем счётчик.', 'Возвращаем счётчик.']),

('easy', 'Строки', 'Палиндром', 'Напиши функцию isPalindrome, которая возвращает true, если строка читается одинаково слева направо и справа налево.', 'isPalindrome', 'str',
'[{"input":["level"],"output":true},{"input":["hello"],"output":false},{"input":["a"],"output":true},{"input":["abba"],"output":true}]',
array['split','reverse','join'], array['for'],
$$function isPalindrome(str) {
  for (let i = 0; i < str.length / 2; i++) {
    if (str[i] !== str[str.length - 1 - i]) {
      return false;
    }
  }
  return true;
}$$,
array['Сравниваем символы попарно: первый с последним, второй с предпоследним и т.д.', 'Достаточно дойти до середины строки.', 'Если хоть одна пара не совпала — это не палиндром.', 'Если все пары совпали, возвращаем true.']),

('easy', 'Строки', 'Сколько пробелов', 'Напиши функцию countSpaces, которая возвращает количество пробелов в строке.', 'countSpaces', 'str',
'[{"input":["a b c"],"output":2},{"input":["abc"],"output":0},{"input":["   "],"output":3}]',
array['split','match','replace','filter','reduce'], array['for'],
$$function countSpaces(str) {
  let count = 0;
  for (let i = 0; i < str.length; i++) {
    if (str[i] === " ") {
      count++;
    }
  }
  return count;
}$$,
array['Перебираем строку посимвольно.', 'Если символ — пробел " ", увеличиваем счётчик.', 'Возвращаем количество.']),

('easy', 'Строки', 'Повторить строку', 'Напиши функцию repeatStr, которая возвращает строку str, повторённую n раз подряд.', 'repeatStr', 'str, n',
'[{"input":["ab",3],"output":"ababab"},{"input":["x",1],"output":"x"},{"input":["hi",0],"output":""}]',
array['repeat','join','fill'], array['for'],
$$function repeatStr(str, n) {
  let result = "";
  for (let i = 0; i < n; i++) {
    result += str;
  }
  return result;
}$$,
array['Начинаем с пустой строки.', 'Цикл выполняется n раз.', 'Каждый раз добавляем str к результату.', 'Если n = 0, вернётся пустая строка.']);

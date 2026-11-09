insert into tasks (level, topic, title, description, fn, params, tests, forbidden, required, solution, explanation) values
('easy', 'Объекты', 'Полное имя', 'Напиши функцию fullName, которая принимает объект { first, last } и возвращает строку "first last" через пробел.', 'fullName', 'user',
'[{"input":[{"first":"Иван","last":"Петров"}],"output":"Иван Петров"},{"input":[{"first":"Anna","last":"Lee"}],"output":"Anna Lee"}]',
array[]::text[], array[]::text[],
$$function fullName(user) {
  return user.first + " " + user.last;
}$$,
array['Значения из объекта берём через точку: user.first и user.last.', 'Склеиваем их, добавляя пробел посередине.', 'Возвращаем получившуюся строку.']),

('easy', 'Объекты', 'Сколько ключей', 'Напиши функцию countKeys, которая возвращает количество ключей в объекте. Используй цикл for...in.', 'countKeys', 'obj',
'[{"input":[{"a":1,"b":2,"c":3}],"output":3},{"input":[{}],"output":0},{"input":[{"name":"x"}],"output":1}]',
array['Object.keys','Object.values','Object.entries'], array['for'],
$$function countKeys(obj) {
  let count = 0;
  for (const key in obj) {
    count++;
  }
  return count;
}$$,
array['Заводим счётчик count = 0.', 'Цикл for...in перебирает все ключи объекта.', 'На каждом ключе увеличиваем счётчик.', 'Возвращаем count.']),

('easy', 'Объекты', 'Сумма значений', 'Напиши функцию sumValues, которая возвращает сумму всех числовых значений объекта.', 'sumValues', 'obj',
'[{"input":[{"a":1,"b":2,"c":3}],"output":6},{"input":[{}],"output":0},{"input":[{"x":-5,"y":10}],"output":5}]',
array['Object.values','Object.entries','reduce'], array['for'],
$$function sumValues(obj) {
  let sum = 0;
  for (const key in obj) {
    sum += obj[key];
  }
  return sum;
}$$,
array['Заводим sum = 0.', 'Перебираем ключи через for...in.', 'Значение по ключу берём через квадратные скобки obj[key] — через точку нельзя, потому что key — переменная.', 'Возвращаем сумму.']),

('easy', 'Объекты', 'Есть ли ключ', 'Напиши функцию hasKey, которая возвращает true, если в объекте есть ключ key.', 'hasKey', 'obj, key',
'[{"input":[{"a":1},"a"],"output":true},{"input":[{"a":1},"b"],"output":false},{"input":[{"zero":0},"zero"],"output":true}]',
array[]::text[], array[]::text[],
$$function hasKey(obj, key) {
  return key in obj;
}$$,
array['Оператор in проверяет, есть ли ключ в объекте.', 'Проверять через if (obj[key]) нельзя: для значения 0 или "" получится false, хотя ключ есть.', 'Возвращаем результат key in obj.']),

('easy', 'Объекты', 'Совершеннолетний', 'Напиши функцию isAdult, которая принимает объект { name, age } и возвращает true, если age 18 или больше.', 'isAdult', 'person',
'[{"input":[{"name":"Аня","age":20}],"output":true},{"input":[{"name":"Лёша","age":17}],"output":false},{"input":[{"name":"Ира","age":18}],"output":true}]',
array[]::text[], array['if'],
$$function isAdult(person) {
  if (person.age >= 18) {
    return true;
  }
  return false;
}$$,
array['Берём возраст из объекта: person.age.', 'Сравниваем с 18 через >=, потому что ровно 18 тоже считается.', 'Возвращаем true или false.']),

('easy', 'Объекты', 'Список ключей', 'Напиши функцию getKeys, которая возвращает массив ключей объекта. Используй for...in.', 'getKeys', 'obj',
'[{"input":[{"a":1,"b":2}],"output":["a","b"]},{"input":[{}],"output":[]},{"input":[{"name":"x","age":3}],"output":["name","age"]}]',
array['Object.keys','Object.entries'], array['for'],
$$function getKeys(obj) {
  const keys = [];
  for (const key in obj) {
    keys.push(key);
  }
  return keys;
}$$,
array['Создаём пустой массив keys.', 'В цикле for...in получаем каждый ключ.', 'Добавляем ключ в массив через push.', 'Возвращаем массив.']),

('easy', 'Объекты', 'Список значений', 'Напиши функцию getValues, которая возвращает массив значений объекта. Используй for...in.', 'getValues', 'obj',
'[{"input":[{"a":1,"b":2}],"output":[1,2]},{"input":[{}],"output":[]},{"input":[{"name":"x","ok":true}],"output":["x",true]}]',
array['Object.values','Object.entries'], array['for'],
$$function getValues(obj) {
  const values = [];
  for (const key in obj) {
    values.push(obj[key]);
  }
  return values;
}$$,
array['Создаём пустой массив values.', 'Перебираем ключи через for...in.', 'По каждому ключу достаём значение obj[key] и добавляем в массив.', 'Возвращаем массив.']),

('easy', 'Объекты', 'Ключ с максимумом', 'Напиши функцию maxKey, которая возвращает ключ с самым большим числовым значением. Объект не пустой.', 'maxKey', 'obj',
'[{"input":[{"a":1,"b":5,"c":3}],"output":"b"},{"input":[{"x":-1,"y":-7}],"output":"x"},{"input":[{"only":4}],"output":"only"}]',
array['Object.keys','Object.values','Object.entries','Math.max','sort'], array['for'],
$$function maxKey(obj) {
  let best = null;
  for (const key in obj) {
    if (best === null || obj[key] > obj[best]) {
      best = key;
    }
  }
  return best;
}$$,
array['Храним ключ лучшего значения в best, сначала он null.', 'Перебираем ключи через for...in.', 'Если best ещё не задан или значение больше, чем у best, запоминаем текущий ключ.', 'Возвращаем best.']),

('easy', 'Объекты', 'Сколько таких значений', 'Напиши функцию countByValue, которая возвращает, у скольких ключей объекта значение равно value.', 'countByValue', 'obj, value',
'[{"input":[{"a":1,"b":2,"c":1},1],"output":2},{"input":[{"a":"x"},"y"],"output":0},{"input":[{},5],"output":0}]',
array['Object.values','Object.entries','filter','reduce'], array['for'],
$$function countByValue(obj, value) {
  let count = 0;
  for (const key in obj) {
    if (obj[key] === value) {
      count++;
    }
  }
  return count;
}$$,
array['Счётчик начинаем с 0.', 'Перебираем ключи объекта.', 'Если obj[key] строго равно value, увеличиваем счётчик.', 'Возвращаем count.']),

('easy', 'Объекты', 'Создать пользователя', 'Напиши функцию makeUser, которая принимает name и age и возвращает объект { name, age }.', 'makeUser', 'name, age',
'[{"input":["Аня",20],"output":{"name":"Аня","age":20}},{"input":["Bob",5],"output":{"name":"Bob","age":5}}]',
array[]::text[], array[]::text[],
$$function makeUser(name, age) {
  return { name: name, age: age };
}$$,
array['Объект создаётся фигурными скобками.', 'Ключ name получает значение параметра name, ключ age — параметра age.', 'Можно короче: { name, age }, если имена совпадают.']),

('easy', 'Объекты', 'Обновить возраст', 'Напиши функцию updateAge, которая возвращает НОВЫЙ объект пользователя с изменённым age, не меняя исходный.', 'updateAge', 'user, age',
'[{"input":[{"name":"Аня","age":20},21],"output":{"name":"Аня","age":21}},{"input":[{"name":"Bob","age":5,"city":"Бишкек"},6],"output":{"name":"Bob","age":6,"city":"Бишкек"}}]',
array[]::text[], array[]::text[],
$$function updateAge(user, age) {
  return { ...user, age: age };
}$$,
array['Оператор spread ...user копирует все поля старого объекта в новый.', 'После него пишем age: age — это значение перезапишет старое.', 'Исходный объект при этом не меняется.']),

('easy', 'Объекты', 'Убрать ключ', 'Напиши функцию removeKey, которая возвращает новый объект без ключа key. Исходный объект не меняй.', 'removeKey', 'obj, key',
'[{"input":[{"a":1,"b":2},"a"],"output":{"b":2}},{"input":[{"a":1},"z"],"output":{"a":1}},{"input":[{"x":1,"y":2,"z":3},"y"],"output":{"x":1,"z":3}}]',
array['delete'], array['for'],
$$function removeKey(obj, key) {
  const result = {};
  for (const k in obj) {
    if (k !== key) {
      result[k] = obj[k];
    }
  }
  return result;
}$$,
array['Создаём пустой объект result.', 'Перебираем ключи исходного объекта.', 'Копируем в result все ключи, кроме того, который нужно убрать.', 'Возвращаем result — исходный объект не тронут.']),

('easy', 'Объекты', 'Цена с наценкой', 'Напиши функцию priceWithTax, которая принимает товар { name, price } и возвращает цену, увеличенную на 20%.', 'priceWithTax', 'product',
'[{"input":[{"name":"Чай","price":100}],"output":120},{"input":[{"name":"Сок","price":50}],"output":60},{"input":[{"name":"Вода","price":0}],"output":0}]',
array[]::text[], array[]::text[],
$$function priceWithTax(product) {
  return product.price * 1.2;
}$$,
array['Цену берём из объекта: product.price.', 'Увеличить на 20% — значит умножить на 1.2.', 'Возвращаем результат.']),

('easy', 'Объекты', 'Имена пользователей', 'Напиши функцию getNames, которая принимает массив пользователей { name, age } и возвращает массив имён. Используй цикл for.', 'getNames', 'users',
'[{"input":[[{"name":"Аня","age":20},{"name":"Bob","age":5}]],"output":["Аня","Bob"]},{"input":[[]],"output":[]}]',
array['map','forEach','reduce'], array['for'],
$$function getNames(users) {
  const names = [];
  for (let i = 0; i < users.length; i++) {
    names.push(users[i].name);
  }
  return names;
}$$,
array['Создаём пустой массив names.', 'Перебираем пользователей циклом for.', 'У каждого берём users[i].name и добавляем в массив.', 'Возвращаем names.']),

('easy', 'Объекты', 'Сколько взрослых', 'Напиши функцию countAdults, которая возвращает, сколько пользователей в массиве имеют age 18 или больше.', 'countAdults', 'users',
'[{"input":[[{"name":"A","age":20},{"name":"B","age":15},{"name":"C","age":18}]],"output":2},{"input":[[]],"output":0}]',
array['filter','reduce','forEach'], array['for'],
$$function countAdults(users) {
  let count = 0;
  for (let i = 0; i < users.length; i++) {
    if (users[i].age >= 18) {
      count++;
    }
  }
  return count;
}$$,
array['Счётчик начинаем с 0.', 'Проходим по массиву пользователей.', 'Если age >= 18, увеличиваем счётчик.', 'Возвращаем count.']),

('easy', 'Объекты', 'Найти по id', 'Напиши функцию findById, которая возвращает пользователя с нужным id или null, если такого нет.', 'findById', 'users, id',
'[{"input":[[{"id":1,"name":"A"},{"id":2,"name":"B"}],2],"output":{"id":2,"name":"B"}},{"input":[[{"id":1,"name":"A"}],5],"output":null}]',
array['find','filter','forEach'], array['for'],
$$function findById(users, id) {
  for (let i = 0; i < users.length; i++) {
    if (users[i].id === id) {
      return users[i];
    }
  }
  return null;
}$$,
array['Перебираем пользователей циклом for.', 'Сравниваем users[i].id с нужным id.', 'Нашли — сразу возвращаем пользователя.', 'Если цикл закончился, возвращаем null.']),

('easy', 'Объекты', 'Сумма корзины', 'Напиши функцию cartTotal, которая принимает массив товаров { price, qty } и возвращает общую стоимость (цена × количество).', 'cartTotal', 'cart',
'[{"input":[[{"price":100,"qty":2},{"price":50,"qty":1}]],"output":250},{"input":[[]],"output":0}]',
array['reduce','forEach','map'], array['for'],
$$function cartTotal(cart) {
  let total = 0;
  for (let i = 0; i < cart.length; i++) {
    total += cart[i].price * cart[i].qty;
  }
  return total;
}$$,
array['Заводим total = 0.', 'Перебираем товары корзины.', 'Для каждого прибавляем price * qty.', 'Возвращаем total.']),

('easy', 'Объекты', 'Поменять ключи и значения', 'Напиши функцию invert, которая возвращает новый объект, где ключи и значения поменялись местами. Все значения — строки.', 'invert', 'obj',
'[{"input":[{"a":"x","b":"y"}],"output":{"x":"a","y":"b"}},{"input":[{}],"output":{}}]',
array['Object.entries','Object.fromEntries'], array['for'],
$$function invert(obj) {
  const result = {};
  for (const key in obj) {
    result[obj[key]] = key;
  }
  return result;
}$$,
array['Создаём пустой объект result.', 'Перебираем ключи исходного объекта.', 'Значение становится ключом, а ключ — значением: result[obj[key]] = key.', 'Возвращаем result.']),

('easy', 'Объекты', 'Объединить объекты', 'Напиши функцию merge, которая возвращает новый объект со всеми ключами a и b. Если ключ есть в обоих, берётся значение из b.', 'merge', 'a, b',
'[{"input":[{"x":1},{"y":2}],"output":{"x":1,"y":2}},{"input":[{"x":1,"y":2},{"y":5}],"output":{"x":1,"y":5}},{"input":[{},{}],"output":{}}]',
array['Object.assign','...'], array['for'],
$$function merge(a, b) {
  const result = {};
  for (const key in a) {
    result[key] = a[key];
  }
  for (const key in b) {
    result[key] = b[key];
  }
  return result;
}$$,
array['Создаём пустой объект result.', 'Первым циклом копируем все ключи из a.', 'Вторым циклом копируем ключи из b — они перезапишут совпадающие ключи из a.', 'Возвращаем result.']),

('easy', 'Объекты', 'Подсчёт букв', 'Напиши функцию countLetters, которая возвращает объект, где ключ — буква строки, а значение — сколько раз она встречается.', 'countLetters', 'str',
'[{"input":["aab"],"output":{"a":2,"b":1}},{"input":["abc"],"output":{"a":1,"b":1,"c":1}},{"input":[""],"output":{}}]',
array['split','reduce','forEach','match'], array['for'],
$$function countLetters(str) {
  const result = {};
  for (let i = 0; i < str.length; i++) {
    const letter = str[i];
    if (result[letter]) {
      result[letter]++;
    } else {
      result[letter] = 1;
    }
  }
  return result;
}$$,
array['Создаём пустой объект-счётчик.', 'Перебираем строку посимвольно — к символу можно обратиться как str[i].', 'Если буква уже есть в объекте, увеличиваем её счётчик, иначе ставим 1.', 'Возвращаем объект.']),

('easy', 'Объекты', 'Пустой ли объект', 'Напиши функцию isEmpty, которая возвращает true, если у объекта нет ни одного ключа. Используй for...in.', 'isEmpty', 'obj',
'[{"input":[{}],"output":true},{"input":[{"a":1}],"output":false},{"input":[{"x":null}],"output":false}]',
array['Object.keys','Object.values','Object.entries','JSON.stringify'], array['for'],
$$function isEmpty(obj) {
  for (const key in obj) {
    return false;
  }
  return true;
}$$,
array['Если цикл for...in нашёл хотя бы один ключ, объект не пустой — сразу возвращаем false.', 'Если цикл не выполнился ни разу, ключей нет — возвращаем true.', 'Ключ со значением null тоже считается ключом.']),

('easy', 'Объекты', 'Самый дешёвый товар', 'Напиши функцию cheapest, которая принимает массив товаров { name, price } и возвращает name самого дешёвого. Массив не пустой.', 'cheapest', 'products',
'[{"input":[[{"name":"Чай","price":100},{"name":"Сок","price":40},{"name":"Вода","price":60}]],"output":"Сок"},{"input":[[{"name":"Хлеб","price":30}]],"output":"Хлеб"}]',
array['sort','reduce','Math.min','forEach'], array['for'],
$$function cheapest(products) {
  let min = products[0];
  for (let i = 1; i < products.length; i++) {
    if (products[i].price < min.price) {
      min = products[i];
    }
  }
  return min.name;
}$$,
array['Первый товар считаем самым дешёвым.', 'Перебираем остальные товары.', 'Если цена текущего меньше цены min, запоминаем текущий товар.', 'Возвращаем min.name.']),

('easy', 'Объекты', 'Статус заказа', 'Напиши функцию orderStatus, которая принимает заказ { id, paid } и возвращает "Оплачен", если paid равно true, иначе "Не оплачен".', 'orderStatus', 'order',
'[{"input":[{"id":1,"paid":true}],"output":"Оплачен"},{"input":[{"id":2,"paid":false}],"output":"Не оплачен"}]',
array[]::text[], array['if'],
$$function orderStatus(order) {
  if (order.paid) {
    return "Оплачен";
  } else {
    return "Не оплачен";
  }
}$$,
array['Берём поле paid из объекта.', 'Если оно true — возвращаем "Оплачен".', 'Иначе — "Не оплачен".']),

('easy', 'Объекты', 'Выбрать ключи', 'Напиши функцию pick, которая возвращает новый объект только с ключами из массива keys (если такой ключ есть в объекте).', 'pick', 'obj, keys',
'[{"input":[{"a":1,"b":2,"c":3},["a","c"]],"output":{"a":1,"c":3}},{"input":[{"a":1},["z"]],"output":{}},{"input":[{"a":1,"b":2},[]],"output":{}}]',
array['filter','reduce','forEach','Object.fromEntries'], array['for'],
$$function pick(obj, keys) {
  const result = {};
  for (let i = 0; i < keys.length; i++) {
    const key = keys[i];
    if (key in obj) {
      result[key] = obj[key];
    }
  }
  return result;
}$$,
array['Создаём пустой объект result.', 'Перебираем массив нужных ключей.', 'Если ключ есть в объекте (key in obj), копируем его значение.', 'Возвращаем result.']),

('easy', 'Объекты', 'Объект в массив пар', 'Напиши функцию toPairs, которая превращает объект в массив пар [ключ, значение]. Используй for...in.', 'toPairs', 'obj',
'[{"input":[{"a":1,"b":2}],"output":[["a",1],["b",2]]},{"input":[{}],"output":[]}]',
array['Object.entries','Object.keys','map'], array['for'],
$$function toPairs(obj) {
  const result = [];
  for (const key in obj) {
    result.push([key, obj[key]]);
  }
  return result;
}$$,
array['Создаём пустой массив.', 'Перебираем ключи через for...in.', 'Для каждого ключа добавляем массив из двух элементов: [key, obj[key]].', 'Возвращаем результат.']);

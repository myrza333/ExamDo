insert into tasks (level, topic, title, description, fn, params, tests, forbidden, required, solution, explanation) values
('hard', 'Объекты', 'Группировка по городу', 'Напиши функцию groupByCity, которая принимает массив { name, city } и возвращает объект: ключ — город, значение — массив имён.', 'groupByCity', 'users',
'[{"input":[[{"name":"A","city":"Бишкек"},{"name":"B","city":"Ош"},{"name":"C","city":"Бишкек"}]],"output":{"Бишкек":["A","C"],"Ош":["B"]}},{"input":[[]],"output":{}}]',
array['reduce','groupBy','forEach','map','filter'], array['for'],
$$function groupByCity(users) {
  const result = {};
  for (let i = 0; i < users.length; i++) {
    const user = users[i];
    if (!result[user.city]) {
      result[user.city] = [];
    }
    result[user.city].push(user.name);
  }
  return result;
}$$,
array['Создаём пустой объект result.', 'Для каждого пользователя проверяем, есть ли уже массив для его города.', 'Если нет — создаём пустой массив.', 'Добавляем имя в массив своего города.']),

('hard', 'Объекты', 'Частота значений', 'Напиши функцию frequency, которая возвращает объект: ключ — элемент массива строк, значение — сколько раз он встречается.', 'frequency', 'arr',
'[{"input":[["a","b","a","c","a"]],"output":{"a":3,"b":1,"c":1}},{"input":[[]],"output":{}}]',
array['reduce','forEach','filter','map'], array['for'],
$$function frequency(arr) {
  const result = {};
  for (let i = 0; i < arr.length; i++) {
    const item = arr[i];
    if (result[item] === undefined) {
      result[item] = 1;
    } else {
      result[item]++;
    }
  }
  return result;
}$$,
array['Используем объект как счётчик.', 'Если элемента ещё нет в объекте (undefined), ставим 1.', 'Иначе увеличиваем значение на 1.']),

('hard', 'Объекты', 'Самый частый элемент', 'Напиши функцию mostFrequent, которая возвращает элемент, встречающийся чаще всего. При равенстве — тот, что встретился раньше.', 'mostFrequent', 'arr',
'[{"input":[["a","b","b","a","b"]],"output":"b"},{"input":[["x","y","x","y"]],"output":"x"},{"input":[["z"]],"output":"z"}]',
array['reduce','forEach','filter','map','sort','Math.max'], array['for'],
$$function mostFrequent(arr) {
  const counts = {};
  let best = arr[0];
  for (let i = 0; i < arr.length; i++) {
    const item = arr[i];
    counts[item] = (counts[item] || 0) + 1;
  }
  for (let i = 0; i < arr.length; i++) {
    if (counts[arr[i]] > counts[best]) {
      best = arr[i];
    }
  }
  return best;
}$$,
array['Первым циклом считаем, сколько раз встречается каждый элемент.', 'Вторым циклом идём по массиву в исходном порядке и ищем элемент с наибольшим счётчиком.', 'Используем строгое >, поэтому при равенстве остаётся тот, что встретился раньше.']),

('hard', 'Объекты', 'Равны ли объекты', 'Напиши функцию shallowEqual, которая возвращает true, если у объектов одинаковые ключи и одинаковые значения (вложенности нет).', 'shallowEqual', 'a, b',
'[{"input":[{"x":1,"y":2},{"y":2,"x":1}],"output":true},{"input":[{"x":1},{"x":2}],"output":false},{"input":[{"x":1},{"x":1,"y":2}],"output":false},{"input":[{},{}],"output":true}]',
array['JSON.stringify'], array['for'],
$$function shallowEqual(a, b) {
  let countA = 0;
  for (const key in a) {
    countA++;
    if (!(key in b) || a[key] !== b[key]) {
      return false;
    }
  }
  let countB = 0;
  for (const key in b) {
    countB++;
  }
  return countA === countB;
}$$,
array['Проходим по ключам a: каждый ключ должен быть в b с тем же значением.', 'Параллельно считаем количество ключей в a.', 'Потом считаем ключи в b — если их больше, у b есть лишние ключи.', 'Объекты равны, если все проверки прошли и количество ключей совпало. Порядок ключей не важен.']),

('hard', 'Объекты', 'Сумма по категориям', 'Напиши функцию sumByCategory, которая принимает товары { category, price } и возвращает объект: категория — общая сумма.', 'sumByCategory', 'products',
'[{"input":[[{"category":"еда","price":100},{"category":"техника","price":500},{"category":"еда","price":50}]],"output":{"еда":150,"техника":500}},{"input":[[]],"output":{}}]',
array['reduce','forEach','filter','map'], array['for'],
$$function sumByCategory(products) {
  const result = {};
  for (let i = 0; i < products.length; i++) {
    const p = products[i];
    if (result[p.category] === undefined) {
      result[p.category] = 0;
    }
    result[p.category] += p.price;
  }
  return result;
}$$,
array['Создаём пустой объект для итогов.', 'Если категория встретилась впервые, начинаем её сумму с 0.', 'Прибавляем цену товара к сумме его категории.']),

('hard', 'Объекты', 'Индекс по id', 'Напиши функцию indexById, которая превращает массив { id, name } в объект, где ключ — id, а значение — name.', 'indexById', 'users',
'[{"input":[[{"id":1,"name":"A"},{"id":7,"name":"B"}]],"output":{"1":"A","7":"B"}},{"input":[[]],"output":{}}]',
array['reduce','forEach','map','Object.fromEntries'], array['for'],
$$function indexById(users) {
  const result = {};
  for (let i = 0; i < users.length; i++) {
    result[users[i].id] = users[i].name;
  }
  return result;
}$$,
array['Создаём пустой объект.', 'Для каждого пользователя пишем result[id] = name.', 'Ключи объекта всегда строки, поэтому число 1 станет ключом "1".']),

('hard', 'Объекты', 'Лучший студент', 'Напиши функцию topStudent, которая принимает массив { name, grades } и возвращает имя студента с самым высоким средним баллом.', 'topStudent', 'students',
'[{"input":[[{"name":"A","grades":[4,5]},{"name":"B","grades":[5,5]},{"name":"C","grades":[3,4]}]],"output":"B"},{"input":[[{"name":"Solo","grades":[2]}]],"output":"Solo"}]',
array['reduce','sort','Math.max','map','filter','forEach'], array['for'],
$$function topStudent(students) {
  let bestName = null;
  let bestAvg = -1;
  for (let i = 0; i < students.length; i++) {
    const grades = students[i].grades;
    let sum = 0;
    for (let j = 0; j < grades.length; j++) {
      sum += grades[j];
    }
    const avg = sum / grades.length;
    if (avg > bestAvg) {
      bestAvg = avg;
      bestName = students[i].name;
    }
  }
  return bestName;
}$$,
array['Для каждого студента вложенным циклом считаем сумму оценок.', 'Средний балл — сумма, делённая на количество оценок.', 'Если средний балл лучше текущего лучшего, запоминаем имя и балл.', 'Возвращаем имя лучшего.']),

('hard', 'Объекты', 'Сложить счётчики', 'Напиши функцию mergeCounts, которая складывает два объекта-счётчика: значения одинаковых ключей суммируются.', 'mergeCounts', 'a, b',
'[{"input":[{"x":1,"y":2},{"y":3,"z":4}],"output":{"x":1,"y":5,"z":4}},{"input":[{},{"a":1}],"output":{"a":1}}]',
array['Object.assign','...','reduce','forEach'], array['for'],
$$function mergeCounts(a, b) {
  const result = {};
  for (const key in a) {
    result[key] = a[key];
  }
  for (const key in b) {
    if (result[key] === undefined) {
      result[key] = 0;
    }
    result[key] += b[key];
  }
  return result;
}$$,
array['Сначала копируем все ключи из a.', 'Затем проходим по b: если ключа ещё нет, начинаем с 0.', 'Прибавляем значение из b.']),

('hard', 'Объекты', 'Отфильтровать объект', 'Напиши функцию filterObject, которая возвращает новый объект только с теми ключами, у которых значение не меньше min.', 'filterObject', 'obj, min',
'[{"input":[{"a":1,"b":5,"c":3},3],"output":{"b":5,"c":3}},{"input":[{"a":1},10],"output":{}}]',
array['Object.entries','Object.fromEntries','filter','reduce'], array['for'],
$$function filterObject(obj, min) {
  const result = {};
  for (const key in obj) {
    if (obj[key] >= min) {
      result[key] = obj[key];
    }
  }
  return result;
}$$,
array['Создаём пустой объект.', 'Перебираем ключи исходного объекта.', 'Копируем пару, только если значение >= min.']),

('hard', 'Объекты', 'Подсчёт типов', 'Напиши функцию countTypes, которая возвращает объект: ключ — результат typeof элемента, значение — сколько таких элементов.', 'countTypes', 'arr',
'[{"input":[[1,"a",2,true,"b"]],"output":{"number":2,"string":2,"boolean":1}},{"input":[[]],"output":{}}]',
array['reduce','forEach','filter','map'], array['for'],
$$function countTypes(arr) {
  const result = {};
  for (let i = 0; i < arr.length; i++) {
    const type = typeof arr[i];
    if (result[type] === undefined) {
      result[type] = 0;
    }
    result[type]++;
  }
  return result;
}$$,
array['typeof возвращает строку с типом: "number", "string" и т.д.', 'Используем эту строку как ключ объекта-счётчика.', 'Увеличиваем счётчик для каждого элемента.']),

('hard', 'Объекты', 'Анаграммы', 'Напиши функцию isAnagram, которая возвращает true, если две строки состоят из одних и тех же букв в том же количестве.', 'isAnagram', 'a, b',
'[{"input":["listen","silent"],"output":true},{"input":["abc","abd"],"output":false},{"input":["aab","aba"],"output":true},{"input":["ab","abb"],"output":false}]',
array['sort','split','join','reverse'], array['for'],
$$function isAnagram(a, b) {
  if (a.length !== b.length) {
    return false;
  }
  const counts = {};
  for (let i = 0; i < a.length; i++) {
    counts[a[i]] = (counts[a[i]] || 0) + 1;
  }
  for (let i = 0; i < b.length; i++) {
    if (!counts[b[i]]) {
      return false;
    }
    counts[b[i]]--;
  }
  return true;
}$$,
array['Если длины разные, это не анаграммы.', 'Считаем буквы первой строки в объекте.', 'Проходим по второй строке и уменьшаем счётчики. Если буквы нет или её счётчик уже 0 — не анаграмма.', 'Если всё сошлось, возвращаем true.']),

('hard', 'Объекты', 'Средний возраст по городам', 'Напиши функцию avgAgeByCity, которая принимает { city, age } и возвращает объект: город — средний возраст.', 'avgAgeByCity', 'users',
'[{"input":[[{"city":"Ош","age":20},{"city":"Ош","age":30},{"city":"Бишкек","age":40}]],"output":{"Ош":25,"Бишкек":40}},{"input":[[]],"output":{}}]',
array['reduce','forEach','filter','map'], array['for'],
$$function avgAgeByCity(users) {
  const sums = {};
  const counts = {};
  for (let i = 0; i < users.length; i++) {
    const { city, age } = users[i];
    sums[city] = (sums[city] || 0) + age;
    counts[city] = (counts[city] || 0) + 1;
  }
  const result = {};
  for (const city in sums) {
    result[city] = sums[city] / counts[city];
  }
  return result;
}$$,
array['Заводим два объекта: сумма возрастов и количество людей по каждому городу.', 'Первым циклом заполняем оба объекта.', 'Вторым циклом по городам делим сумму на количество.', 'Возвращаем объект средних значений.']),

('hard', 'Объекты', 'Значение по пути', 'Напиши функцию getByPath, которая по массиву ключей path достаёт вложенное значение объекта. Если пути нет — верни null.', 'getByPath', 'obj, path',
'[{"input":[{"a":{"b":{"c":5}}},["a","b","c"]],"output":5},{"input":[{"a":{"b":1}},["a","x"]],"output":null},{"input":[{"a":1},[]],"output":{"a":1}}]',
array['reduce','forEach'], array['for'],
$$function getByPath(obj, path) {
  let current = obj;
  for (let i = 0; i < path.length; i++) {
    if (current === null || typeof current !== "object" || !(path[i] in current)) {
      return null;
    }
    current = current[path[i]];
  }
  return current;
}$$,
array['Начинаем с самого объекта: current = obj.', 'На каждом шаге спускаемся на уровень глубже: current = current[path[i]].', 'Перед шагом проверяем, что current — объект и в нём есть нужный ключ. Иначе возвращаем null.', 'Если путь пустой, возвращается сам объект.']),

('hard', 'Объекты', 'Переименовать ключи', 'Напиши функцию renameKeys, которая возвращает новый объект, где ключи переименованы по объекту names ({ старый: новый }). Остальные ключи не меняются.', 'renameKeys', 'obj, names',
'[{"input":[{"a":1,"b":2},{"a":"x"}],"output":{"x":1,"b":2}},{"input":[{"a":1},{}],"output":{"a":1}}]',
array['Object.entries','Object.fromEntries','reduce','map'], array['for'],
$$function renameKeys(obj, names) {
  const result = {};
  for (const key in obj) {
    const newKey = key in names ? names[key] : key;
    result[newKey] = obj[key];
  }
  return result;
}$$,
array['Перебираем ключи исходного объекта.', 'Если для ключа есть новое имя в names, берём его, иначе оставляем старое.', 'Записываем значение под нужным ключом в новый объект.']),

('hard', 'Объекты', 'Остатки на складе', 'Напиши функцию totalByProduct, которая принимает заказы { product, qty } и возвращает объект: товар — общее количество.', 'totalByProduct', 'orders',
'[{"input":[[{"product":"чай","qty":2},{"product":"сок","qty":1},{"product":"чай","qty":3}]],"output":{"чай":5,"сок":1}},{"input":[[]],"output":{}}]',
array['reduce','forEach','filter','map'], array['for'],
$$function totalByProduct(orders) {
  const result = {};
  for (let i = 0; i < orders.length; i++) {
    const { product, qty } = orders[i];
    if (result[product] === undefined) {
      result[product] = 0;
    }
    result[product] += qty;
  }
  return result;
}$$,
array['Создаём пустой объект итогов.', 'Достаём product и qty из заказа деструктуризацией.', 'Если товар встретился впервые, начинаем с 0, и прибавляем qty.']);

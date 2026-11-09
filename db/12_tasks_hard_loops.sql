insert into tasks (level, topic, title, description, fn, params, tests, forbidden, required, solution, explanation) values
('hard', 'Циклы и условия', 'Убрать дубликаты', 'Напиши функцию removeDuplicates, которая возвращает новый массив без повторов. Порядок — по первому появлению. Без Set.', 'removeDuplicates', 'arr',
'[{"input":[[1,2,1,3,2]],"output":[1,2,3]},{"input":[["a","a"]],"output":["a"]},{"input":[[]],"output":[]},{"input":[[5,4,5,4,3]],"output":[5,4,3]}]',
array['new Set','Set(','includes','indexOf','lastIndexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function removeDuplicates(arr) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    let found = false;
    for (let j = 0; j < result.length; j++) {
      if (result[j] === arr[i]) {
        found = true;
        break;
      }
    }
    if (!found) {
      result.push(arr[i]);
    }
  }
  return result;
}$$,
array['Создаём пустой массив result для уникальных значений.', 'Для каждого элемента вложенным циклом проверяем, есть ли он уже в result.', 'Если нашли — ставим found = true и выходим из вложенного цикла через break.', 'Если не нашли, добавляем элемент. Так сохраняется порядок первого появления.']),

('hard', 'Циклы и условия', 'Второй максимум', 'Напиши функцию secondMax, которая возвращает второе по величине РАЗНОЕ число массива. Если его нет, верни null.', 'secondMax', 'arr',
'[{"input":[[1,5,3,5]],"output":3},{"input":[[10,20]],"output":10},{"input":[[7,7]],"output":null},{"input":[[-1,-5,-3]],"output":-3}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach','new Set'], array['for'],
$$function secondMax(arr) {
  let first = null;
  let second = null;
  for (let i = 0; i < arr.length; i++) {
    const n = arr[i];
    if (first === null || n > first) {
      second = first;
      first = n;
    } else if (n !== first && (second === null || n > second)) {
      second = n;
    }
  }
  return second;
}$$,
array['Храним два значения: first — максимум, second — второй максимум. Сначала оба null.', 'Если число больше first, старый first становится second, а число — новым first.', 'Если число не равно first и больше second, обновляем только second.', 'Если разных чисел меньше двух, second останется null.']),

('hard', 'Циклы и условия', 'Сортировка пузырьком', 'Напиши функцию bubbleSort, которая сортирует массив чисел по возрастанию вручную и возвращает новый массив.', 'bubbleSort', 'arr',
'[{"input":[[5,1,4,2]],"output":[1,2,4,5]},{"input":[[3,3,1]],"output":[1,3,3]},{"input":[[]],"output":[]},{"input":[[-1,-3,2]],"output":[-3,-1,2]}]',
array['sort','toSorted','Math.min','Math.max','reduce','filter','map'], array['for'],
$$function bubbleSort(arr) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    result.push(arr[i]);
  }
  for (let i = 0; i < result.length; i++) {
    for (let j = 0; j < result.length - 1 - i; j++) {
      if (result[j] > result[j + 1]) {
        const temp = result[j];
        result[j] = result[j + 1];
        result[j + 1] = temp;
      }
    }
  }
  return result;
}$$,
array['Сначала копируем массив, чтобы не менять исходный.', 'Внешний цикл повторяет проходы. После каждого прохода самый большой элемент «всплывает» в конец.', 'Внутренний цикл сравнивает соседей и меняет их местами через временную переменную, если левый больше правого.', 'Конец массива уже отсортирован, поэтому внутренний цикл каждый раз короче на i.']),

('hard', 'Циклы и условия', 'Слить отсортированные', 'Напиши функцию mergeSorted, которая сливает два отсортированных по возрастанию массива в один отсортированный.', 'mergeSorted', 'a, b',
'[{"input":[[1,3,5],[2,4,6]],"output":[1,2,3,4,5,6]},{"input":[[],[1,2]],"output":[1,2]},{"input":[[1,1],[1]],"output":[1,1,1]},{"input":[[5],[]],"output":[5]}]',
array['sort','concat','...','reduce','filter','map'], array['while'],
$$function mergeSorted(a, b) {
  const result = [];
  let i = 0;
  let j = 0;
  while (i < a.length && j < b.length) {
    if (a[i] <= b[j]) {
      result.push(a[i]);
      i++;
    } else {
      result.push(b[j]);
      j++;
    }
  }
  while (i < a.length) {
    result.push(a[i]);
    i++;
  }
  while (j < b.length) {
    result.push(b[j]);
    j++;
  }
  return result;
}$$,
array['Заводим два указателя: i для массива a и j для массива b.', 'Пока в обоих массивах есть элементы, берём меньший из a[i] и b[j] и двигаем его указатель.', 'Когда один массив закончился, дописываем остаток другого.', 'Так получаем отсортированный результат за один проход.']),

('hard', 'Циклы и условия', 'Разбить на части', 'Напиши функцию chunk, которая делит массив на подмассивы длины size. Последний может быть короче.', 'chunk', 'arr, size',
'[{"input":[[1,2,3,4,5],2],"output":[[1,2],[3,4],[5]]},{"input":[[1,2,3],3],"output":[[1,2,3]]},{"input":[[],2],"output":[]}]',
array['slice','splice','reduce','map','filter'], array['for'],
$$function chunk(arr, size) {
  const result = [];
  let current = [];
  for (let i = 0; i < arr.length; i++) {
    current.push(arr[i]);
    if (current.length === size) {
      result.push(current);
      current = [];
    }
  }
  if (current.length > 0) {
    result.push(current);
  }
  return result;
}$$,
array['Собираем текущую часть в массив current.', 'Когда в current набралось size элементов, кладём его в result и начинаем новую часть.', 'После цикла, если в current что-то осталось, добавляем последнюю неполную часть.']),

('hard', 'Циклы и условия', 'Распрямить массив', 'Напиши функцию flatten, которая превращает массив массивов в один плоский массив (вложенность — один уровень).', 'flatten', 'arr',
'[{"input":[[[1,2],[3],[4,5]]],"output":[1,2,3,4,5]},{"input":[[[],[1]]],"output":[1]},{"input":[[]],"output":[]}]',
array['flat','flatMap','concat','...','reduce','map','forEach'], array['for'],
$$function flatten(arr) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < arr[i].length; j++) {
      result.push(arr[i][j]);
    }
  }
  return result;
}$$,
array['Внешний цикл перебирает вложенные массивы.', 'Внутренний цикл перебирает элементы каждого вложенного массива.', 'Каждый элемент добавляем в общий result.']),

('hard', 'Циклы и условия', 'Пересечение массивов', 'Напиши функцию intersection, которая возвращает элементы, которые есть в обоих массивах. Без повторов, в порядке массива a.', 'intersection', 'a, b',
'[{"input":[[1,2,3,4],[2,4,6]],"output":[2,4]},{"input":[[1,1,2],[1]],"output":[1]},{"input":[[1,2],[3]],"output":[]}]',
array['includes','indexOf','filter','map','reduce','find','some','every','forEach','new Set'], array['for'],
$$function intersection(a, b) {
  const result = [];
  for (let i = 0; i < a.length; i++) {
    let inB = false;
    for (let j = 0; j < b.length; j++) {
      if (a[i] === b[j]) {
        inB = true;
        break;
      }
    }
    let inResult = false;
    for (let k = 0; k < result.length; k++) {
      if (result[k] === a[i]) {
        inResult = true;
        break;
      }
    }
    if (inB && !inResult) {
      result.push(a[i]);
    }
  }
  return result;
}$$,
array['Перебираем элементы массива a.', 'Вложенным циклом проверяем, есть ли элемент в b.', 'Ещё одним циклом проверяем, не добавляли ли мы его уже в result.', 'Добавляем элемент, только если он есть в b и его ещё нет в result.']),

('hard', 'Циклы и условия', 'Пары с суммой', 'Напиши функцию countPairs, которая возвращает количество пар элементов (с разными индексами i < j), сумма которых равна target.', 'countPairs', 'arr, target',
'[{"input":[[1,2,3,4],5],"output":2},{"input":[[1,1,1],2],"output":3},{"input":[[1,2],10],"output":0}]',
array['filter','map','reduce','forEach','includes','indexOf'], array['for'],
$$function countPairs(arr, target) {
  let count = 0;
  for (let i = 0; i < arr.length; i++) {
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[i] + arr[j] === target) {
        count++;
      }
    }
  }
  return count;
}$$,
array['Внешний цикл выбирает первый элемент пары i.', 'Внутренний цикл начинается с i + 1, чтобы не брать элемент дважды и не считать пару повторно.', 'Если сумма равна target, увеличиваем счётчик.']),

('hard', 'Циклы и условия', 'Сдвиг влево', 'Напиши функцию rotateLeft, которая сдвигает массив влево на k позиций: [1,2,3,4], k=1 → [2,3,4,1]. k может быть больше длины.', 'rotateLeft', 'arr, k',
'[{"input":[[1,2,3,4],1],"output":[2,3,4,1]},{"input":[[1,2,3],5],"output":[3,1,2]},{"input":[[1,2],0],"output":[1,2]},{"input":[[],3],"output":[]}]',
array['slice','splice','shift','concat','...','reverse'], array['for'],
$$function rotateLeft(arr, k) {
  const result = [];
  const n = arr.length;
  for (let i = 0; i < n; i++) {
    result.push(arr[(i + k) % n]);
  }
  return result;
}$$,
array['Элемент, который окажется на позиции i, раньше стоял на позиции i + k.', 'Если i + k выходит за конец массива, остаток от деления % n «заворачивает» индекс в начало.', 'Это же решает случай, когда k больше длины массива.']),

('hard', 'Циклы и условия', 'Простое число', 'Напиши функцию isPrime, которая возвращает true, если n — простое число (делится только на 1 и на себя).', 'isPrime', 'n',
'[{"input":[7],"output":true},{"input":[1],"output":false},{"input":[2],"output":true},{"input":[9],"output":false},{"input":[29],"output":true}]',
array['filter','some','every','reduce'], array['for'],
$$function isPrime(n) {
  if (n < 2) {
    return false;
  }
  for (let i = 2; i * i <= n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}$$,
array['Числа меньше 2 не простые.', 'Проверяем делители от 2. Достаточно до корня из n: условие i * i <= n.', 'Если нашли делитель без остатка, число составное.', 'Если делителей нет, число простое.']),

('hard', 'Циклы и условия', 'Простые до n', 'Напиши функцию primesUpTo, которая возвращает массив всех простых чисел от 2 до n включительно.', 'primesUpTo', 'n',
'[{"input":[10],"output":[2,3,5,7]},{"input":[2],"output":[2]},{"input":[1],"output":[]}]',
array['filter','some','every','reduce','map'], array['for'],
$$function primesUpTo(n) {
  const result = [];
  for (let num = 2; num <= n; num++) {
    let prime = true;
    for (let i = 2; i * i <= num; i++) {
      if (num % i === 0) {
        prime = false;
        break;
      }
    }
    if (prime) {
      result.push(num);
    }
  }
  return result;
}$$,
array['Перебираем все числа от 2 до n.', 'Для каждого числа вложенным циклом ищем делитель до корня из числа.', 'Если делитель не нашёлся, число простое — добавляем его в результат.']),

('hard', 'Циклы и условия', 'Числа Фибоначчи', 'Напиши функцию fibonacci, которая возвращает первые n чисел Фибоначчи, начиная с 0 и 1.', 'fibonacci', 'n',
'[{"input":[5],"output":[0,1,1,2,3]},{"input":[1],"output":[0]},{"input":[0],"output":[]},{"input":[8],"output":[0,1,1,2,3,5,8,13]}]',
array['reduce','map'], array['for'],
$$function fibonacci(n) {
  const result = [];
  for (let i = 0; i < n; i++) {
    if (i < 2) {
      result.push(i);
    } else {
      result.push(result[i - 1] + result[i - 2]);
    }
  }
  return result;
}$$,
array['Первые два числа — 0 и 1, их добавляем как есть (i < 2).', 'Каждое следующее число — сумма двух предыдущих: result[i - 1] + result[i - 2].', 'Цикл выполняется ровно n раз.']),

('hard', 'Циклы и условия', 'Пропущенное число', 'Массив содержит числа от 1 до n в любом порядке, одного числа не хватает. Напиши функцию missingNumber, которая его находит.', 'missingNumber', 'arr, n',
'[{"input":[[1,2,4,5],5],"output":3},{"input":[[2,3],3],"output":1},{"input":[[1],2],"output":2}]',
array['includes','indexOf','filter','sort','reduce','find','some','every'], array['for'],
$$function missingNumber(arr, n) {
  let expected = 0;
  for (let i = 1; i <= n; i++) {
    expected += i;
  }
  let actual = 0;
  for (let i = 0; i < arr.length; i++) {
    actual += arr[i];
  }
  return expected - actual;
}$$,
array['Считаем, какой должна быть сумма чисел от 1 до n.', 'Считаем фактическую сумму элементов массива.', 'Разница между ними и есть пропущенное число.']),

('hard', 'Циклы и условия', 'Самая длинная серия', 'Напиши функцию longestRun, которая возвращает длину самой длинной серии одинаковых чисел, идущих подряд.', 'longestRun', 'arr',
'[{"input":[[1,1,2,2,2,3]],"output":3},{"input":[[1,2,3]],"output":1},{"input":[[]],"output":0},{"input":[[4,4,4,4]],"output":4}]',
array['Math.max','reduce','filter','map','sort'], array['for'],
$$function longestRun(arr) {
  if (arr.length === 0) {
    return 0;
  }
  let best = 1;
  let current = 1;
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] === arr[i - 1]) {
      current++;
    } else {
      current = 1;
    }
    if (current > best) {
      best = current;
    }
  }
  return best;
}$$,
array['Для пустого массива сразу возвращаем 0.', 'current — длина текущей серии, best — самая длинная из найденных.', 'Если элемент равен предыдущему, серия продолжается, иначе начинается новая с длиной 1.', 'После каждого шага обновляем best.']),

('hard', 'Циклы и условия', 'Сумма цифр', 'Напиши функцию sumDigits, которая возвращает сумму цифр неотрицательного целого числа. Без превращения в строку.', 'sumDigits', 'n',
'[{"input":[123],"output":6},{"input":[0],"output":0},{"input":[9045],"output":18}]',
array['String','toString','split','reduce','+ ""','`'], array['while'],
$$function sumDigits(n) {
  let sum = 0;
  while (n > 0) {
    sum += n % 10;
    n = Math.floor(n / 10);
  }
  return sum;
}$$,
array['Последняя цифра числа — остаток от деления на 10: n % 10.', 'Прибавляем её к сумме и отрезаем: n = Math.floor(n / 10).', 'Повторяем, пока число больше 0.']),

('hard', 'Циклы и условия', 'Сумма матрицы', 'Напиши функцию matrixSum, которая возвращает сумму всех чисел двумерного массива.', 'matrixSum', 'matrix',
'[{"input":[[[1,2],[3,4]]],"output":10},{"input":[[[5]]],"output":5},{"input":[[[],[1,2,3]]],"output":6}]',
array['flat','reduce','map','forEach'], array['for'],
$$function matrixSum(matrix) {
  let sum = 0;
  for (let i = 0; i < matrix.length; i++) {
    for (let j = 0; j < matrix[i].length; j++) {
      sum += matrix[i][j];
    }
  }
  return sum;
}$$,
array['Внешний цикл перебирает строки матрицы.', 'Внутренний цикл перебирает элементы строки.', 'Элемент берём как matrix[i][j] и прибавляем к сумме.']),

('hard', 'Циклы и условия', 'Сумма диагонали', 'Напиши функцию diagonalSum, которая возвращает сумму главной диагонали квадратной матрицы (элементы [0][0], [1][1] и т.д.).', 'diagonalSum', 'matrix',
'[{"input":[[[1,2],[3,4]]],"output":5},{"input":[[[1,2,3],[4,5,6],[7,8,9]]],"output":15},{"input":[[[7]]],"output":7}]',
array['reduce','map','forEach','flat'], array['for'],
$$function diagonalSum(matrix) {
  let sum = 0;
  for (let i = 0; i < matrix.length; i++) {
    sum += matrix[i][i];
  }
  return sum;
}$$,
array['На главной диагонали номер строки равен номеру столбца.', 'Поэтому достаточно одного цикла и обращения matrix[i][i].', 'Складываем эти элементы.']),

('hard', 'Циклы и условия', 'Разность массивов', 'Напиши функцию difference, которая возвращает элементы массива a, которых нет в массиве b.', 'difference', 'a, b',
'[{"input":[[1,2,3,4],[2,4]],"output":[1,3]},{"input":[[1,2],[]],"output":[1,2]},{"input":[[1,1,5],[5]],"output":[1,1]}]',
array['includes','indexOf','filter','map','reduce','find','some','every','forEach','new Set'], array['for'],
$$function difference(a, b) {
  const result = [];
  for (let i = 0; i < a.length; i++) {
    let inB = false;
    for (let j = 0; j < b.length; j++) {
      if (a[i] === b[j]) {
        inB = true;
        break;
      }
    }
    if (!inB) {
      result.push(a[i]);
    }
  }
  return result;
}$$,
array['Перебираем элементы массива a.', 'Вложенным циклом проверяем, есть ли элемент в b.', 'Если его нет в b, добавляем в результат. Повторы из a сохраняются.']);

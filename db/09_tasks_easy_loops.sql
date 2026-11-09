insert into tasks (level, topic, title, description, fn, params, tests, forbidden, required, solution, explanation) values
('easy', 'Циклы и условия', 'Сумма чисел', 'Напиши функцию sumArray, которая принимает массив чисел и возвращает их сумму.', 'sumArray', 'arr',
'[{"input":[[1,2,3]],"output":6},{"input":[[10,-5,5]],"output":10},{"input":[[]],"output":0},{"input":[[7]],"output":7}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function sumArray(arr) {
  let sum = 0;
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  return sum;
}$$,
array['Заводим переменную sum = 0, в ней будем копить сумму.', 'Проходим циклом for по всем элементам массива.', 'На каждом шаге прибавляем текущий элемент к sum.', 'После цикла возвращаем sum. Для пустого массива цикл не выполнится, и вернётся 0.']),

('easy', 'Циклы и условия', 'Самое большое число', 'Напиши функцию findMax, которая возвращает самое большое число в массиве. Массив не пустой.', 'findMax', 'arr',
'[{"input":[[12,5,89,34,7,61]],"output":89},{"input":[[-3,-1,-7]],"output":-1},{"input":[[4]],"output":4},{"input":[[2,9,9,1]],"output":9}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function findMax(arr) {
  let max = arr[0];
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] > max) {
      max = arr[i];
    }
  }
  return max;
}$$,
array['Берём первый элемент как текущий максимум. Брать 0 нельзя: в массиве могут быть только отрицательные числа.', 'Идём циклом со второго элемента до конца.', 'Если текущий элемент больше max, запоминаем его как новый max.', 'После цикла в max лежит самое большое число.']),

('easy', 'Циклы и условия', 'Самое маленькое число', 'Напиши функцию findMin, которая возвращает самое маленькое число в массиве. Массив не пустой.', 'findMin', 'arr',
'[{"input":[[12,5,89,34]],"output":5},{"input":[[-3,-1,-7]],"output":-7},{"input":[[0]],"output":0},{"input":[[3,3,2,8]],"output":2}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function findMin(arr) {
  let min = arr[0];
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] < min) {
      min = arr[i];
    }
  }
  return min;
}$$,
array['Первый элемент считаем текущим минимумом.', 'Проходим по остальным элементам циклом for.', 'Если элемент меньше min, обновляем min.', 'Возвращаем min после цикла.']),

('easy', 'Циклы и условия', 'Сколько чётных', 'Напиши функцию countEven, которая возвращает количество чётных чисел в массиве.', 'countEven', 'arr',
'[{"input":[[1,2,3,4,6]],"output":3},{"input":[[1,3,5]],"output":0},{"input":[[]],"output":0},{"input":[[0,-2,7]],"output":2}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function countEven(arr) {
  let count = 0;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] % 2 === 0) {
      count++;
    }
  }
  return count;
}$$,
array['Заводим счётчик count = 0.', 'Проходим по массиву циклом for.', 'Число чётное, если остаток от деления на 2 равен 0: arr[i] % 2 === 0. Тогда увеличиваем count.', 'Возвращаем count.']),

('easy', 'Циклы и условия', 'Сумма чётных', 'Напиши функцию sumEven, которая возвращает сумму только чётных чисел массива.', 'sumEven', 'arr',
'[{"input":[[1,2,3,4]],"output":6},{"input":[[1,3,5]],"output":0},{"input":[[10,-2,7]],"output":8},{"input":[[]],"output":0}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function sumEven(arr) {
  let sum = 0;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] % 2 === 0) {
      sum += arr[i];
    }
  }
  return sum;
}$$,
array['Заводим sum = 0.', 'Перебираем элементы циклом for.', 'Проверяем чётность через arr[i] % 2 === 0 и прибавляем к sum только чётные.', 'Возвращаем sum.']),

('easy', 'Циклы и условия', 'Положительные числа', 'Напиши функцию countPositive, которая возвращает количество чисел больше нуля.', 'countPositive', 'arr',
'[{"input":[[1,-2,3,0]],"output":2},{"input":[[-1,-2]],"output":0},{"input":[[5,5,5]],"output":3},{"input":[[]],"output":0}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function countPositive(arr) {
  let count = 0;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] > 0) {
      count++;
    }
  }
  return count;
}$$,
array['Счётчик count начинаем с 0.', 'Проходим по массиву циклом.', 'Если число строго больше 0, увеличиваем счётчик. Ноль не считается положительным.', 'Возвращаем count.']),

('easy', 'Циклы и условия', 'Среднее значение', 'Напиши функцию average, которая возвращает среднее арифметическое чисел массива. Массив не пустой.', 'average', 'arr',
'[{"input":[[2,4,6]],"output":4},{"input":[[5]],"output":5},{"input":[[1,2]],"output":1.5},{"input":[[-2,2,3]],"output":1}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function average(arr) {
  let sum = 0;
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i];
  }
  return sum / arr.length;
}$$,
array['Сначала считаем сумму всех элементов циклом for.', 'Среднее — это сумма, делённая на количество элементов.', 'Возвращаем sum / arr.length.']),

('easy', 'Циклы и условия', 'Разворот массива', 'Напиши функцию reverseArray, которая возвращает новый массив с элементами в обратном порядке.', 'reverseArray', 'arr',
'[{"input":[[1,2,3]],"output":[3,2,1]},{"input":[["a","b"]],"output":["b","a"]},{"input":[[]],"output":[]},{"input":[[5]],"output":[5]}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function reverseArray(arr) {
  const result = [];
  for (let i = arr.length - 1; i >= 0; i--) {
    result.push(arr[i]);
  }
  return result;
}$$,
array['Создаём пустой массив result.', 'Запускаем цикл с последнего индекса arr.length - 1 до 0.', 'Каждый элемент добавляем в result через push.', 'Возвращаем result — исходный массив не меняется.']),

('easy', 'Циклы и условия', 'Есть ли элемент', 'Напиши функцию contains, которая возвращает true, если в массиве есть значение x, и false, если нет.', 'contains', 'arr, x',
'[{"input":[[1,2,3],2],"output":true},{"input":[[1,2,3],5],"output":false},{"input":[[],1],"output":false},{"input":[["a","b"],"b"],"output":true}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function contains(arr, x) {
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === x) {
      return true;
    }
  }
  return false;
}$$,
array['Проходим по массиву циклом for.', 'Если нашли элемент, равный x, сразу возвращаем true — дальше искать не нужно.', 'Если цикл закончился и ничего не нашли, возвращаем false.']),

('easy', 'Циклы и условия', 'Индекс элемента', 'Напиши функцию findIndexOf, которая возвращает индекс первого вхождения x в массив или -1, если x нет.', 'findIndexOf', 'arr, x',
'[{"input":[[5,7,9],7],"output":1},{"input":[[5,7,9],4],"output":-1},{"input":[[1,2,1],1],"output":0},{"input":[[],3],"output":-1}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach','findIndex'], array['for'],
$$function findIndexOf(arr, x) {
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === x) {
      return i;
    }
  }
  return -1;
}$$,
array['Перебираем индексы массива циклом for.', 'Как только arr[i] === x, возвращаем i — это первое вхождение.', 'Если цикл прошёл весь массив, значит x нет — возвращаем -1.']),

('easy', 'Циклы и условия', 'Удвоить элементы', 'Напиши функцию doubleAll, которая возвращает новый массив, где каждое число умножено на 2.', 'doubleAll', 'arr',
'[{"input":[[1,2,3]],"output":[2,4,6]},{"input":[[-1,0]],"output":[-2,0]},{"input":[[]],"output":[]}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function doubleAll(arr) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    result.push(arr[i] * 2);
  }
  return result;
}$$,
array['Создаём пустой массив result.', 'В цикле for берём каждый элемент и умножаем на 2.', 'Результат добавляем в result через push.', 'Возвращаем result.']),

('easy', 'Циклы и условия', 'Только положительные', 'Напиши функцию onlyPositive, которая возвращает новый массив только из чисел больше нуля.', 'onlyPositive', 'arr',
'[{"input":[[1,-2,3,0]],"output":[1,3]},{"input":[[-1,-2]],"output":[]},{"input":[[4,5]],"output":[4,5]}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function onlyPositive(arr) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] > 0) {
      result.push(arr[i]);
    }
  }
  return result;
}$$,
array['Создаём пустой массив result.', 'Проходим по массиву циклом.', 'Если число больше 0, добавляем его в result.', 'Возвращаем result.']),

('easy', 'Циклы и условия', 'Сколько раз встречается', 'Напиши функцию countItem, которая возвращает, сколько раз значение x встречается в массиве.', 'countItem', 'arr, x',
'[{"input":[[1,2,1,3,1],1],"output":3},{"input":[[1,2,3],5],"output":0},{"input":[["a","b","a"],"a"],"output":2}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function countItem(arr, x) {
  let count = 0;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === x) {
      count++;
    }
  }
  return count;
}$$,
array['Счётчик count = 0.', 'Перебираем массив циклом for.', 'Если элемент строго равен x, увеличиваем count.', 'Возвращаем count.']),

('easy', 'Циклы и условия', 'Отсортирован ли массив', 'Напиши функцию isSorted, которая возвращает true, если числа идут по возрастанию (каждое не меньше предыдущего).', 'isSorted', 'arr',
'[{"input":[[1,2,2,5]],"output":true},{"input":[[3,1,2]],"output":false},{"input":[[]],"output":true},{"input":[[7]],"output":true}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function isSorted(arr) {
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] < arr[i - 1]) {
      return false;
    }
  }
  return true;
}$$,
array['Сравниваем каждый элемент с предыдущим, поэтому цикл начинаем с индекса 1.', 'Если текущий элемент меньше предыдущего, порядок нарушен — возвращаем false.', 'Если нарушений не нашли, возвращаем true. Пустой массив и массив из одного элемента считаются отсортированными.']),

('easy', 'Циклы и условия', 'Одинаковые массивы', 'Напиши функцию arraysEqual, которая возвращает true, если два массива содержат одинаковые элементы в одинаковом порядке.', 'arraysEqual', 'a, b',
'[{"input":[[1,2,3],[1,2,3]],"output":true},{"input":[[1,2,3],[1,3,2]],"output":false},{"input":[[1,2],[1,2,3]],"output":false},{"input":[[],[]],"output":true}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach','JSON.stringify','join'], array['for'],
$$function arraysEqual(a, b) {
  if (a.length !== b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) {
      return false;
    }
  }
  return true;
}$$,
array['Если длины разные, массивы точно не равны — сразу возвращаем false.', 'Сравниваем элементы попарно по одинаковым индексам.', 'При первом несовпадении возвращаем false.', 'Если все элементы совпали, возвращаем true.']),

('easy', 'Циклы и условия', 'Произведение чисел', 'Напиши функцию multiplyAll, которая возвращает произведение всех чисел массива. Для пустого массива верни 1.', 'multiplyAll', 'arr',
'[{"input":[[2,3,4]],"output":24},{"input":[[5]],"output":5},{"input":[[]],"output":1},{"input":[[-2,3]],"output":-6}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function multiplyAll(arr) {
  let result = 1;
  for (let i = 0; i < arr.length; i++) {
    result *= arr[i];
  }
  return result;
}$$,
array['Для произведения начальное значение 1, а не 0: умножение на 0 обнулит результат.', 'В цикле умножаем result на каждый элемент.', 'Возвращаем result. Для пустого массива останется 1.']),

('easy', 'Циклы и условия', 'Числа от 1 до n', 'Напиши функцию range, которая возвращает массив чисел от 1 до n включительно.', 'range', 'n',
'[{"input":[5],"output":[1,2,3,4,5]},{"input":[1],"output":[1]},{"input":[0],"output":[]}]',
array['Array.from','fill','keys','map'], array['for'],
$$function range(n) {
  const result = [];
  for (let i = 1; i <= n; i++) {
    result.push(i);
  }
  return result;
}$$,
array['Создаём пустой массив.', 'Цикл идёт от 1 до n включительно, поэтому условие i <= n.', 'Каждое i добавляем через push.', 'Если n = 0, цикл не выполнится и вернётся пустой массив.']),

('easy', 'Циклы и условия', 'FizzBuzz', 'Напиши функцию fizzBuzz: если n делится на 3 и на 5 — верни "FizzBuzz", только на 3 — "Fizz", только на 5 — "Buzz", иначе верни число строкой.', 'fizzBuzz', 'n',
'[{"input":[15],"output":"FizzBuzz"},{"input":[9],"output":"Fizz"},{"input":[10],"output":"Buzz"},{"input":[7],"output":"7"}]',
array[]::text[], array['if'],
$$function fizzBuzz(n) {
  if (n % 15 === 0) {
    return "FizzBuzz";
  } else if (n % 3 === 0) {
    return "Fizz";
  } else if (n % 5 === 0) {
    return "Buzz";
  } else {
    return String(n);
  }
}$$,
array['Сначала проверяем делимость сразу на 3 и на 5 (то есть на 15). Если проверить 3 первой, до FizzBuzz мы никогда не дойдём.', 'Потом проверяем делимость на 3, затем на 5.', 'Во всех остальных случаях превращаем число в строку через String(n).']),

('easy', 'Циклы и условия', 'Оценка по баллам', 'Напиши функцию grade: 90 и больше — "A", от 75 — "B", от 60 — "C", меньше 60 — "F".', 'grade', 'score',
'[{"input":[95],"output":"A"},{"input":[90],"output":"A"},{"input":[80],"output":"B"},{"input":[60],"output":"C"},{"input":[42],"output":"F"}]',
array[]::text[], array['if'],
$$function grade(score) {
  if (score >= 90) {
    return "A";
  } else if (score >= 75) {
    return "B";
  } else if (score >= 60) {
    return "C";
  } else {
    return "F";
  }
}$$,
array['Проверяем условия от большего к меньшему.', 'Если score >= 90 — "A". Иначе проверяем >= 75 — "B".', 'Затем >= 60 — "C".', 'Если ни одно условие не сработало — "F".']),

('easy', 'Циклы и условия', 'Чётное или нет', 'Напиши функцию isEven, которая возвращает true для чётного числа и false для нечётного.', 'isEven', 'n',
'[{"input":[4],"output":true},{"input":[7],"output":false},{"input":[0],"output":true},{"input":[-3],"output":false}]',
array[]::text[], array['if'],
$$function isEven(n) {
  if (n % 2 === 0) {
    return true;
  } else {
    return false;
  }
}$$,
array['Число чётное, если делится на 2 без остатка.', 'Проверяем n % 2 === 0 через if.', 'Возвращаем true или false.']),

('easy', 'Циклы и условия', 'Наибольшее из трёх', 'Напиши функцию maxOfThree, которая возвращает наибольшее из трёх чисел a, b и c.', 'maxOfThree', 'a, b, c',
'[{"input":[1,5,3],"output":5},{"input":[9,2,4],"output":9},{"input":[-1,-5,-2],"output":-1},{"input":[7,7,1],"output":7}]',
array['Math.max','sort'], array['if'],
$$function maxOfThree(a, b, c) {
  let max = a;
  if (b > max) {
    max = b;
  }
  if (c > max) {
    max = c;
  }
  return max;
}$$,
array['Считаем, что a — наибольшее.', 'Если b больше, теперь максимум — b.', 'Если c больше текущего максимума, максимум — c.', 'Возвращаем max.']),

('easy', 'Циклы и условия', 'Последний элемент', 'Напиши функцию lastItem, которая возвращает последний элемент массива или null, если массив пустой.', 'lastItem', 'arr',
'[{"input":[[1,2,3]],"output":3},{"input":[["x"]],"output":"x"},{"input":[[]],"output":null}]',
array['at','pop','slice','reverse'], array['if'],
$$function lastItem(arr) {
  if (arr.length === 0) {
    return null;
  }
  return arr[arr.length - 1];
}$$,
array['Сначала проверяем, пустой ли массив. Если да — возвращаем null.', 'Индекс последнего элемента всегда arr.length - 1.', 'Возвращаем arr[arr.length - 1].']),

('easy', 'Циклы и условия', 'Сумма диапазона', 'Напиши функцию sumRange, которая возвращает сумму всех целых чисел от a до b включительно (a <= b).', 'sumRange', 'a, b',
'[{"input":[1,5],"output":15},{"input":[3,3],"output":3},{"input":[-2,2],"output":0}]',
array['reduce'], array['for'],
$$function sumRange(a, b) {
  let sum = 0;
  for (let i = a; i <= b; i++) {
    sum += i;
  }
  return sum;
}$$,
array['Заводим sum = 0.', 'Цикл начинаем с a и идём до b включительно.', 'Прибавляем каждое i к сумме.', 'Возвращаем sum.']),

('easy', 'Циклы и условия', 'Отрицательные числа', 'Напиши функцию countNegative, которая возвращает количество отрицательных чисел в массиве.', 'countNegative', 'arr',
'[{"input":[[1,-2,-3,0]],"output":2},{"input":[[1,2]],"output":0},{"input":[[-1]],"output":1}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function countNegative(arr) {
  let count = 0;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] < 0) {
      count++;
    }
  }
  return count;
}$$,
array['Счётчик начинаем с 0.', 'Перебираем элементы циклом.', 'Если число меньше 0, увеличиваем счётчик.', 'Возвращаем count.']),

('easy', 'Циклы и условия', 'Первое отрицательное', 'Напиши функцию firstNegative, которая возвращает первое отрицательное число массива или null, если таких нет.', 'firstNegative', 'arr',
'[{"input":[[3,-1,-5]],"output":-1},{"input":[[1,2,3]],"output":null},{"input":[[-4]],"output":-4}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function firstNegative(arr) {
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] < 0) {
      return arr[i];
    }
  }
  return null;
}$$,
array['Идём по массиву с начала.', 'Как только встретили число меньше 0, сразу возвращаем его.', 'Если цикл закончился без находки, возвращаем null.']),

('easy', 'Циклы и условия', 'Квадраты чисел', 'Напиши функцию squares, которая возвращает новый массив из квадратов чисел.', 'squares', 'arr',
'[{"input":[[1,2,3]],"output":[1,4,9]},{"input":[[-2,0]],"output":[4,0]},{"input":[[]],"output":[]}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach','Math.pow'], array['for'],
$$function squares(arr) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    result.push(arr[i] * arr[i]);
  }
  return result;
}$$,
array['Создаём пустой массив.', 'Квадрат числа — это число, умноженное само на себя: arr[i] * arr[i].', 'Добавляем каждый квадрат через push и возвращаем массив.']),

('easy', 'Циклы и условия', 'Соединить через дефис', 'Напиши функцию joinWithDash, которая соединяет строки массива в одну строку через "-". Для пустого массива верни "".', 'joinWithDash', 'arr',
'[{"input":[["a","b","c"]],"output":"a-b-c"},{"input":[["one"]],"output":"one"},{"input":[[]],"output":""}]',
array['join','reduce','map','forEach','toString'], array['for'],
$$function joinWithDash(arr) {
  let result = "";
  for (let i = 0; i < arr.length; i++) {
    if (i > 0) {
      result += "-";
    }
    result += arr[i];
  }
  return result;
}$$,
array['Начинаем с пустой строки.', 'Перед каждым элементом, кроме первого (i > 0), добавляем дефис.', 'Затем добавляем сам элемент.', 'Так дефис окажется только между элементами, а не в начале или конце.']),

('easy', 'Циклы и условия', 'Больше чем x', 'Напиши функцию countGreater, которая возвращает, сколько чисел массива строго больше x.', 'countGreater', 'arr, x',
'[{"input":[[1,5,8,10],5],"output":2},{"input":[[1,2],10],"output":0},{"input":[[3,3,3],2],"output":3}]',
array['Math.max','Math.min','sort','reverse','includes','indexOf','filter','map','reduce','find','some','every','forEach'], array['for'],
$$function countGreater(arr, x) {
  let count = 0;
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] > x) {
      count++;
    }
  }
  return count;
}$$,
array['Счётчик начинаем с 0.', 'Перебираем массив циклом.', 'Строго больше значит arr[i] > x — равные не считаем.', 'Возвращаем счётчик.']),

('easy', 'Циклы и условия', 'Модули чисел', 'Напиши функцию absValues, которая возвращает новый массив, где все числа заменены на их модуль (отрицательные становятся положительными).', 'absValues', 'arr',
'[{"input":[[-1,2,-3]],"output":[1,2,3]},{"input":[[0,-0.5]],"output":[0,0.5]},{"input":[[]],"output":[]}]',
array['Math.abs','map','forEach'], array['for'],
$$function absValues(arr) {
  const result = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] < 0) {
      result.push(-arr[i]);
    } else {
      result.push(arr[i]);
    }
  }
  return result;
}$$,
array['Создаём пустой массив.', 'Если число отрицательное, меняем знак: -arr[i].', 'Иначе добавляем число как есть.', 'Возвращаем новый массив.']),

('easy', 'Циклы и условия', 'Факториал', 'Напиши функцию factorial, которая возвращает факториал числа n (произведение чисел от 1 до n). Факториал 0 равен 1.', 'factorial', 'n',
'[{"input":[5],"output":120},{"input":[1],"output":1},{"input":[0],"output":1},{"input":[3],"output":6}]',
array['reduce'], array['for'],
$$function factorial(n) {
  let result = 1;
  for (let i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
}$$,
array['Начинаем с result = 1.', 'Умножаем result на все числа от 2 до n.', 'Для 0 и 1 цикл не выполнится, и вернётся 1 — это правильно.']);

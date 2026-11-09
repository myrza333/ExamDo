interface ITopic {
  topic: string;
}

export const shuffle = <T>(items: T[]) => {
  const result = [...items];
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [result[i], result[j]] = [result[j] as T, result[i] as T];
  }
  return result;
};

export const pickByTopic = <T extends ITopic>(
  items: T[],
  count: number,
  maxPerTopic: number,
) => {
  const picked: T[] = [];
  const perTopic = new Map<string, number>();
  for (const el of items) {
    if (picked.length === count) break;
    const taken = perTopic.get(el.topic) ?? 0;
    if (taken >= maxPerTopic) continue;
    perTopic.set(el.topic, taken + 1);
    picked.push(el);
  }
  return picked;
};

export const mixTopics = <T extends ITopic>(items: T[]) => {
  const groups = new Map<string, T[]>();
  for (const el of items) {
    groups.set(el.topic, [...(groups.get(el.topic) ?? []), el]);
  }

  const result: T[] = [];
  let last = "";
  while (result.length < items.length) {
    const left = items.length - result.length;
    const topics = [...groups.keys()].filter((t) => groups.get(t)?.length);
    const biggest = topics.reduce((a, b) =>
      (groups.get(b)?.length ?? 0) > (groups.get(a)?.length ?? 0) ? b : a,
    );
    const others = topics.filter((t) => t !== last);

    let topic: string;
    if (biggest !== last && (groups.get(biggest)?.length ?? 0) * 2 >= left + 1) {
      topic = biggest;
    } else if (others.length) {
      topic = others[Math.floor(Math.random() * others.length)] as string;
    } else {
      topic = last;
    }

    result.push(groups.get(topic)?.shift() as T);
    last = topic;
  }
  return result;
};

const ttl = 10 * 60 * 1000;
const store = new Map<string, { time: number; value: Promise<unknown> }>();

export const cached = <T>(key: string, loader: () => Promise<T>) => {
  const item = store.get(key);
  if (item && Date.now() - item.time < ttl) return item.value as Promise<T>;

  const value = loader().catch((error) => {
    store.delete(key);
    throw error;
  });
  store.set(key, { time: Date.now(), value });
  return value;
};

import { useQuery, useQueryClient } from "@tanstack/react-query";
import { IProgress } from "../types/type";

type TStage = "exam" | "practice";

const start: Record<TStage, IProgress> = {
  exam: { answered: 0, total: 15, finished: false },
  practice: { answered: 0, total: 5, finished: false, title: "" },
};

export const useProgress = (stage: TStage) =>
  useQuery({
    queryKey: ["progress", stage],
    queryFn: () => start[stage],
    initialData: start[stage],
    staleTime: Infinity,
  });

export const useSetProgress = (stage: TStage) => {
  const queryClient = useQueryClient();
  return (progress: IProgress) =>
    queryClient.setQueryData(["progress", stage], progress);
};

import { useQuery } from "@tanstack/react-query";
import { api } from "../api/api";
import { ITask, TLevel } from "../types/type";

export const useGetTasks = (level: TLevel) =>
  useQuery({
    queryKey: ["tasks", level],
    queryFn: async () => {
      const response = await api.get<{ message: string; data: ITask[] }>(
        `/tasks/random?level=${level}`,
      );
      return response.data.data;
    },
    staleTime: Infinity,
    refetchOnWindowFocus: false,
    refetchOnReconnect: false,
  });

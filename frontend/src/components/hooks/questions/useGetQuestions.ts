import { useQuery } from "@tanstack/react-query";
import { api } from "../api/api";
import { IQuestion } from "../types/type";

export const useGetQuestions = () =>
  useQuery({
    queryKey: ["questions"],
    queryFn: async () => {
      const response = await api.get<{ message: string; data: IQuestion[] }>(
        "/questions/random",
      );
      return response.data.data;
    },
    staleTime: Infinity,
    refetchOnWindowFocus: false,
    refetchOnReconnect: false,
  });

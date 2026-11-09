import { useMutation } from "@tanstack/react-query";
import { api } from "../api/api";
import { ISolution } from "../types/type";

export const useGetSolution = () =>
  useMutation({
    mutationKey: ["getSolution"],
    mutationFn: async (id: number) => {
      const response = await api.get<{ message: string; data: ISolution }>(
        `/tasks/${id}/solution`,
      );
      return response.data.data;
    },
  });

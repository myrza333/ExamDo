import { useMutation } from "@tanstack/react-query";
import { api } from "../api/api";
import { ICheckBody, ICheckResult } from "../types/type";

export const useCheckAnswer = () =>
  useMutation({
    mutationKey: ["checkAnswer"],
    mutationFn: async (body: ICheckBody) => {
      const response = await api.post<{ message: string; data: ICheckResult }>(
        "/questions/check",
        body,
      );
      return response.data.data;
    },
  });

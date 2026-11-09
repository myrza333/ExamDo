import { useMutation, useQueryClient } from "@tanstack/react-query";
import { api } from "../api/api";
import { IGuest } from "../types/type";

export const useCreateGuest = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["createGuest"],
    mutationFn: async (name: string) => {
      const response = await api.post<{
        message: string;
        data: IGuest | { admin: true };
      }>("/guests", { name });
      return response.data.data;
    },
    onSuccess(data) {
      if ("admin" in data) return;
      localStorage.setItem("guestId", String(data.id));
      queryClient.setQueryData(["guest"], data);
    },
  });
};

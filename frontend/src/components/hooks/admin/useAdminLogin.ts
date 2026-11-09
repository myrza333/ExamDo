import { useMutation, useQueryClient } from "@tanstack/react-query";
import { isAxiosError } from "axios";
import { api } from "../api/api";
import { IAdminLoginBody } from "../types/type";

export const getErrorText = (error: unknown) => {
  if (isAxiosError(error)) {
    if (error.response?.status === 401) return "Неверный логин или пароль";
    if (error.response?.data?.message) return error.response.data.message;
  }
  return "Не получилось, попробуй ещё раз";
};

export const useAdminLogin = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["adminLogin"],
    mutationFn: async (body: IAdminLoginBody) => {
      const response = await api.post<{
        message: string;
        data: { token: string };
      }>("/admin/login", body);
      return response.data.data.token;
    },
    onSuccess(token) {
      localStorage.setItem("adminToken", token);
      queryClient.setQueryData(["adminToken"], token);
    },
  });
};

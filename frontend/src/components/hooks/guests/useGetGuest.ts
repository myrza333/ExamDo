import { useQuery } from "@tanstack/react-query";
import { isAxiosError } from "axios";
import { api } from "../api/api";
import { IGuest } from "../types/type";

export const useGetGuest = () =>
  useQuery({
    queryKey: ["guest"],
    queryFn: async () => {
      const id = localStorage.getItem("guestId");
      if (!id) return null;
      try {
        const response = await api.get<{ message: string; data: IGuest }>(
          `/guests/${id}`,
        );
        return response.data.data;
      } catch (error) {
        if (isAxiosError(error) && error.response?.status === 404) {
          localStorage.removeItem("guestId");
          return null;
        }
        throw error;
      }
    },
    staleTime: Infinity,
    retry: false,
  });

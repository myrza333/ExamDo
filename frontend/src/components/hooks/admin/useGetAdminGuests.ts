import { useQuery } from "@tanstack/react-query";
import { isAxiosError } from "axios";
import { api } from "../api/api";
import { IAdminGuest } from "../types/type";
import { useAdminToken, useLogoutAdmin } from "./useAdminToken";

export const useGetAdminGuests = () => {
  const { data: token } = useAdminToken();
  const logout = useLogoutAdmin();
  return useQuery({
    queryKey: ["adminGuests"],
    queryFn: async () => {
      try {
        const response = await api.get<{ message: string; data: IAdminGuest[] }>(
          "/admin/guests",
          { headers: { Authorization: `Bearer ${token}` } },
        );
        return response.data.data;
      } catch (error) {
        if (isAxiosError(error) && error.response?.status === 401) logout();
        throw error;
      }
    },
    enabled: !!token,
    retry: false,
  });
};

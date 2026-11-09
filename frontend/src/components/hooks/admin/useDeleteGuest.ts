import { useMutation, useQueryClient } from "@tanstack/react-query";
import { api } from "../api/api";
import { useAdminToken } from "./useAdminToken";

export const useDeleteGuest = () => {
  const queryClient = useQueryClient();
  const { data: token } = useAdminToken();
  return useMutation({
    mutationKey: ["deleteGuest"],
    mutationFn: async (id: number) => {
      const response = await api.delete(`/admin/guests/${id}`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      return response;
    },
    onSuccess() {
      queryClient.invalidateQueries({ queryKey: ["adminGuests"] });
    },
  });
};

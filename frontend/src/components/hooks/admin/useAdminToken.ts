import { useQuery, useQueryClient } from "@tanstack/react-query";

export const useAdminToken = () =>
  useQuery({
    queryKey: ["adminToken"],
    queryFn: () => localStorage.getItem("adminToken"),
    staleTime: Infinity,
  });

export const useLogoutAdmin = () => {
  const queryClient = useQueryClient();
  return () => {
    localStorage.removeItem("adminToken");
    queryClient.setQueryData(["adminToken"], null);
    queryClient.removeQueries({ queryKey: ["adminGuests"] });
  };
};

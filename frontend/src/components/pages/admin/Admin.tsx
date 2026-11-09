"use client";
import { useState } from "react";
import scss from "./Admin.module.scss";
import AdminLogin from "@/components/ui/adminLogin/AdminLogin";
import { UserIcon } from "@/components/ui/icons/Icons";
import {
  useAdminToken,
  useLogoutAdmin,
} from "@/components/hooks/admin/useAdminToken";
import { useGetAdminGuests } from "@/components/hooks/admin/useGetAdminGuests";
import { useDeleteGuest } from "@/components/hooks/admin/useDeleteGuest";

const formatDate = (date: string) =>
  new Date(date).toLocaleString("ru-RU", {
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
    hour: "2-digit",
    minute: "2-digit",
  });

const Admin = () => {
  const [search, setSearch] = useState("");
  const [confirmId, setConfirmId] = useState<number | null>(null);
  const { data: token, isSuccess } = useAdminToken();
  const logout = useLogoutAdmin();
  const { data: guests, isLoading, isError } = useGetAdminGuests();
  const { mutate: deleteGuest, isPending, variables } = useDeleteGuest();

  if (!isSuccess) return null;
  if (!token) return <AdminLogin />;

  const query = search.trim().toLowerCase();
  const filtered = (guests ?? []).filter(
    (el) =>
      el.name.toLowerCase().includes(query) || String(el.id).includes(query),
  );

  const onDelete = (id: number) => {
    deleteGuest(id, { onSuccess: () => setConfirmId(null) });
  };

  return (
    <div className={scss.container}>
      <div className={scss.mainContainer}>
        <div className={scss.head}>
          <div>
            <p className="kicker">АДМИНКА</p>
            <h1>Гости</h1>
            <p className={scss.total}>
              Всего: <b>{guests?.length ?? 0}</b>
            </p>
          </div>
          <button className={scss.logout} onClick={logout}>
            Выйти
          </button>
        </div>

        <input
          className={scss.search}
          type="text"
          placeholder="Поиск по имени или номеру"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
        />

        {isLoading && <p className={scss.status}>Загружаем гостей...</p>}
        {isError && <p className={scss.status}>Не удалось загрузить гостей</p>}
        {guests && !filtered.length && (
          <p className={scss.status}>
            {guests.length ? "Никого не нашли" : "Гостей пока нет"}
          </p>
        )}

        <div className={scss.list}>
          {filtered.map((el) => (
            <div key={el.id} className={scss.card}>
              <span className={scss.avatar}>
                <UserIcon />
              </span>
              <div className={scss.info}>
                <p className={scss.name}>{el.name}</p>
                <p className={scss.meta}>
                  <b>Гость {el.id}</b> · {formatDate(el.created_at)}
                </p>
              </div>
              {confirmId === el.id ? (
                <div className={scss.confirm}>
                  <button
                    className={scss.yes}
                    disabled={isPending && variables === el.id}
                    onClick={() => onDelete(el.id)}
                  >
                    {isPending && variables === el.id ? "..." : "Удалить"}
                  </button>
                  <button
                    className={scss.no}
                    onClick={() => setConfirmId(null)}
                  >
                    Отмена
                  </button>
                </div>
              ) : (
                <button
                  className={scss.delete}
                  onClick={() => setConfirmId(el.id)}
                >
                  Удалить
                </button>
              )}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Admin;

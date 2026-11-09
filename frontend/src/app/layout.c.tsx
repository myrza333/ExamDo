"use client";
import Header from "@/components/layout/header/Header";
import Footer from "@/components/layout/footer/Footer";
import GuestModal from "@/components/ui/guestModal/GuestModal";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import React, { useState } from "react";
import scss from "./layout.c.module.scss";
type ChildrenProps = {
  children: React.ReactNode;
};

const layout = ({ children }: ChildrenProps) => {
  const [qc] = useState(
    () =>
      new QueryClient({
        defaultOptions: {
          queries: { refetchOnWindowFocus: false, retry: 1 },
        },
      }),
  );
  return (
    <QueryClientProvider client={qc}>
      <div className={scss.layout}>
        <Header />
        <main>{children}</main>
        <Footer />
      </div>
      <GuestModal />
    </QueryClientProvider>
  );
};

export default layout;

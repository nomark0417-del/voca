import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "2022 교육부 초·중·고 필수 3,000단어 아케이드",
  description: "초등(800) · 중등(1,200) · 고등(1,000) 필수 영단어 5종 게임 아케이드 (GitHub + Vercel 원클릭 배포)",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ko">
      <body>{children}</body>
    </html>
  );
}

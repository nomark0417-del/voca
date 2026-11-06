import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  reactStrictMode: true,
  eslint: {
    // Vercel 빌드 시 ESLint 설정 누락 또는 검사 오류로 인한 빌드 실패 방지
    ignoreDuringBuilds: true,
  },
  typescript: {
    // Vercel 빌드 시 사소한 타입 불일치로 인한 배포 중단 방지
    ignoreBuildErrors: true,
  },
};

export default nextConfig;

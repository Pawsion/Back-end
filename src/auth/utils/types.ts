// import { ADMIN_ROLE_NAME, PREMIUM_ROLE_NAME } from './constants';

export type Tokens = {
  accessToken: string;
  refreshToken: string;
};

export type Payload = {
  sub: number;
  username: string;
  iat: number;
  exp: number;
  roles: Role[];
};

export type Role = {
  createdAt: string;
  updatedAt: string;
  id: number;
  //   name: typeof ADMIN_ROLE_NAME | typeof PREMIUM_ROLE_NAME;
};

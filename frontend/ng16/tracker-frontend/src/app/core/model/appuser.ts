import { Address } from "./address";

export interface AppUser {
    id?: number;
    keycloakUserId: string;
    lastLogin: Date;
    userName: string;
    firstName: string;
    lastName: string;
    email: string;
    phoneNumber: string;
    address: Address;

  }
export interface IUserCredentials {
  username: string;
  password: string;
}

export interface IUserRegistrationData extends IUserCredentials {
  email: string;
}

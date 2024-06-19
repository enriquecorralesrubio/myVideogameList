import {UUID} from "../types/commons.type";

export interface IGameBase {
  uuid: UUID;
  title: string;
  developer: string;
  globalRating: number;
  cover: string;
  synopsis: string;
  platforms:  IPlatform[];
  genres: IGenre[];
  gameFound: boolean;
}

export interface IGameCreate {
  title: string;
  developer: string;
  cover: string;
  synopsis: string;
}


export interface IPlatform {
  uuid: UUID;
  name: string;
}

export interface IGenre {
  uuid: UUID;
  name: string;
}

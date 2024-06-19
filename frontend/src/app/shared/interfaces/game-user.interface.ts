import { UUID } from "../types/commons.type";

export interface IGameUser {
  userUuid: UUID;
  gameUuid: UUID;
  gameName: string;
  cover: string;
  userRating: number;
  timePlayed: number;
  state: string;
}

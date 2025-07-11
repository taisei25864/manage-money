import axios from "axios";
import type { GmailResponse } from "../types/gmail";

export const fetchGmailMessages = async (): Promise<GmailResponse> => {
  const response = await axios.get<GmailResponse>("/api/gmail");

  console.log(response.data)
  return response.data;
};

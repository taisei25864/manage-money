import axios from "axios";
import type { Transaction } from "../types/transaction";

export const fetchTransactions = async (): Promise<Transaction[]> => {
  const response = await axios.get<Transaction[]>("/api/transactions");
  return response.data;
};

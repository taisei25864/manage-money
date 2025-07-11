import React, { useEffect, useState } from "react";
import { fetchTransactions } from "../api/transactions";
import type { Transaction } from "../types/transaction";

export const TransactionList = () => {
  const [transactions, setTransactions] = useState<Transaction[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const load = async () => {
      try {
        const data = await fetchTransactions();
        setTransactions(data);
      } catch (err) {
        console.error("取引データの取得に失敗しました", err);
      } finally {
        setLoading(false);
      }
    };
    load();
  }, []);

  if (loading) return <p>読み込み中...</p>;

  return (
    <div>
      <h2>取引一覧</h2>
      <ul>
        {transactions.map((t) => (
          <li key={t.id}>
            {t.occurred_on} - {t.title} - {t.amount}円 ({t.category})
          </li>
        ))}
      </ul>
    </div>
  );
};

import React from 'react';
import GmailViewer from './components/GmailViewer';
import { TransactionList } from "./components/TransactionList";

function App() {
  return (
    <div className="App">
      <h1>📬 メールダッシュボード</h1>
      <GmailViewer />
      <h1>家計簿アプリ</h1>
      <TransactionList />
    </div>
  );
}

export default App;

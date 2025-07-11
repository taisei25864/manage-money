import React, { useEffect, useState } from "react";
import { fetchGmailMessages } from "../api/gmail";
import type { GmailMessage } from "../types/gmail";

const GmailViewer = () => {
  const [messages, setMessages] = useState<GmailMessage[]>([]);

  useEffect(() => {
    const load = async () => {
      try {
        const data = await fetchGmailMessages();
        setMessages(data.messages); 
      } catch (error) {
        console.error("Failed to fetch messages:", error);
      }
    };
    load();
  }, []);

  return (
    <div>
      <h2>Gmail Messages</h2>
      {messages.map((message, index) => (
        <div key={index}>
          <h3>{message.subject}</h3>
          <pre>{message.body}</pre>
          <hr />
        </div>
      ))}
    </div>
  );
};

export default GmailViewer;

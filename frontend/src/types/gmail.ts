// types/gmail.ts
export interface GmailMessage {
  subject: string;
  body: string;
}

export interface GmailResponse {
  messages: GmailMessage[];
}

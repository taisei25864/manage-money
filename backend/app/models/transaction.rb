class Transaction < ApplicationRecord
  def self.create_from_gmail(raw_message)
    parsed = parse_from_gmail(raw_message)
    create!(parsed)
  end

  def self.parse_from_gmail(raw_message)
    # bodyから必要な情報を抽出
    body = raw_message["body"] || raw_message[:body]

    title = extract_field(body, /◇利用先：(.+)/) || "不明"
    amount = extract_amount(body)
    category = extract_field(body, /◇利用取引：(.+)/) || "その他"
    occurred_on = extract_date(body) || Date.today

    {
      title: title,
      amount: amount,
      category: category,
      occurred_on: occurred_on
    }
  end

  private

  def self.extract_field(body, regex)
    match = body.match(regex)
    match ? match[1].strip : nil
  end

  def self.extract_amount(body)
    amount_str = extract_field(body, /◇利用金額：([\d,]+)円/)
    amount_str ? amount_str.delete(",").to_i : 0
  end

  def self.extract_date(body)
    date_str = extract_field(body, /◇利用日：(\d{4}\/\d{2}\/\d{2})/)
    date_str ? Date.strptime(date_str, '%Y/%m/%d') : nil
  end
end

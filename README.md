# Data Engineering Task — Retail Analytics

## Вимоги

- Python 3.10+
- Jupyter Notebook (або VSCode з Jupyter extension)

## Швидкий старт

```bash
git clone https://github.com/zaspenkoav/comfy-de-interview-task.git
cd comfy-de-interview-task
```

Відкрийте `interview-task.ipynb` та запустіть першу ячейку — дані завантажаться автоматично.

## Частина 1: SQL Analytics (Jupyter Notebook)

Відкрийте `interview-task.ipynb` та виконайте завдання:

1. **Task 1** — порівняння каналів (online / offline / marketplace): середній чек, кількість транзакцій, частка виручки, return rate
2. **Task 2** — `EXPLAIN ANALYZE` + обговорення BigQuery optimization (partitioning, clustering, cost)
3. **Бонус** — mobile vs desktop аналітика

## Частина 2: dbt Code Review

Відкрийте файли в `dbt-review/` та знайдіть проблеми — correctness, performance, best practices:

- `stg_retail_transactions.sql` — staging model
- `mart_channel_performance.sql` — mart model
- `schema.yml` — schema definitions

## Схема даних

Таблиця `retail_transactions` (~10K рядків):

| Column | Type | Опис |
|--------|------|------|
| `transaction_id` | STRING | PK (TXN-0000001) |
| `transaction_date` | DATE | Дата транзакції |
| `transaction_timestamp` | TIMESTAMP | Час з секундами |
| `channel` | STRING | online / offline / marketplace |
| `store_id` | INT | Nullable — тільки для offline |
| `customer_id` | STRING | Nullable — анонімні офлайн-покупки |
| `session_id` | STRING | Online-only — web session ID |
| `device_type` | STRING | desktop / mobile / tablet (online-only) |
| `utm_source` | STRING | google / direct / organic / facebook / email / affiliate (online-only) |
| `product_id` | STRING | SKU |
| `category` | STRING | Категорія товару |
| `product_name` | STRING | Назва товару |
| `quantity` | INT | Кількість |
| `unit_price` | NUMERIC | Ціна за одиницю |
| `total_amount` | NUMERIC | quantity × unit_price |
| `payment_method` | STRING | card_online / card_pos / cash / installment |
| `is_returned` | BOOL | Повернення (~3%) |

# База данных LifeFlow

## Таблицы
- users — пользователи
- tasks — задачи
- habits — привычки
- habit_logs — журнал выполнения привычек

## Связи
- users → tasks: 1 : N
- users → habits: 1 : N
- habits → habit_logs: 1 : N

## Файлы
- `er-dia.png` — ER-диаграмма
- `lifeflow_full.sql` — SQL-скрипт

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(200) NOT NULL,
    is_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL
);

CREATE TABLE habits (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE habit_logs (
    id SERIAL PRIMARY KEY,
    habit_id INTEGER NOT NULL REFERENCES habits(id) ON DELETE CASCADE,
    date DATE NOT NULL,
    is_done BOOLEAN DEFAULT FALSE,
    UNIQUE(habit_id, date)
);

INSERT INTO users (username, email, password_hash) VALUES
('alex', 'alex@example.com', 'hash123'),
('maria', 'maria@example.com', 'hash456');

INSERT INTO tasks (user_id, title, is_completed, completed_at) VALUES
(1, 'Купить продукты', TRUE, '2025-05-20 15:30:00'),
(1, 'Сделать зарядку', FALSE, NULL),
(1, 'Позвонить маме', FALSE, NULL),
(2, 'Написать курсовую', FALSE, NULL),
(2, 'Полить цветы', TRUE, '2025-05-21 10:00:00');

INSERT INTO habits (user_id, name) VALUES
(1, 'Пить воду'),
(1, 'Читать 30 минут'),
(2, 'Медитация'),
(2, 'Утренняя зарядка');

INSERT INTO habit_logs (habit_id, date, is_done) VALUES
(1, '2025-05-21', TRUE),
(1, '2025-05-22', TRUE),
(2, '2025-05-21', FALSE),
(2, '2025-05-22', TRUE),
(3, '2025-05-22', TRUE);

SELECT * FROM tasks WHERE user_id = 1 AND is_completed = FALSE;

INSERT INTO tasks (user_id, title) VALUES (1, 'Сходить в спортзал');

UPDATE tasks SET is_completed = TRUE, completed_at = NOW() WHERE id = 2;

DELETE FROM tasks WHERE user_id = 1 AND is_completed = TRUE;

SELECT u.username, t.title, t.is_completed
FROM users u
JOIN tasks t ON u.id = t.user_id;
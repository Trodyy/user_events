//the core of database's table.
CREATE TABLE user_logs (
id SERIAL PRIMARY KEY ,
user_id INT NOT NULL ,
name VARCHAR(150) NOT NULL ,
page VARCHAR(255) NOT NULL ,
age  INT NOT NULL ,
duration INT ,
join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
metadata JSONB
);


//To speed up database engine's search.
CREATE INDEX idx_user_logs_time ON user_logs(timestamp);
CREATE INDEX idx_user_logs_time ON user_logs(join_date);



CREATE VIEW user_activity_summary AS
SELECT user_id, COUNT(*) AS visit_count, AVG(duration) AS avg_time
FROM user_logs
GROUP BY user_id;

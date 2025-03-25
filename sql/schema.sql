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



//MATRILIZIED VIEWS HAVE BETTER PERFORMANCE WHERE WE HAVE COMPLEX aGGREGATIONS THAT ARE EXPENSIVE TO COMPUTE.
CREATE MATERIALIZED VIEW daily_page_views AS
SELECT DATE(timestamp) AS date, page, COUNT(*) AS visits
FROM user_logs
GROUP BY DATE(timestamp), page;



//Create a new table to get the output of trigger.
CREATE TABLE user_metrics (
    user_id INT PRIMARY KEY,
    avg_time FLOAT
);


//CREATE A FUNCTION TO COMUTE avg_time and INSERT it on user_metrics.
CREATE OR REPLACE FUNCTION calculate_avg_time() RETURNS VOID AS $$
BEGIN
    INSERT INTO user_metrics (user_id, avg_time)
    SELECT user_id, AVG(duration)
    FROM user_logs
    GROUP BY user_id
    ON CONFLICT (user_id) DO UPDATE SET avg_time = EXCLUDED.avg_time;
END;
$$ LANGUAGE plpgsql;

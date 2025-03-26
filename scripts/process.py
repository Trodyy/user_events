import psycopg2
import matplotlib.pyplot as plt
import pandas as pd
import csv

conn = psycopg2.connect(database = "userevent", user = "trody", password = "trone4955", host = "127.0.0.1", port = "5432")

print ("Opened database successfully")



cur = conn.cursor()
with open('scripts/user_logs_export.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    cur.execute("SELECT * FROM user_activity_summary")
    writer.writerow([desc[0] for desc in cur.description])
    writer.writerows(cur)

conn.close()

# plt.bar(df["date"], df["visits"])
# plt.xlabel("Date")
# plt.ylabel("Visits")
# plt.title("Daily Page Visits")
# plt.xticks(rotation=45)
# plt.savefig('daily_visits.png', dpi=300, bbox_inches='tight')
# print("Plot saved as 'daily_visits.png'")


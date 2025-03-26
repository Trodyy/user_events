import psycopg2
import matplotlib.pyplot as plt
import pandas as pd

conn = psycopg2.connect(database = "userevent", user = "trody", password = "trone4955", host = "127.0.0.1", port = "5432")

print ("Opened database successfully")


df = pd.read_sql("SELECT * FROM daily_page_views", conn)

plt.bar(df["date"], df["visits"])
plt.xlabel("Date")
plt.ylabel("Visits")
plt.title("Daily Page Visits")
plt.xticks(rotation=45)
plt.show()


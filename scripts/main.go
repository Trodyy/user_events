package main

import (
	"fmt"
	"log"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"github.com/gin-gonic/gin"
)

var DB *gorm.DB

func initDB() {
	dsn := "host=localhost user=trody password=trone4955 dbname=userevent port=5432 sslmode=disable"
	var err error
	DB, err = gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal("Failed to connect to database:", err)
	}
	fmt.Println("Connected to database")
}

func main() {
	initDB()
	r := gin.Default()

	r.GET("/logs", func(c *gin.Context) {
		var user_logs []map[string]interface{}
		DB.Raw("SELECT * FROM user_logs").Scan(&userlogs)
		c.JSON(200, user_logs)
	})

	r.Run(":8080")
}

package main
  
import (
        "fmt"
        "minibank/handlers"
        "minibank/models"
        "net/http"
        "os"
)
func main(){
        // Connect to the database
        dbConn := fmt.Sprintf("minibank:minibank@tcp(minibankdb:3306)/minibank")
        models.InitDB(dbConn)
        defer models.Database.Close()
        http.HandleFunc("/api/account/register", handlers.RegisterHandler)
        // Handling the DB
        // http.HandleFunc("api/account/token", handlers.TokenHandler)
        // Initialize handles to the http handler of the DB 
        handles := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
                res, errors := models.Database.Exec("SELECT 1")
                // utilizing the fmt from Cab's code to print error or non
                if errors != nil {
                        fmt.Fprintf(w, "%s\n", http.StatusText(http.StatusServiceUnavailable))
                } else {
                        fmt.Fprintf(w, "%s\n", res)
                }
        })
        http.ListenAndServe(port(), handles)
}

// For me ports!
func port() string {
        port := os.Getenv("PORT")
        if len(port) == 0 {
                port = "8080"
        }
        return ":" + port
}

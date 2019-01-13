package main


import ( 
	"fmt"
	 "os"
	 "net/http"
)

func main(){
	name, err := os.Hostname() //Get my host
	if err != nil {
		panic(err)
	}
	handler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "%s\n", name) //Print out response with name 
	})
	http.ListenAndServe(":80", handler) //listen on port 80 and handle
}

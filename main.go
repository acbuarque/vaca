package main

import (
	"bufio"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

func main() {
	pathOfFile := "problems.csv"
	b, err := ioutil.ReadFile(pathOfFile)
	if err != nil {
		log.Fatalf("failed to read file at %s, error %v", pathOfFile, err)
	}
	contentAsString := string(b)
	correctAnswears := 0
	wrongAnswears := 0
	problems := strings.Split(contentAsString, "\n")
	for _, problem := range problems {
		problemPars := strings.Split(problem, ",")
		operationToAsk := problemPars[0]
		expectedAnswear := problemPars[1]
		fmt.Printf("what is the answear of %s: ", operationToAsk)
		reader := bufio.NewReader(os.Stdin)
		text, err := reader.ReadString('\n')
		if err != nil {
			log.Println("invalid anwear")
			wrongAnswears++
		}
		if strings.Replace(text, "\n", "", 10) == expectedAnswear {
			correctAnswears++
		} else {
			wrongAnswears++
		}
	}
	fmt.Printf("correct: %d\n", correctAnswears)
	fmt.Printf("incorrect: %d", wrongAnswears)
}

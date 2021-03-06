package main

import (
	"fmt"
	"os"
	"time"

	"github.com/DannyMassa/dead-link-linter/controllers"
	"github.com/DannyMassa/dead-link-linter/services"
)

var (
	urlService       services.URLService       = &services.URLServiceImpl{}
	parameterService services.ParameterService = &services.ParameterServiceImpl{}
)

func main() {
	start := time.Now()
	c := parameterService.SetConfig()

	// Testing against golden URL
	if !urlService.LinkLivenessChecker(c.GoldenURL) {
		os.Exit(5)
	}

	err := controllers.Controller.Run(c)

	elapsed := time.Since(start)

	fmt.Printf("\nLinter finished in %s\n", elapsed)
	if err != nil {
		os.Exit(1)
	} else {
		os.Exit(0)
	}
}

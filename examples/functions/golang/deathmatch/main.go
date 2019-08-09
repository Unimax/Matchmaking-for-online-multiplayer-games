package main

import (
	deathmatch "open-match.dev/open-match/examples/functions/golang/deathmatch/mmf"
	mmfHarness "open-match.dev/open-match/pkg/harness/function/golang"
)

func main() {
	mmfHarness.RunMatchFunction(&mmfHarness.FunctionSettings{
		Func: deathmatch.MakeMatches,
	})
}

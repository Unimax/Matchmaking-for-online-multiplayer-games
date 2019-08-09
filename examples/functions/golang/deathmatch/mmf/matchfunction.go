package mmf

import (
	"fmt"
	"time"

	mmfHarness "open-match.dev/open-match/pkg/harness/function/golang"
	"open-match.dev/open-match/pkg/pb"
)

var (
	matchName = "a-simple-10-player-deathmatch-matchfunction"
)

// MakeMatches is where your custom matchmaking logic lives.
func MakeMatches(p *mmfHarness.MatchFunctionParams) ([]*pb.Match, error) {

	tickets := map[string]*pb.Ticket{}

	for _, pool := range p.PoolNameToTickets {
		for _, ticket := range pool {
			tickets[ticket.GetId()] = ticket
		}
	}

	var matches []*pb.Match

	t := time.Now().Format("2006-01-02T15:04:05.00")

	thisMatch := make([]*pb.Ticket, 0, 10)
	matchNum := 0

	for _, ticket := range tickets {
		thisMatch = append(thisMatch, ticket)

		if len(thisMatch) >= 10 {
			matches = append(matches, &pb.Match{
				MatchId:       fmt.Sprintf("profile-%s-time-%s-num-%d", p.ProfileName, t, matchNum),
				MatchProfile:  p.ProfileName,
				MatchFunction: matchName,
				Tickets:       thisMatch,
			})

			thisMatch = make([]*pb.Ticket, 0, 10)
			matchNum++
		}
	}

	return matches, nil
}

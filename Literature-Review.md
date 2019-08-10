## Matchmaking and Case-based Recommendations Jorge Jim´enez-Rodr´ıguez at. al. 2007

# Problem:- 
    case-based, skill-based and role-based matchmaking in multiplayer games, which one of these results into more interesting games for the players

# Related work:- 
    Chess rating systems 1995, Ranking and matchmaking. Game Developer Magazine 2006
	related work is not explained within the paper but from the References i found the above one.

# Solution:- 
	For skill-based matchmaking they provided a skill rating update system and also  suggested a Recommendation process for suggestion of player for a match to be played.
	For role based is suggested a Recommendation process and similarity metrics for finding out the players. they suggested role-based to be a better system.

# Evaluation:- 
    Not much evaluation is done, they suggested a similarity metrics method for matchmaking but they themself accepted that this require a deeper analysis.

# Future Work:- 
    they want to focus on role-based approach and analyse its performance. they also wanted to carry out a case study of these two approaches to Unreal Tournament 2004.

-----------------------------------------------------------------------------------------------------------------------------------------------
## Switchboard: A Matchmaking System for Multiplayer Mobile Games, Justin Manweiler at. al. 2011

# Problem:-
    Main problem they  trying to solve is the highly variable performance of cellular networks and the need for scalability in mobile multiplayer games. This includes two problems
	1. the service needs to know the cellular network latency between game players. 
	2. the service needs to quickly group players into viable game sessions.

# Related work:- 
    Matchmaking for online games and other latency-sensitive P2P systems, S. Agarwal and J. Lorch. 2009.  this work mainly discuss server less multiplayer game where player devices exchange states between themselfs.

# Solution:- 
    Switchboard a centralized, cloud-based service with simple API for game developers with the ablity of specifying criteria like tolerance for latency. It have a Latency Estimator component to estimate RTT between players and between player to server. Another component is Grouping Agent which group similar latency player together for a match. 
	
# Evaluation:- 
    They implement and deployed centralized C# based Switchboard service on microsoft Azure. Evaluation of grouping:- they showed graph showing successful better grouping based on latency proximity then on geographic proximity.
    End-to-end Evaluation :- they used graph to show trafic getting stablize after a warming period, and other graph to show resulting group sizes matchmaking exluding the warming period.


# Future work:- 
    current work does not consider phone which are moving like on a bus/train which might include predicting future celltowers by using phone's trajectory. they also did not estimate and predict bandwidth over 3G. another area they left out is energy conservation during game play.

---------------------------------------------------------------------------------------------------------------------------------------
## Developing game-structure sensitive matchmaking system for massive-multiplayer online games, Myslak M, Deja D (2014)

# Problem:- 
    matchmaking of populer games like League of Legends are not effective of there ranking system and negativly affects user expriences. there research shows ignoreing roles in matches is a major factor in bad expriences of a match by players.

# Solution:- 
    an game-structure oriented implicit matchmaking system. but this system lock a suggested role for players.!
	
# Evaluation:- 
    with there system player roles were fixed based of there perfomance on those roles and there preferences and then they logistic model the winning probablities of such matches. Tested there system on the League of Legends game.

# Future Work:- 
    they suggest to somehow avoid fixing the roles for players and letting them chose it should be maintained in the system.
------------------------------------------------------------------------------------------------------------------------------------
## P2P matchmaking solution for online games,  Michał Boron at.al. 2019

# Problem:- 
    A solution for the problem of matchmaking players on the scale of the Internet, without needing a central server. I beleave it is also called serverless gaming. In which one of the player will be the server for that match.

# Related work:- 
    1. Matchmaking for online games and other latency-sensitive p2p systems, Agarwal S, Lorch JR (2009). this is also part of related work of the previous reviewed paper. 
	  2. Vivaldi: a decentralized network coordinate system ,Dabek F, Cox R, Kaashoek F, Morris R (2004)
	  3. Switchboard (2011) was also considered as related work. Note both 1 and 3 focuses on reducing latency between players.
	  4. Developing game-structure sensitive matchmaking system for massive-multiplayer online games, Myslak M, Deja D (2014)
	  5. Lom: a leader oriented matchmaking algorithm for multiplayer online games , Jiang JR, Sung GY, Wu JW (2015)

# Solution:- 
    Provided a tool for automatic locating and managing processes of matchmaking in a P2P envioment along with a proof of its correctness. The solution involve forming a ring of clients. An simplified implementation focused paper was released in 2017 with title "p2p matchmaking service. In: Multimedia and network information systems". NOTE: there solution does not consider latency between clients!!
	
# Evaluation:- 
    they compared number of messages as a function of ring size (number of participants) at different churn/crashes (0,2,4,8 etc) for 1000 rounds. which shows message complexity growth was linear with respect to ring size. 

# Future Work:- 
    they suggested an algorithm with weaker assumptions on synchrony or failure
    detector could be designed. they also suggested that It would be interesting to try to create the ring with nodes which are close to each other in terms of latency.
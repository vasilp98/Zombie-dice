import Foundation

public class Game {
    private let configurations: Configurations
    private var currentPlayer = Player(name: "")
    private let ioProcessor: IOProcessor
    private var players: Array<Player>
    private let turnFactory: TurnFactoryProtocol

    public var isRunning: Bool = false

    public init(configurations: Configurations, turnFactory: TurnFactoryProtocol, ioProcessor: IOProcessor) {
        self.configurations = configurations;
        self.players = configurations.players.map { $0.copy() as! Player }
        
        self.turnFactory = turnFactory
        self.ioProcessor = ioProcessor
    }

    public func start() {
        self.isRunning = true

        orderPlayers()
    }

    public func restart() {
        self.isRunning = true
        self.players = self.configurations.players
        self.currentPlayer = Player(name: "")

        orderPlayers()
    }

    private func orderPlayers() {
        self.players = self.players.shuffled()
    }

    public func startNextTurn() {
        self.printScoreboard()

        self.currentPlayer = self.getNextPlayer()
        self.ioProcessor.write("Next turn is playing \(self.currentPlayer.name)")

        let turn = self.turnFactory.create(player: self.currentPlayer)
        while(!turn.isEnded){

            let drawnDices = turn.drawDices()
            self.ioProcessor.write("The Dices are rolling...")
            Thread.sleep(forTimeInterval: 2)

            for dice in drawnDices {
                let rolledSide = dice.roll()
                self.ioProcessor.write("\(dice.type) dice landed on \(Utils.getSideLabel(side: rolledSide))")

                turn.changeStatistics(diceRolled: dice, landedSide: rolledSide)
            }
            
            turn.showStatistics()
            turn.askToContinueIfPossible()
        }

        let earnedPoints = turn.getEarnedPoints()
        self.currentPlayer.increasePoints(by: earnedPoints)

        if self.currentPlayer.points >= self.configurations.pointsGoal {
            self.ioProcessor.write("The winner is \(self.currentPlayer.name)");
            self.isRunning = false
        }
    }

    private func getNextPlayer() -> Player {
        let currentIndex = self.players.firstIndex(of: self.currentPlayer) ?? -1
        var nextIndex = currentIndex + 1
        nextIndex = self.players.indices.contains(nextIndex) ? nextIndex : 0
        return self.players[nextIndex]    
    }

    private func printScoreboard() {
        self.ioProcessor.writeSeparator()
        self.ioProcessor.write("The scoreboard:")

        for player in self.players {
            self.ioProcessor.write(player)
        }
        self.ioProcessor.writeSeparator()
    }
}
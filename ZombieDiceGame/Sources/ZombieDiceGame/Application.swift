import ZombieDiceLibrary

class Application {
    private let console: IOProcessor
    private let gameFactory: GameFactoryProtocol

    init(container: DependencyContainerProtocol) {
        self.console = container.resolve()!
        self.gameFactory = container.resolve()!
    }

    func start() {
        self.console.write("Hello everyone, you're playing Zombie dice.")

        let configurations = makeConfigurations();
        let game = self.gameFactory.create(configurations: configurations)
        game.start()

        while(game.isRunning) {
            game.startNextTurn()

            if !game.isRunning {
                self.console.writeSeparator()
                let response = Utils.askYesNo(question: "Do you want to play again with the same configuration?", ioProcessor: console)

                if response == true {
                    game.restart()
                }
            }
        }
    }

    private func makeConfigurations() -> Configurations {
        self.console.write("How many players will play?")
        
        let playersCount = Int(self.console.read()!)
        if playersCount != nil && 1 < playersCount! && playersCount! < 9 {

            self.console.write("Please write the \(playersCount!) players' names.")

            var players: Array<Player> = Array()
            for _ in 0..<playersCount! {
                let playerName = self.console.read()!
                let player = Player(name: playerName)

                players.append(player)
            }

            return Configurations(players: players)
        } else {
            self.console.write("Please provide number between 2 and 8")
            return makeConfigurations()
        }   
    }
}
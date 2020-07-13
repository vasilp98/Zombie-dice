import ZombieDiceLibrary

class Application {
    private let container: DependencyContainerProtocol 

    init(container: DependencyContainerProtocol) {
        self.container = container
    }

    func start() {
        let console: IOProcessor = self.container.resolve()!
        console.write("Hello everyone, you're playing Zombie dice.")

        let configurations = makeConfigurations(ioProcessor: console);
        let gameFactory: GameFactoryProtocol = self.container.resolve()!
        let game = gameFactory.create(configurations: configurations)
        game.start()

        while(game.isRunning) {
            game.startNextTurn()

            if !game.isRunning {
                let response = Utils.askYesNo(question: "Do you want to play again with the same configuration?", ioProcessor: console)

                if response == true {
                    game.restart()
                }
            }
        }
    }

    func makeConfigurations(ioProcessor: IOProcessor) -> Configurations {
        ioProcessor.write("How many players will play?")
        
        let playersCount = Int(ioProcessor.read()!)
        if playersCount != nil && 1 < playersCount! && playersCount! < 9 {

            ioProcessor.write("Please write the \(playersCount!) players' names.")

            var players: Array<Player> = Array()
            for _ in 0..<playersCount! {
                let playerName = ioProcessor.read()!
                let player = Player(name: playerName)

                players.append(player)
            }

            return Configurations(players: players)
        } else {
            ioProcessor.write("Please provide number between 2 and 8")
            return makeConfigurations(ioProcessor: ioProcessor)
        }   
    }
}
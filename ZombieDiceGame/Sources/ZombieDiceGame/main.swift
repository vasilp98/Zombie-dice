import ZombieDiceLibrary


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


func createServiceLocator() -> ServiceLocator {
    let serviceLocator = ServiceLocator()
    serviceLocator.register(Console() as IOProcessor)

    return serviceLocator
}

let serviceLocator = createServiceLocator()

let console: IOProcessor = serviceLocator.resolve()!
console.write("Hello everyone, you're playing Zombie dice.")

let configurations = makeConfigurations(ioProcessor: console);
let game = Game(configurations: configurations, ioProcessor: console)
game.start()

while(game.isRunning) {
    game.startNextTurn()

    if !game.isRunning {
        let response = Utils.askYesNo(question: "Do you want to play again with the same players?", ioProcessor: console)

        if response == true {
            game.restart()
        }
    }
}

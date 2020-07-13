import ZombieDiceLibrary

class GameFactory: GameFactoryProtocol {
    private let turnFactory: TurnFactoryProtocol
    private let ioProcessor: IOProcessor

    init(turnFactory: TurnFactoryProtocol, ioProcessor: IOProcessor) {
        self.turnFactory = turnFactory
        self.ioProcessor = ioProcessor
    }

    func create(configurations: Configurations) -> Game {
        return Game(configurations: configurations, turnFactory: self.turnFactory, ioProcessor: self.ioProcessor)
    }
}
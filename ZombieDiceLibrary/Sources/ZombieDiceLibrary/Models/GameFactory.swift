class GameFactory: GameFactoryProtocol {
    private let turnFactory: TurnFactoryProtocol
    private let ioProcessor: IOProcessor

    init(turnFactory: TurnFactoryProtocol, ioProcessor: IOProcessor) {
        self.turnFactory = turnFactory
        self.ioProcessor = ioProcessor
    }

    func create(configurations: Configurations) -> GameProtocol {
        return Game(configurations: configurations, turnFactory: self.turnFactory, ioProcessor: self.ioProcessor)
    }
}
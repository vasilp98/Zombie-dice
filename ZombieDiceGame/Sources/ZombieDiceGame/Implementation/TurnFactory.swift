import ZombieDiceLibrary

class TurnFactory: TurnFactoryProtocol {
    private let ioProcessor: IOProcessor

    init(ioProcessor: IOProcessor) {
        self.ioProcessor = ioProcessor
    }

    func create(player: Player) -> TurnProtocol {
        return Turn(player: player, ioProcessor: self.ioProcessor)
    }
}
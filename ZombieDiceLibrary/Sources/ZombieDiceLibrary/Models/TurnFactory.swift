class TurnFactory: TurnFactoryProtocol {
    private let ioProcessor: IOProcessor
    private let drawableCollectionFactory: DrawableCollectionFactoryProtocol

    init(ioProcessor: IOProcessor, drawableCollectionFactory: DrawableCollectionFactoryProtocol) {
        self.ioProcessor = ioProcessor
        self.drawableCollectionFactory = drawableCollectionFactory
    }

    func create(player: Player) -> TurnProtocol {
        return Turn(player: player, ioProcessor: self.ioProcessor, drawableCollection: self.drawableCollectionFactory.create())
    }
}
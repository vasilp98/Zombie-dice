public extension DependencyContainerProtocol {
    func configureDefault() {
        self.register(Console() as IOProcessor)
        self.register(DrawableCollectionFactory() as DrawableCollectionFactoryProtocol)
        self.register(TurnFactory(ioProcessor: self.resolve()! as IOProcessor, drawableCollectionFactory: self.resolve()! as DrawableCollectionFactoryProtocol) as TurnFactoryProtocol)
        self.register(GameFactory(turnFactory: self.resolve()! as TurnFactoryProtocol, ioProcessor: self.resolve()! as IOProcessor) as GameFactoryProtocol)
    }

    func configureDefault(ioProcessor: IOProcessor) {
        self.register(ioProcessor)
        self.register(DrawableCollectionFactory() as DrawableCollectionFactoryProtocol)
        self.register(TurnFactory(ioProcessor: self.resolve()! as IOProcessor, drawableCollectionFactory: self.resolve()! as DrawableCollectionFactoryProtocol) as TurnFactoryProtocol)
        self.register(GameFactory(turnFactory: self.resolve()! as TurnFactoryProtocol, ioProcessor: self.resolve()! as IOProcessor) as GameFactoryProtocol)
    }    
}
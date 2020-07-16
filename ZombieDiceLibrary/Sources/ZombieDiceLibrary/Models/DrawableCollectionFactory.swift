class DrawableCollectionFactory: DrawableCollectionFactoryProtocol {

    func create() -> Drawable {
        return DiceCollection()
    }
}
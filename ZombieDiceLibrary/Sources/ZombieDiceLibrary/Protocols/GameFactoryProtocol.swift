public protocol GameFactoryProtocol {
    /**
    Creates GameProtocol.

    - Parameter configurations: The settings which will configure the game.

    - Returns: GameProtocol.
    */
    func create(configurations: Configurations) -> GameProtocol
}
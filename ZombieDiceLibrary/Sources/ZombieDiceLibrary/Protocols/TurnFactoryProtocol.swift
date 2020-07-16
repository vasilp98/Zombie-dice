public protocol TurnFactoryProtocol {
    /**
    Creates TurnProtocol.

    - Parameter player: The player which is playing the turn.

    - Returns: TurnProtocol.
    */
    func create(player: Player) -> TurnProtocol
}
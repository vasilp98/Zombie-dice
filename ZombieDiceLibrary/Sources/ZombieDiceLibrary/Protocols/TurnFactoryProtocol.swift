public protocol TurnFactoryProtocol {
    func create(player: Player) -> TurnProtocol
}
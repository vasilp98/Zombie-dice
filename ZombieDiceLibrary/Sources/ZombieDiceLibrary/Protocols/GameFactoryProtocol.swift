public protocol GameFactoryProtocol {
    func create(configurations: Configurations) -> Game
}
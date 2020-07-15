public protocol GameProtocol {
    var isRunning: Bool { get }

    func start()

    func restart()

    func startNextTurn()
}
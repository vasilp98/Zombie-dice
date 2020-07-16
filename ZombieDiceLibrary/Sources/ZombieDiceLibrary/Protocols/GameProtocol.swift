public protocol GameProtocol {

    var isRunning: Bool { get }

    /**
    Starts the game.
    */  
    func start()

    /**
    Restarts the game with the same configurations.
    */ 
    func restart()

    /**
    Starts the turn of the next player.
    */ 
    func startNextTurn()
}
public protocol TurnProtocol {
    var isEnded: Bool { get }

    /**
    Changes the player's statistics of the current turn.

    - Parameters 
        - landedSide: The side that the dice landed on.
    */
    func changeStatistics(landedSide: Side) 

    /**
    Shows the player's statistics of the current turn.
    */
    func showStatistics()

    /**
    Ask if the player wants to continue it's turn if the turn hasn't ended yet.
    */
    func askToContinueIfPossible()

    /**
    Draws dices from the collection for this turn.

    - Returns: List of dices.
    */
    func drawDices() -> ArraySlice<Dice>

    /**
    Get the points that the player has earned until now.

    - Returns: Points earned.
    */
    func getEarnedPoints() -> Int
}
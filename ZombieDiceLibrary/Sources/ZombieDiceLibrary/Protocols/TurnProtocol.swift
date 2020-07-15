public protocol TurnProtocol {
    var isEnded: Bool { get }

    func changeStatistics(diceRolled: Dice, landedSide: SideType) 

    func showStatistics()

    func askToContinueIfPossible()

    func drawDices() -> ArraySlice<Dice>

    func getEarnedPoints() -> Int
}
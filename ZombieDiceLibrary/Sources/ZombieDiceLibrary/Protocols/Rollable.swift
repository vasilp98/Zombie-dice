public protocol Rollable {
    /**
    Picks a random side.

    - Returns: The type of the side which is picked.
    */
    func roll() -> Side
}
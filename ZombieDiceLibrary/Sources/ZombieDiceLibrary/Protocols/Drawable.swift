public protocol Drawable {
    /**
    Draws number of dices.

    - Parameter numberOfDices: The number of dices to be drawn.

    - Returns: List of dices which were drawn.
    */
    func draw(numberOfDices: Int) -> ArraySlice<Dice>

    /**
    Define whether drawable items are left to be drawn.
    */
    func isEmpty() -> Bool
}
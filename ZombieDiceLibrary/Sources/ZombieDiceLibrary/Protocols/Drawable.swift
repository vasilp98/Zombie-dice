public protocol Drawable {
    func draw(numberOfDices: Int) -> ArraySlice<Dice>

    func isEmpty() -> Bool
}
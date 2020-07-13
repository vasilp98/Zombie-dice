public class DiceCollection: Drawable {
    private var greenDices = [Dice](repeating: GreenDice(), count: 6)
    private var yellowDices = [Dice](repeating: YellowDice(), count: 4)
    private var redDices = [Dice](repeating: RedDice(), count: 3)
    private var dicesLeft: [Dice]

    public init() {
        self.dicesLeft = greenDices + yellowDices + redDices
    }

    public func draw(numberOfDices: Int) -> ArraySlice<Dice> {
        let drawnDices = self.dicesLeft.choose(numberOfDices)

        for dice in drawnDices {

            let index = self.dicesLeft.firstIndex(of: dice)
            self.dicesLeft.remove(at: index!)
        }

        return drawnDices
    }

    public func isEmpty() -> Bool {
        return self.dicesLeft.isEmpty
    }
}
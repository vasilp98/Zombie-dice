public class Dice : DiceProtocol {
    private var sides = [Side]()
    
    private(set) public var type: DiceType

    init(type: DiceType) {
        self.type = type
    }

    func configureSides(sides: [Side]) {
        self.sides = sides
    }

    public func roll() -> Side {
        return self.sides.choose(1).first!
    } 

    public static func == (lhs: Dice, rhs: Dice) -> Bool {
        return lhs.type == rhs.type
    }
}
public class Dice : Rollable, Equatable {
    private let sides: Array<SideType>
    
    private(set) var type: DiceType

    init(type: DiceType, sides: Array<SideType>) {
        self.type = type
        self.sides = sides
    }

    public func roll() -> SideType {
        return self.sides.choose(1).first!
    } 

    public static func == (lhs: Dice, rhs: Dice) -> Bool {
        return lhs.type == rhs.type
    }
}
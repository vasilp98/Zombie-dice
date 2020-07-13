public class RedDice : Dice {
    init() {
        var sides = [SideType]()
        sides.append(contentsOf: [SideType](repeating: SideType.Brain, count: 1))
        sides.append(contentsOf: [SideType](repeating: SideType.Steps, count: 2))
        sides.append(contentsOf: [SideType](repeating: SideType.Gun, count: 3))

        super.init(type: DiceType.Red, sides: sides)
    }
}
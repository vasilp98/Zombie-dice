public class GreenDice : Dice {
    init() {
        var sides = [SideType]()
        sides.append(contentsOf: [SideType](repeating: SideType.Brain, count: 3))
        sides.append(contentsOf: [SideType](repeating: SideType.Steps, count: 2))
        sides.append(contentsOf: [SideType](repeating: SideType.Gun, count: 1))

        super.init(type: DiceType.Green, sides: sides)
    }
}
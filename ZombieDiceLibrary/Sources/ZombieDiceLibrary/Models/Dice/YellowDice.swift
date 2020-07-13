public class YellowDice : Dice {
    init() {
        var sides = [SideType]()
        sides.append(contentsOf: [SideType](repeating: SideType.Brain, count: 2))
        sides.append(contentsOf: [SideType](repeating: SideType.Steps, count: 2))
        sides.append(contentsOf: [SideType](repeating: SideType.Gun, count: 2))

        super.init(type: DiceType.Yellow, sides: sides)
    }
}
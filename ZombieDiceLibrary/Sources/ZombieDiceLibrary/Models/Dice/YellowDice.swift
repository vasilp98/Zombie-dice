public class YellowDice : Dice {
    init() {
        super.init(type: DiceType.Yellow)

        var sides = [Side]()
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Brain), count: 2))
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Steps), count: 2))
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Gun), count: 2))

        super.configureSides(sides: sides)
    }
}
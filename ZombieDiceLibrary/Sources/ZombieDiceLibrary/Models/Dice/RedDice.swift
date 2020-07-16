public class RedDice : Dice {
    init() {
        super.init(type: DiceType.Red)

        var sides = [Side]()
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Brain), count: 1))
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Steps), count: 2))
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Gun), count: 3))

        super.configureSides(sides: sides)
    }
}
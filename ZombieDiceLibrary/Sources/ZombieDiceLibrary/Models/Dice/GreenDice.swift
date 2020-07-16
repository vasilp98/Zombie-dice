public class GreenDice : Dice {
    init() {
        super.init(type: DiceType.Green)

        var sides = [Side]()
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Brain), count: 3))
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Steps), count: 2))
        sides.append(contentsOf: [Side](repeating: Side(parent: self, type: SideType.Gun), count: 1))

        super.configureSides(sides: sides)
    }
}
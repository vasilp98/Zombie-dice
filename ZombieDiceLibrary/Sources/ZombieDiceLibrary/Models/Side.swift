public class Side {
    private(set) var type: SideType
    private(set) var parent: Dice

    public init(parent: Dice, type: SideType) {
        self.parent = parent
        self.type = type
    }
}
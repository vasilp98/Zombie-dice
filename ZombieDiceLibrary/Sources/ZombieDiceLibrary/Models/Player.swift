public class Player : CustomStringConvertible, Equatable, Copyable {
    private(set) var points: Int
    private(set) var name: String
    
    public init(name: String) {
        self.points = 0
        self.name = name
    }

    public func increasePoints(by earnedPoints: Int) {
        self.points += earnedPoints
    }

    public var description: String 
    { 
        "\(self.name): \(self.points)" 
    }

    public static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }

    public func copy() -> Any {
        return Player(name: self.name)
    }
}
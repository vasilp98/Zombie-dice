public protocol PlayerProtocol : Copyable, Equatable, CustomStringConvertible {
    var name: String { get }
    
    var points: Int { get }

    func increasePoints(by earnedPoints: Int)
}
public protocol DiceProtocol : Rollable, Equatable {
    var type: DiceType { get }
}
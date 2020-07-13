public class Configurations {

    private var _pointsGoal: Int = 0
    private(set) var pointsGoal: Int {
        get {
            return self._pointsGoal
        }
        set {
            self._pointsGoal = max(newValue, 1) 
        }
    }

    private var _players = [Player]()
    private(set) var players: [Player] {
        get {
            return self._players
        }
        set {
            self._players = newValue.count > 1 ? newValue : [Player](repeating: Player(name: ""), count: 2) 
        }
    }

    public init(players: [Player], pointsGoal: Int = 13) {
        self.players = players
        self.pointsGoal = pointsGoal
    }
}
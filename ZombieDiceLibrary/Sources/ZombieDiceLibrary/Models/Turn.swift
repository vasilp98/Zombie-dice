import Foundation

public class Turn {
    private var pointsEarned: Int = 0
    private var gunshots: Int = 0
    private var player: Player
    private var isPlayerDead: Bool = false
    
    private var diceCollection: Drawable
    private let ioProcessor: IOProcessor

    public var isEnded: Bool = false

    init (player: Player, ioProcessor: IOProcessor, diceCollection: Drawable = DiceCollection()) {
        self.player = player
        self.diceCollection = diceCollection
        self.ioProcessor = ioProcessor
    }

    public func changeStatistics(diceRolled: Dice, landedSide: SideType) {
        
        switch landedSide {
            case SideType.Brain:
                self.pointsEarned += 1
                break
            case SideType.Steps:
                let answerYes = Utils.askYesNo(question: "Do you want to roll this dice again?", ioProcessor: self.ioProcessor)    
                if answerYes == true {
                    self.ioProcessor.write("\(diceRolled.type) dice is rolling again...")
                    Thread.sleep(forTimeInterval: 1)
                    let rolledSide = diceRolled.roll()
                    self.ioProcessor.write("The dice landed on \(Utils.getSideLabel(side: rolledSide))")

                    self.changeStatistics(diceRolled: diceRolled, landedSide: rolledSide)
                } 

                break
            case SideType.Gun:
                self.gunshots += 1
                if self.gunshots > 2 {
                    self.isPlayerDead = true
                }
                break
        }
    }

    public func showStatistics() {
        self.ioProcessor.write("So far this turn - \(Utils.getSideLabel(side: SideType.Brain)): \(self.pointsEarned), \(Utils.getSideLabel(side: SideType.Gun)): \(self.gunshots)")
    }

    public func askToContinueIfPossible() {
        if self.isPlayerDead == true {
            self.ioProcessor.write("You received three or more gunshots. Your turn has ended and no points are earned.")
            self.pointsEarned = 0
            self.isEnded = true
            return
        }

        if self.diceCollection.isEmpty() {
            self.ioProcessor.write("No more dices are left to be drawn. Your turn has ended.")
            self.isEnded = true
            return
        }

        let answerYes = Utils.askYesNo(question: "Do you want to continue your turn and draw 3 more dices?", ioProcessor: self.ioProcessor)
        if answerYes == false {
            self.isEnded = true
        } else {
            self.ioProcessor.writeSeparator()
        }
    }

    public func drawDices() -> ArraySlice<Dice> {
        let drawnDices = self.diceCollection.draw(numberOfDices: 3)

        return drawnDices
    }

    public func getEarnedPoints() -> Int {
        return self.pointsEarned
    }
}
import Foundation

public class Turn : TurnProtocol {
    private var pointsEarned: Int = 0
    private var gunshotsTaken: Int = 0
    private var isPlayerDead: Bool = false

    private let player: Player
    private let drawableCollection: Drawable
    private let ioProcessor: IOProcessor

    public var isEnded: Bool = false

    public init (player: Player, ioProcessor: IOProcessor, drawableCollection: Drawable) {
        self.player = player
        self.drawableCollection = drawableCollection
        self.ioProcessor = ioProcessor
    }

    public func changeStatistics(landedSide: Side) {
        
        switch landedSide.type {
            case SideType.Brain:
                self.pointsEarned += 1
                break
            case SideType.Steps:
                let answerYes = Utils.askYesNo(question: "Do you want to roll this dice again?", ioProcessor: self.ioProcessor)    
                if answerYes == true {
                    self.ioProcessor.write("\(landedSide.parent.type) dice is rolling again...")
                    Thread.sleep(forTimeInterval: 1)
                    let rolledSide = landedSide.parent.roll()
                    self.ioProcessor.write("The dice landed on \(Utils.getSideLabel(side: rolledSide.type))")

                    self.changeStatistics(landedSide: rolledSide)
                } 

                break
            case SideType.Gun:
                self.gunshotsTaken += 1
                if self.gunshotsTaken > 2 {
                    self.isPlayerDead = true
                }
                break
        }
    }

    public func showStatistics() {
        self.ioProcessor.write("So far this turn - \(Utils.getSideLabel(side: SideType.Brain)): \(self.pointsEarned), \(Utils.getSideLabel(side: SideType.Gun)): \(self.gunshotsTaken)")
    }

    public func askToContinueIfPossible() {
        if self.isPlayerDead == true {
            self.ioProcessor.write("You received three or more gunshots. Your turn has ended and no points are earned.")
            self.isEnded = true
            return
        }

        if self.drawableCollection.isEmpty() {
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
        let drawnDices = self.drawableCollection.draw(numberOfDices: 3)

        return drawnDices
    }

    public func getEarnedPoints() -> Int {
        return self.isPlayerDead ? 0 : self.pointsEarned
    }
}
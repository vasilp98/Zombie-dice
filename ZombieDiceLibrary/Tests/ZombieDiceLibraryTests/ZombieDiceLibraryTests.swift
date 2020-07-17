import XCTest
@testable import ZombieDiceLibrary

final class ZombieDiceLibraryTests: XCTestCase {
    private var container: DependencyContainerProtocol = DependencyContainer()

    override func setUp() {
        super.setUp()
        container.configureDefault()
    }

    func testGameStarting_ValidateGameIsRunning() {
        let players = [Player](repeating: Player(name: ""), count: 2)
        let configurations = Configurations(players: players)

        let gameFactory: GameFactoryProtocol = self.container.resolve()!
        let game = gameFactory.create(configurations: configurations)
        game.start()
        XCTAssertTrue(game.isRunning)
    }

    func testTurnStatistics_ValidateEarnedPoints() {
        
        let player = Player(name: "testPlayer")
        let turnFactory: TurnFactoryProtocol = self.container.resolve()!
        let turn = turnFactory.create(player: player)

        let sidesCountEarningPoints = 2
        for _ in 0..<sidesCountEarningPoints {
            let side = Side(parent: GreenDice(), type: SideType.Brain)
            turn.changeStatistics(landedSide: side)
        }

        XCTAssertEqual(turn.getEarnedPoints(), sidesCountEarningPoints)
    }

    func testTurnStatistics_ThreeGunshotsAreTaken_ValidateEarnedPoints() {
        
        let player = Player(name: "testPlayer")
        let turnFactory: TurnFactoryProtocol = self.container.resolve()!
        let turn = turnFactory.create(player: player)

        for _ in 0..<2 {
            let side = Side(parent: GreenDice(), type: SideType.Brain)
            turn.changeStatistics(landedSide: side)
        }

        for _ in 0..<3 {
            let side = Side(parent: GreenDice(), type: SideType.Gun)
            turn.changeStatistics(landedSide: side)
        }

        XCTAssertEqual(turn.getEarnedPoints(), 0)
    }

    func testTurnStatistics_ThreeGunshotsAreTaken_ValidateTurnIsEnded() {
        
        let player = Player(name: "testPlayer")
        let turnFactory: TurnFactoryProtocol = self.container.resolve()!
        let turn = turnFactory.create(player: player)

        for _ in 0..<3 {
            let side = Side(parent: GreenDice(), type: SideType.Gun)
            turn.changeStatistics(landedSide: side)
        }

        turn.askToContinueIfPossible()

        XCTAssertTrue(turn.isEnded)
    }

    func testDrawableCollection_ValidateDrawnDicesCount() {
        
        let drawableCollectionFactory: DrawableCollectionFactoryProtocol = self.container.resolve()!
        let drawableCollection = drawableCollectionFactory.create()

        let numberOfDicesDrawn = 3
        let dices = drawableCollection.draw(numberOfDices: numberOfDicesDrawn)

        XCTAssertEqual(dices.count, numberOfDicesDrawn)
    }

    func testDrawableCollection_DrawAllItems_ValidateCollectionIsEmpty() {
        
        let drawableCollectionFactory: DrawableCollectionFactoryProtocol = self.container.resolve()!
        let drawableCollection = drawableCollectionFactory.create()

        let numberOfDicesDrawn = 13
        drawableCollection.draw(numberOfDices: numberOfDicesDrawn)

        XCTAssertTrue(drawableCollection.isEmpty())
    }

    static var allTests = [
        ("testGameStarting_ValidateGameIsRunning", testGameStarting_ValidateGameIsRunning),
        ("testTurnStatistics_ValidateEarnedPoints", testTurnStatistics_ValidateEarnedPoints),
        ("testTurnStatistics_ThreeGunshotsAreTaken_ValidateEarnedPoints", testTurnStatistics_ThreeGunshotsAreTaken_ValidateEarnedPoints), 
        ("testTurnStatistics_ThreeGunshotsAreTaken_ValidateTurnIsEnded", testTurnStatistics_ThreeGunshotsAreTaken_ValidateTurnIsEnded),
        ("testDrawableCollection_ValidateDrawnDicesCount", testDrawableCollection_ValidateDrawnDicesCount),
        ("testDrawableCollection_DrawAllItems_ValidateCollectionIsEmpty", testDrawableCollection_DrawAllItems_ValidateCollectionIsEmpty)
    ]
}

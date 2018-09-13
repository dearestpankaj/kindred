import XCTest
@testable import KindredGameApp

class GameTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGame_Init_Success() {
        let testSuccessfulJSON = ["gameName": "Hardwell",
                                    "gameId": "10174@greentube",
                                    "imageUrl": "https://a1s.unicdn.net/polopoly_fs/1.995081.1517934298!/image/1343065679.jpg"] as [String : AnyObject]
        XCTAssertNotNil(Game(json: testSuccessfulJSON))
    }
    
    func testGame_Init_Fail() {
        let testSuccessfulJSON = ["gameName": "Hardwell",
                                  "imageUrl": "https://a1s.unicdn.net/polopoly_fs/1.995081.1517934298!/image/1343065679.jpg"] as [String : AnyObject]
        XCTAssertNil(Game(json: testSuccessfulJSON))
    }
}

import XCTest
@testable import KindredGameApp

class GamesRemoteDataSourceTest: XCTestCase {
    let remoteDataSource = GamesRemoteDataSource()
    let mockNetworkManager = MockNetworkManager()
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetGameList_Success() {
        mockNetworkManager.isSuccess = true
        remoteDataSource.networkManager = mockNetworkManager
        _ = remoteDataSource.getGameList { (games, error) in
            XCTAssertNotNil(games)
            XCTAssertNil(error)
            XCTAssert(((games?.count) ?? 0) > 0)
        }
    }
    
    func testGetGameList_Fail() {
        mockNetworkManager.isSuccess = false
        remoteDataSource.networkManager = mockNetworkManager
        _ = remoteDataSource.getGameList { (games, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(games)
        }
    }
}

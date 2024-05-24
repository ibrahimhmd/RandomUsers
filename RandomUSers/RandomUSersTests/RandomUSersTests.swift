

import XCTest
@testable import RandomUSers

final class RandomUSersTests: XCTestCase {
    
    func testUserModel() throws {
        let jsonData = getTestJSONData()

        do {
          _ = try JSONDecoder().decode(Response.self, from: jsonData)
        }
        catch {
          XCTFail("Failed to decode JSON into the model: \(error)")
        }
      }
    
    private func getTestJSONData() -> Data {
       guard let path = Bundle.main.path(forResource: "RandomUsers",
                                         ofType: "json") else {
         fatalError("RandomUsers.json file not found")
       }
       let internalURL = URL(fileURLWithPath: path)
       return try! Data(contentsOf: internalURL)
     }
    

}

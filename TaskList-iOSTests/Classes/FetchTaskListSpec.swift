import XCTest
@testable import TaskList_iOS
import Quick
import Nimble
import BrightFutures
import Result
import Mockingjay

class FetchTaskListSpec: QuickSpec {
    
    var tasks: [Task]!
    
    override func spec() {
        
        describe("fetching task list") {
            
            beforeEach {
                let body = [
                    ["id": "id1", "title": "title1", "description": "description1", "dueDate": "2016-07-14T15:00:00", "completed": true],
                    ["id": "id2", "title": "title2", "description": "description2", "dueDate": "2016-07-14T15:00:01", "completed": false],
                    ["id": "id3", "title": "title3", "description": "description3", "dueDate": "2016-07-14T15:00:02", "completed": true],
                ]
                self.stub(http(.GET, uri: "/tasks"), builder: json(body))
            }
            
            it("should return expected task list") {
                let service = FetchTaskListService()
                
                let f = service.findAll()
                
                expect(f.value).toEventually(haveCount(3))
            }
            
        }
        
    }
    
}

import UIKit
import XCTest

//Singleton Design example
class ClubAssociation {
    
    private var members: [Client] = []
    
    //Create shared instance to be access
    static var instance: ClubAssociation = {
        let instance = ClubAssociation()
        
        //config...
        
        return instance
    }()
    
    //Constructor must be private to prevent "new" operator calls
    private init() {}
    
    func setMembers(members: [Client]) {
        for member in members {
            self.members.append(member)
        }
    }
    
    func getMembers() -> [Client]{
        return self.members
    }
    
}

struct Client {
    private var name: String?
    private var data: String?
    
    init(name: String, data: String) {
        self.name = name
        self.data = data
    }
}


class SingletonTest: XCTestCase {
    
    func testNewMember_sameInstance_differentVariables() {
        
        //shared instance but in different variables
        var instance1 = ClubAssociation.instance
        var instance2 = ClubAssociation.instance

        instance1.setMembers(members: [Client(name: "Rafael", data: "10/10/204"),
                                       Client(name: "Joseph", data: "10/10/204"),
                                       Client(name: "Marcus", data: "10/10/204")])

        instance2.setMembers(members: [Client(name: "Rodolf", data: "10/10/204"),
                                       Client(name: "Zetty", data: "10/10/204"),
                                       Client(name: "Ralph", data: "10/10/204")])


        //if singleton works both variables are the same instance and will print the same values
        if (instance1 === instance2) {
            for member in instance1.getMembers() {
                print("[instance 1] - \(member)")
            }
            
            for member in instance2.getMembers() {
                print("[instance 2] - \(member)")
            }
        }else {
            print("variables contain different instances.")
        }
    }
}
SingletonTest.defaultTestSuite.run()



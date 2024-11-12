import UIKit
import XCTest

//Common payment card service
protocol PaymentServiceCard {
    func debit() -> String
    func credit() -> String
}

//Common payment pix service
protocol PixServicePayment {
    func pix() -> String
}

//Store 1 that is newer and implements payment service card .
struct Store1: PaymentServiceCard {
    
    let name: String = "GameStore"
    
    func debit() -> String {
        return "[Payment - debit]: Payment successfully!"
    }
    
    func credit() -> String {
        return "[Payment - credit]: Payment successfully!"
    }
    
}

//Store 2 is more older and need to be updated with new payment services.
struct Store2 {
    let name: String = "GameShark"
    
    func money() -> String {
        return "[Payment - money]: Payment successfully!"
    }
}


//Adapter enters here to implements the interfaces card services and keep the legacy of money payments.
extension Store2: PaymentServiceCard, PixServicePayment {
    
    func debit() -> String {
        return "[Payment - debit]: Payment successfully!"
    }
    
    func credit() -> String {
        return "[Payment - credit]: Payment successfully!"
    }
    
    func pix() -> String {
        return "[Payment - pix]: Payment successfully!"
    }
}

struct Client {
    private let name: String
    
    init (name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
}

class AdapterTest: XCTestCase {
    func testAdapter() {
        let client1 = Client(name: "Rafael")
        let client2 = Client(name: "Joseph")

        let store1 = Store1()
        let store2 = Store2()


        print("Client \(client1.getName()) buy a notebook in the \(store1.name). \n \(store1.debit())")
        print("Client \(client2.getName()) buy a ps4 in the \(store2.name). \n \(store2.credit())")
    }
}
AdapterTest.defaultTestSuite.run()




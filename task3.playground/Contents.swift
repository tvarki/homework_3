import UIKit

class Person {
    var firstName: String
    var secondName: String
    var middleName: String
    
    var fullName: String {
        get {
            return "\(secondName) \(firstName) \(middleName)"}
    }
    var age: Int
    var pasport: Pasport?
    
    init(name: String, secondName: String, middleName: String, age: Int){
        self.firstName = name
        self.secondName = secondName
        self.middleName = middleName
        self.age = age
        print("Person \(self.firstName) инициализируется")
        
    }
    
    
    init?(fullName: String, age: Int){
        
        let nameParts = fullName.split(separator: " ")
        guard nameParts.count == 3 else {
            print("Полное имя(ФИО) должно содержать три слова. Сейчас \(nameParts.count)")
            return nil
        }
        
        self.secondName = String(nameParts[0])
        self.firstName = String(nameParts[1])
        self.middleName = String(nameParts[2])
        
        self.age = age
        print("Person \(self.firstName) инициализируется")
        
    }
    
    deinit {
        print("Person \(self.fullName) деинициализируется")
    }
}

class Pasport {
    let serial: Int
    let number: Int
    let date: String
    weak var person: Person?
    
    
    init(serial: Int, number: Int, date: String){
        print("Pasport #\(number) инициализируется")
        self.date = date
        self.number = number
        self.serial = serial
    }
    
    deinit {
        print("Pasport with number \(number) деинициализируется")
    }
    
    
}

//

var person: Person?
var pasport: Pasport?

func createAndClear(){
    
    person = Person(fullName: "Ivanov Ivan Ivanovich",age:23)
    pasport = Pasport(serial: 1, number: 1, date: "15.10.2001")
    
    guard person != nil , pasport != nil else { return }
    person!.pasport = pasport
    pasport!.person = person
    print(person!.fullName)
    person!.firstName = "123"
    
    print(pasport!.person!.fullName)
    
    person = nil
    pasport = nil
    
    
}

createAndClear()




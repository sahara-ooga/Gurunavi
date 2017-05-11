import Foundation
import SwiftyJSON

struct JSONParser{
    static func parse(name:String)->JSON{
        let path : String = Bundle.main.path(forResource: name, ofType: "json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let data : Data = fileHandle.readDataToEndOfFile() as Data
        return JSON(data: data)
    }
}

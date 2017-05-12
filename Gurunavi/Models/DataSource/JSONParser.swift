import Foundation
import SwiftyJSON

struct JSONParser{
    
    /// プロジェクト内のJSONファイルをパースすることを想定
    ///
    /// - Parameter name: プロジェクト内のJSONファイルの名前
    /// - Returns: パースされたJSONファイル
    static func parse(name:String)->JSON{
        let path : String = Bundle.main.path(forResource: name, ofType: "json")!
        let fileHandle : FileHandle = FileHandle(forReadingAtPath: path)!
        let data : Data = fileHandle.readDataToEndOfFile() as Data
        return JSON(data: data)
    }
    
    //TODO:APIから取得したJSONファイルをパースして返す
    //Any->JSON型->モデルオブジェクト（の配列）
}

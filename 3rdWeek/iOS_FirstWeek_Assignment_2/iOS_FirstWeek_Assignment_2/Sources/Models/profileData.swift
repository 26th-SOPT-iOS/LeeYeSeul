import UIKit

struct ProfileData{
    var profileImg: String
    var profileName: String
    var profileMsg: String
    
    init(name: String, msg : String, imgName: String){
        self.profileImg = imgName
        self.profileName = name
        self.profileMsg = msg
    }
    
}

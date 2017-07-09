struct PostDto {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init() {
        userId = 0
        id = 0
        title = ""
        body = ""
    }
    
    init(jsonDict: [String: Any]) {
        userId = jsonDict["userId"] as? Int ?? 0
        id = jsonDict["id"] as? Int ?? 0
        title = jsonDict["title"] as? String ?? ""
        body = jsonDict["body"] as? String ?? ""
    }
    
}

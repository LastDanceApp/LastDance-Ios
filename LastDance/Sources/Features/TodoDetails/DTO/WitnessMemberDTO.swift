
struct WitnessMemberDTO {
    let memberId: Int
    let name: String
}

extension WitnessMemberDTO {
    static let dummyList: [WitnessMemberDTO] = [
        WitnessMemberDTO(memberId: 1, name: "준용"),
        WitnessMemberDTO(memberId: 2, name: "지원"),
        WitnessMemberDTO(memberId: 3, name: "민수"),
        WitnessMemberDTO(memberId: 4, name: "지연")
    ]
    
    static let dummyOne = WitnessMemberDTO(memberId: 1, name: "준용")
    
}

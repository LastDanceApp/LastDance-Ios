//
//  LoginDTO.swift
//  LastDance
//
//  Created by 김준용 on 2/16/26.
//

struct LoginRequest: Encodable{
    
    let id: String
    let pw: String
    
}

struct LoginResponse: Decodable{
    
    let userId: Int
    let loginId: String
    let name: String
    let accessToken: String
}


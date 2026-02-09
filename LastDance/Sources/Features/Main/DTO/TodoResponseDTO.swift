//
//  TodoResponseDTO.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
struct TodoResponseDTO {
    let title: String
    let leftDays: Int
    let status: TodoStatus
    let limitDays: Int
    let watchersNum: Int
    let isChecked: Bool
}

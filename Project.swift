import ProjectDescription

let project = Project(
    name: "LastDance",
    packages: [.remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.10.0"))],
    targets: [
        .target(
            name: "LastDance",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.LastDance",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: [
                .glob("LastDance/Sources/**", excluding: ["**/.gitkeep"])
            ],
            resources: [
                .glob("LastDance/Resources/**", excluding: ["**/.gitkeep"])
            ],
            dependencies: []
        )
    ]
)
//
//let project = Project(
//    name: "LastDance",
//    targets: [
//        .target(
//            name: "LastDance",
//            destinations: .iOS,
//            product: .app,
//            bundleId: "dev.tuist.LastDance",
//            infoPlist: .extendingDefault(
//                with: [
//                    "UILaunchScreen": [
//                        "UIColorName": "",
//                        "UIImageName": "",
//                    ],
//                ]
//            ),
//            buildableFolders: [
//                "LastDance/Sources",
//                "LastDance/Resources",
//            ],
//            dependencies: []
//        ),
//        .target(
//            name: "LastDanceTests",
//            destinations: .iOS,
//            product: .unitTests,
//            bundleId: "dev.tuist.LastDanceTests",
//            infoPlist: .default,
//            buildableFolders: [
//                "LastDance/Tests"
//            ],
//            dependencies: [.target(name: "LastDance")]
//        ),
//    ]
//)

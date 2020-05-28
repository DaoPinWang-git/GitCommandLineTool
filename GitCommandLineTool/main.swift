//
//  main.swift
//  TestCommandLineTool
//
//  Created by dpwong on 2020/5/21.
//  Copyright © 2020 dpwong. All rights reserved.
//

import Foundation

// 输入 dp --push 合并代码
// args = ["dp", "--push", "合并代码"]

let args = Swift.CommandLine.arguments

let path = "/Users/dpwong/Documents/CradleMaternalBaby"

if args[1] == "--push" {
    let log : String
    if (args.count == 2) {
        log = "合并代码"
    }else{
        log = args[2]
    }

    let process = Process()
    process.launchPath = "/bin/bash"
    let cmd = """
    cd \(path)
    git add .
    git commit -m '\(log)'
    git pull origin dev_dpwong
    git push origin dev_dpwong
    """
    process.arguments = ["-c", cmd]
    process.launch()
    process.waitUntilExit()

}

if args[1] == "--pull" {

    let process = Process()
    process.launchPath = "/bin/bash"
    let cmd = """
    cd \(path)
    git add .
    git commit -m '合并代码'
    git pull origin dev_dpwong
    """
    process.arguments = ["-c", cmd]
    process.launch()
    process.waitUntilExit()

}


if args[1] == "test" {

//    let queue = DispatchQueue.main

    let queue = DispatchQueue(label: "queue",attributes: .concurrent)

    print("start")
    print("\(Thread.current)")

    queue.async {
        print("\(Thread.current)")

        print("---1")
        sleep(2)
        print("1")
    }

    print("-----")

    queue.async {
        print("\(Thread.current)")
        print("---2")
        sleep(1)
        print("2")
    }

    print("end")


//    RunLoop.current.add(Port(), forMode: .default)
    CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 1, true)


//    CFRunLoopStop(RunLoop.current.getCFRunLoop())

}

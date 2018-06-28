//
//  MKOperator.swift
//  MKBuilder
//
//  Created by NishiokaKohei on 2018/06/29.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import Foundation
import MMMarkdown

public class MKOperator : NSObject {

    private var html: String = ""

    public func read() -> String {

        let current = FileManager.default.currentDirectoryPath
        guard let filePath = Bundle.main.path(forResource: "", ofType: "md", inDirectory: current) else {
            return "can not be found"
        }

        guard let content = try? String(contentsOfFile: filePath) else {
            return "no content"
        }

        return content

    }

    public func convert(with markdonw: String) {

        if let htmlString = try? MMMarkdown.htmlString(withMarkdown: markdonw) {

            let style = "<style>img { max-width: 300px; height: auto; }</style>\n"
            let body = style + htmlString

            print(body)

            html = body

        }

    }

    public func output(_ path: String?) {

        let current = FileManager.default.currentDirectoryPath + "/" + "output.html"

        let urlString = path ?? current

        let url = URL(string: urlString)!

        print(urlString)

        MKOperator.write(html, to: url)
    }


    public static func write(_ html: String, to url: URL) {

        do {

            try html.write(to: url, atomically: true, encoding: String.Encoding.utf8)

        } catch {

            print(error)

        }

    }

}

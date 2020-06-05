//
//  CView.swift
//  chapter24
//
//  Created by HEE TAE YANG on 2020/06/05.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct CView: View {
    var body: some View {
        HStack(alignment: .oneThird) {
            Rectangle()
                .foregroundColor(Color.green)
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color.red)
                .alignmentGuide(.oneThird, computeValue: { d in d [VerticalAlignment.bottom]})
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color.blue)
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color.yellow)
                .alignmentGuide(.oneThird, computeValue: { d in d [VerticalAlignment.top]})
                .frame(width: 50, height: 200)
                .cornerRadius(25) // 모서리를 둥글게하는 수정자. frame의 width사이즈에 맞춰 최대 사이즈를 조절할수있다.
        }
    }
}

extension VerticalAlignment { // 이 extension 은
    private enum OneThird: AlignmentID { // Onethird 프로퍼티, AlignmentID 프로토콜, {} 클로저 표현식
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

struct CView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}

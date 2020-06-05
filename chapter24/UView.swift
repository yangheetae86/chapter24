//
//  SView.swift
//  chapter24
//
//  Created by HEE TAE YANG on 2020/06/05.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct UView: View {
    var body: some View {
        ZStack(alignment: .myAlignment) {
            
            Rectangle()
            .foregroundColor(Color.green)
            .alignmentGuide(HorizontalAlignment.myAlignment)
                { d in d[.trailing]}
            .alignmentGuide(VerticalAlignment.myAlignment)
                { d in d[VerticalAlignment.center]}
            .frame(width: 100, height: 100)
            
            Circle()
            .foregroundColor(Color.orange)
            .alignmentGuide(HorizontalAlignment.myAlignment)
                { d in d[.leading]}
            .alignmentGuide(VerticalAlignment.myAlignment)
                { d in d[.top]}
            .frame(width: 100, height: 100)
            
            Rectangle()
                .foregroundColor(Color.red)
                .alignmentGuide(VerticalAlignment.myAlignment)
                    { d in d[VerticalAlignment.top]}
                .alignmentGuide(HorizontalAlignment.myAlignment)
                    { d in d[HorizontalAlignment.center]}
                .frame(width: 100, height: 100)
            
            
            
//            Circle()
//                .foregroundColor(Color.orange)
//                .alignmentGuide(HorizontalAlignment.myAlignment)
//                    { d in d[.leading]}
//                .alignmentGuide(VerticalAlignment.myAlignment)
//                    { d in d[.top]}
//                .frame(width: 100, height: 100)
        }
    }
}

extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat
        { d[HorizontalAlignment.center]}
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    enum MyVertical: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat
        { d[VerticalAlignment.center] }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}


struct UView_Previews: PreviewProvider {
    static var previews: some View {
        UView()
    }
}

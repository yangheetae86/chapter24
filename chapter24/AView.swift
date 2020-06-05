//
//  SView.swift
//  chapter24
//
//  Created by HEE TAE YANG on 2020/06/05.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct AView: View {
    var body: some View {
        HStack(alignment: .crossAlignment2, spacing: 20) {
            
            Circle()
                .foregroundColor(Color.purple)
                .alignmentGuide(.crossAlignment2,
                    computeValue: {d in d[VerticalAlignment.center] })
                .frame(width: 50, height: 50)
            
            VStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 50, height: 50)
                Rectangle()
                    .foregroundColor(Color.red)
                    .alignmentGuide(.crossAlignment2,computeValue: {d in d[VerticalAlignment.center] })
                    .frame(width: 50, height: 50)
                Rectangle()
                    .foregroundColor(Color.blue)
//                    .alignmentGuide(.crossAlignment2,computeValue: {d in d[VerticalAlignment.center] })
                    
                    .frame(width: 50, height: 50)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .frame(width: 50, height: 50)
            }
        }

    }
}

extension VerticalAlignment {
    private enum CrossAlignment2: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let crossAlignment2 = VerticalAlignment(CrossAlignment2.self)
}

struct AView_Previews: PreviewProvider {
    static var previews: some View {
        AView()
    }
}

//
//  SView.swift
//  chapter24
//
//  Created by HEE TAE YANG on 2020/06/05.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct SView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Circle()
                .foregroundColor(Color.purple)
                .frame(width: 50, height: 50)
            VStack {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 50, height: 50)
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 50, height: 50)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 50, height: 50)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .frame(width: 50, height: 50)
            }
        }

    }
}

extension VerticalAlignment {
    private enum CrossAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

struct SView_Previews: PreviewProvider {
    static var previews: some View {
        SView()
    }
}

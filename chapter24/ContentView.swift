//
//  ContentView.swift
//  chapter24
//
//  Created by HEE TAE YANG on 2020/06/05.
//  Copyright © 2020 yht. All rights reserved.
//
// 24 스위프트 스택 정렬과 정렬 가이드
// 복잡한 사용자 인터페이스 레이아웃ㄷ을 설계할 때는 스위프트유아이 스택 뷰에서 제공하는 표준 졍렬방법 이상의 방법이 필요하다.
// 이를 염두에 두고 컨테이너 정렬, 정렬 가이드, 커스텀 정렬, 그리고 서로 다른 스택들 간의 정렬 구현까지..

// 24.1 컨테이너 정렬.
// 스택을 사용할때 가장 기본적인 정렬 방법으로 스택에 포함된 하위 뷰들이 스택 내에서 정렬되는 방식을 정의한다. 암묵적으로 정렬되었다고 표현.
// 24.2 정렬 가이드
// 정렬 가이드는 뷰가 스택에 포함된 다른 뷰와 정렬해야 할 때 사용되는 커스텀 포지션을 정의하는데 사용된다. 이것은 중앙정렬, 앞쪽정렬, 상단 정렬 등의 표준 정렬 타입보다 더 복잡한 정렬을 구현할수 있게 해준다.
// 정렬 가이드는 표준 정렬 타입과 클로저를 인자로 받는 alignmentGuide() 수정자를 사용하며 뷰에 적용되며, 클로저는 표준 정렬을 기준으로 하는 뷰 내에 위치를 가리키는 값을 계산하여 반환한다.
/*
 Structure
 ViewDimensions
 A view’s size and its alignment guides in its own coordinate space.
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack(alignment: .trailing) { //VStack 선언부는 세 개의 하위 뷰를 포함하는 간단한 VStack으로 구성한다. 특정 컨테이너 정렬 값이 없으면 중앙 정렬(.center)을 디폴트로 한다.
//            Text("This is some name")
//            Text("This is some sexual")
//            Text("This is some age")
            
            //VStack은 .leading이나 .trailing 정렬을 사용할 수 있다.
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text("This is some name")
                    .font(.title)
                Text("This is some sexual")
                    .font(.caption)
                Text("This is some age")
                    .font(.largeTitle)
            }
    
            VStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: 120, height: 50)
                Rectangle()
                    .foregroundColor(Color.red)
//                    .alignmentGuide(.leading, computeValue: {_ in 100}) //반환이름이 필요없을때는 _, 정렬 가이드를 사용할 때 alignmentGuide() 수정자에 지정된 정렬 타입은 부모 스택에 적용된 정렬 타입(38줄)과 일치해야 한다.
                    //오프셋(offset)을 하드코딩하는 대신, 클로저에 전달된 ViewDimensions 객체의 프로퍼티를 정렬 가이드 위치를 계산하는 데 이용할수있다. 예를들어, width 프로퍼티를 이용하면 뷰의 앞쪽 3분의 1위치로 배치할수있다.
                    .alignmentGuide(.leading, computeValue: {d in d.width/2}) // width/2 는 red컬러 넓이의 2분의1 위치를 뜻한다.
                    .alignmentGuide(.leading, computeValue: {d in d[HorizontalAlignment.trailing]+20})
                    .frame(width: 200, height: 50)
        
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 180, height: 50)
            }
        }
    }
}

extension VerticalAlignment {
    private enum Onethird: AlignmentID { // Onethird 프로퍼티, AlignmentID 프로토콜, {} 클로저 표현식
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3
        }
    }
    static let onethird = VerticalAlignment(Onethird.self)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

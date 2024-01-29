//
//  SecondCellView.swift
//  TestTwoCells
//
//  Created by jefferson on 29.01.24.
//

import SwiftUI

struct SecondCellView: View {
    
    private let firstStakesCount: Double = 16
    private let secondStakesCount: Double = 11
    private let thirdStakesCount: Double = 5
    
    private var totalStakes: Double {
        firstStakesCount + secondStakesCount + thirdStakesCount
    }
    
    private var bodyText: String {
        "\(Int(totalStakes)) ставки"
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Выигрыши/проигрыши по букмекерам")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                HStack {
                    Image("BookmakerLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 50)
                    Text(bodyText)
                        .bold()
                    Spacer()
                }
                SplitProgressBarView(
                    firstStakesCount: firstStakesCount,
                    secondStakesCount: secondStakesCount,
                    thirdStakesCount: thirdStakesCount
                )
                .frame(height: 20)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}

struct SplitProgressBarView: View {
    let firstStakesCount: Double
    let secondStakesCount: Double
    let thirdStakesCount: Double
    
    private var totalStakes: Double {
        firstStakesCount + secondStakesCount + thirdStakesCount
    }
    private var firstPercentage: Int {
        Int(round(firstStakesCount / totalStakes * 100))
    }
    
    private var secondPercentage: Int {
        Int(round(secondStakesCount / totalStakes * 100))
    }
    
    private var thirdPercentage: Int {
        Int(round(thirdStakesCount / totalStakes * 100))
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width: (geometry.size.width * CGFloat(firstPercentage) / 100) - 5, height: 10)
                Text("\(Int(firstStakesCount)) (\(firstPercentage))%")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .offset(y: 20)
                Rectangle()
                    .foregroundColor(Color("DarkRed"))
                    .frame(width: (geometry.size.width * CGFloat(self.secondPercentage) / 100) - 5, height: 10)
                    .offset(x: geometry.size.width * CGFloat(self.firstPercentage) / 100)
                Text("\(Int(secondStakesCount)) (\(secondPercentage))%")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .offset(x: geometry.size.width * CGFloat(self.firstPercentage) / 100 ,y: 20)
                    .frame(alignment: .trailing)
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.8 ))
                    .frame(width: geometry.size.width * CGFloat(100 - firstPercentage - self.secondPercentage) / 100, height: 10)
                    .offset(x: geometry.size.width * (CGFloat(firstPercentage + secondPercentage) / 100))
                Text("\(Int(thirdStakesCount)) (\(thirdPercentage))%")
                    .bold()
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .offset(y: 20)
            }
        }
    }
}

struct SecondCellView_Previews: PreviewProvider {
    static var previews: some View {
        SecondCellView()
    }
}

//
//  CellView.swift
//  TestTwoCells
//
//  Created by jefferson on 29.01.24.
//

import SwiftUI

struct CellView: View {
    private let percentages: [Double] = [1.94, 2.17, 1.26]
    private let text = ["Выигрыш", "Проигрыш", "Возврат"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Средние коэффициенты")
                    .font(.headline)
                Spacer()
            }
            ForEach(0..<percentages.count, id: \.self) { index in
                GeometryReader { container in
                    HStack {
                        ProgressBar(value: percentages[index], color: backgroundColorFor(index))
                        Text(text[index])
                            .frame(width: container.size.width / 4, height: 10, alignment: .leading)
                            .foregroundColor(.gray)
                            .font(.system(size: container.size.height))
                        Text(String(format: "%.2f", percentages[index]))
                            .bold()
                    }
                }
            }
        }
    }
    
    private func backgroundColorFor(_ index: Int) -> Color {
        switch index {
        case 0:
            return Color.green
        case 1:
            return Color("DarkRed")
        default:
            return Color.gray
        }
    }
}

struct ProgressBar: View {
    let value: Double
    let color: Color
    private let maxPercent: Double = 3.0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 10)
                    .foregroundColor(Color.gray.opacity(0.3))
                Rectangle()
                    .frame(width: CGFloat(value / maxPercent) * geometry.size.width, height: 10)
                    .foregroundColor(color)
            }
            .padding(.vertical, 5)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
            .frame(height: 100)
    }
}

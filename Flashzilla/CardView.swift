//
//  CardView.swift
//  Flashzilla
//
//  Created by APPLE on 15/09/24.
//

import SwiftUI



struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @State private var offset = CGSize.zero
    @State private var showCard = false
    
    let card:Card
    var removal: (() -> Void)? = nil
    var body: some View {
        ZStack{
           RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor
                 ? .white
                 : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    accessibilityDifferentiateWithoutColor
                    ? nil
                    : RoundedRectangle(cornerRadius: 25)
                            .fill(offset.width > 0 ? .green : .red)
                )
                .shadow(radius: 10)
            VStack{
                Text(card.prompt)
                    .font(.title)
                    .foregroundStyle(.black)
                if showCard{
                    Text(card.answer)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
            
        }
        .frame(width:450,height:250)
        .rotationEffect(.degrees(Double(offset.width/5.0)))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .gesture(
              DragGesture()
                .onChanged{ gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        //remove the card
                        removal?()
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            showCard.toggle()
        }

    }
}

#Preview {
    CardView(card: .example)
}

//
//  CardView.swift
//  PaymentDetails
//
//  Created by Sai Raghu Varma Kallepalli on 17/9/20.
//

import SwiftUI

struct CardView: View {
    
    var cardDetails: CardModel = CardModel()
    @Binding var isShowingFront: Bool
    
    var body: some View {
        VStack {
            VStack {
                Group {
                    if isShowingFront {
                        CardFrontView(card: cardDetails, statusImage: "icloud.fill")
                    } else {
                        CardRearView(name: cardDetails.name, cvv: cardDetails.cvv)
                    }
                }
            }
            .rotation3DEffect(
                .degrees(isShowingFront ? 360 : .zero),
                axis: (x: 1.0, y: 1.0, z: 0))
        }
        .onTapGesture(count: 1, perform: {
            withAnimation(.interpolatingSpring(mass: 1,
                                               stiffness: 100,
                                               damping: 10,
                                               initialVelocity: 0)) {
                self.isShowingFront.toggle()
            }
        })
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardDetails: CardModel(), isShowingFront: .constant(true))
    }
}
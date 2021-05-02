//
//  PageUIView.swift
//  LiquidSwipeBook
//
//  Created by Shreyas Vilaschandra Bhike on 02/05/21.
//

import SwiftUI

struct PageUIView: View {
    var body: some View {
        Page()
    }
}

struct PageUIView_Previews: PreviewProvider {
    static var previews: some View {
        PageUIView()
    }
}


struct Page: View {
    var body: some View {
        ZStack{
            
            
            
            
            VStack{
                

                
                HStack{
                Text("CHAPTER 01")
                    .font(.system(size: 40))
                    .fontWeight(.light)
                    
                    
                    Spacer().frame(width: 180, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 300, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .opacity(0.2)
                    .offset(x: 50, y: 0)
                    
               RoundedRectangle(cornerRadius: 3)
                        .frame(width: 400, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(0.2)
                    
                ForEach(0 ..< 15) {
                            Rectangle()
                            .frame(width: 400, height: 30, alignment: .center)
                            .opacity(0.2)
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(Double($0) * 0))
                                                    
                }
                
                
            
            }
            
        }
    }
}

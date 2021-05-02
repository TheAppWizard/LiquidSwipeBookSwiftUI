//
//  ContentView.swift
//  LiquidSwipeBook
//
//  Created by Shreyas Vilaschandra Bhike on 02/05/21.
//  The App Wizard
//  Instagram :  theappwizard2408

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
        SwipeView()
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
































//Home -> Swipe
struct SwipeView: View {
    
    
    @State var offset : CGSize = .zero
    @State var showMainView = false
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [.orange, .red]), center: .center, startRadius: 2, endRadius: 650)
                
                
                
                
                //Clip Content
                .overlay(
                    VStack(alignment: .leading, spacing: 5, content: {
                        
                        
                        Image("the")
                            .resizable()
                            .frame(width: 200, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .opacity(0.9)
                            .offset(x: 80, y: 10.0)
                        
                        Image("ti")
                            .resizable()
                            .frame(width: 410, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .opacity(1)
                            .offset(x: 50, y: 10.0)
                        
                        Text("By The App Wizard")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                            .offset(x: 220, y: 0)
                        
                        
                        Image("spartan")
                            .resizable()
                            .frame(width: 480, height: 350, alignment: .center)
                            .offset(x: 20, y: 180)
                            .opacity(1)
                           
                            

                    })
                    .foregroundColor(.red)
                    .shadow(color: .red, radius: 1, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal,30)
                    .offset(x : -15)
                )
                
                ///
                .clipShape(LiquidSwipe(Offset: offset))
                .ignoresSafeArea()
                
                
                
                
                //---------------
                .overlay(
                Text("01")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .frame(width: 50, height: 50)
                    .contentShape(Rectangle())
                    .gesture(DragGesture().onChanged({ (value) in
                        
//                        let offset = value.translation
//                        print(offset)
                        
                        
                        withAnimation(.interactiveSpring(response : 0.7 , dampingFraction : 0.6 , blendDuration : 0.6)){
                            
                            offset = value.translation
                            
                        }
                        
                    }).onEnded({ (value) in
                        
                        
                        let screen = UIScreen.main.bounds
                        withAnimation(.spring()){
                            
                            if -offset.width > screen.width / 2 {
                                
                                offset.width = -screen.height
                                showMainView.toggle()
                                
                            }
                            
                            else {
                                offset = .zero
                            }
                            
                        }
                        
                        
                    }))
                    .offset(x: 15, y: 58)
                    .opacity(offset == .zero ? 1 : 0 )

                    ,alignment: .topTrailing
                        
                )
                //---------------
            
                .padding(.trailing)
            
            
            if showMainView {
                
                
                //
               PageUIView()
                    
                    
                    
                    
                    .onTapGesture {
                        withAnimation(.spring()){
                            offset = .zero
                            showMainView.toggle()
                        }
                    }
                
                
            }
            
        }
    }
}


//SwipeShape

struct LiquidSwipe : Shape {
    
    
    var Offset : CGSize
    
    
    //Animating Path
    var animatableData: CGSize.AnimatableData{
        get { return Offset.animatableData }
        set { Offset.animatableData = newValue }
        
    }
    
    
    
    func path(in rect : CGRect) -> Path {
        
        return Path {path in
            
            let width = rect.width + (-Offset.width > 0 ? Offset.width : 0)
            
            path.move(to : CGPoint(x: 0 ,y : 0))
            path.addLine(to : CGPoint (x : rect.width , y : 0))
            path.addLine(to : CGPoint (x : rect.width , y : rect.height))
            path.addLine(to: CGPoint (x : 0 ,y : rect.height))
            
            
            //Curve shape in it
            
            
            let from = 80 + (Offset.width)
            path.move(to : CGPoint (x : rect.width ,y : from > 80 ? 80 : from))
            
            
            var to = 180 + (Offset.height) + (-Offset.width)
            to = to < 180 ? 180 : to
            
            
            let midpoint : CGFloat = 80 + ((to - 80) / 2)
            
            path.addCurve(to: CGPoint(x : rect.width , y : to), control1: CGPoint(x : width - 50 , y : midpoint), control2: CGPoint (x : width - 50 , y : midpoint))
            
        }
    }
    
}

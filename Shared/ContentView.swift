//
//  ContentView.swift
//  Shared
//
//  Created by Seogun Kim on 2021/05/10.
//

import SwiftUI

// MARK : Body
struct ContentView: View {
    @State var showView: Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                Button(action: {
                    showView.toggle()
                }) {
                    Text("Some Sheet")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            // METHOD 1 - SHEET
            .sheet(isPresented: $showView, content: {
                sheetView()
            })
            
            //            // METHOD 2 - FullScreenCover
            //            .fullScreenCover(isPresented: $showView, content: {
            //                sheetView()
            //            })
            
            
            // METHOD 3 - Transition
            //            ZStack {
            //                if showView {
            //                    sheetView(showView: $showView)
            //                        .padding(.top, 100)
            //                        .transition(AnyTransition.move(edge: .bottom))
            //                        .animation(.spring())
            //                }
            //            }
            //            .zIndex(2.0)
            
            //            // METHOD 4 - Animation
            //            sheetView(showView: $showView)
            //                .padding(.top, 100)
            //                .offset(y: showView ? 0 : UIScreen.main.bounds.height)
            //                .animation(.spring())
            
            
        }
    }
}

// SheetView
struct sheetView: View {
    @Environment(\.presentationMode) var presentationMode
//    @Binding var showView: Bool
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("Paleblue")
                .ignoresSafeArea()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                //                showView.toggle()
            }) {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
            }
        }
    }
}

// MARK : PrieView
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}




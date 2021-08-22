//
//  ContentView.swift
//  HalfModalViewAssignment
//
//  Created by Frimpong Anorchie II on 2021-08-21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showModal = false
    @State var choose: Service = Service(name: "", category: "", location: "")
    @StateObject var modalViewModel = ModalViewModel()
    
    
    var body: some View {
        
        ZStack{
            
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10) {
                    ForEach(modalViewModel.searchServices){ service in
                        ServiceCardView(service: service)
                            .onTapGesture {
                                showModal = true
                                choose.name = service.name
                                choose.location = service.location
                                choose.category = service.category
                                
                            }
                        
                    }
                }
                .padding()
            }
            
            ModalView(result: choose, isShowing: $showModal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .statusBar(hidden: true)
            
        }     .statusBar(hidden: true)
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ServiceCardView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var service: Service
    var body: some View{
        VStack {
            Image(service.category)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(.top, 10)
                .padding(.leading, 10)
                .padding(.trailing, 10)
            
            HStack {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text(service.name + " • Ad")
                        .fontWeight(.medium)
                    
                    //Put the favorite icon here
                    
                    Text(service.category)
                        .font(.system(size: 15))
                    
                })
                
                Spacer(minLength: 0)
            }
            .padding()
            
        }
        .background(colorScheme == .dark ? Color(red: 28/255, green: 28/255, blue: 30/255, opacity: 255) : Color.white)
        .cornerRadius(15)
    }
}

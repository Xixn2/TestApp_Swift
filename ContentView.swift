//
//  NewMemo.swift
//  MemoGApple
//
//  Created by 서지완 on 2023/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Search = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Group {
                        HStack {
                            // 상단바 화면 구현
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 13,height: 23)
                                .foregroundColor(.yellow)
                            //.padding(.horizontal,0)
                            
                            Text("폴더")
                                .font(.system(size: 20/* weight: .bold*/))
                                .foregroundColor(.yellow)
                            Spacer()
                            
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .foregroundColor(.yellow)
                        }
                        
                        .padding(.top, 0)
                        .padding(.horizontal)
                        Spacer()
                    } // Group
                    /*HStack{
                     TextField("검색", text: $Search)
                     .foregroundColor(.white)
                     .padding(.leading, 24)
                     .padding(8.5)
                     .background(Color(red: 38 / 255, green: 35 / 255, blue: 33 / 255))
                     .cornerRadius(10)
                     .frame(width:360)
                     }
                     .padding(.top, 0)
                     .padding(.horizontal)
                     Spacer()*/
                    
                    
                    VStack {
                        List {
                            
                            Section(header: Text("메모").foregroundColor(.white).offset(x: -20,y:-5).font(.system(size: 38, weight:.bold))) {
                                TextField("검색", text: $Search)
                                    .foregroundColor(.white)
                                    .padding(.leading, 24)
                                    .padding(2)
                                    .cornerRadius(10)
                                //.frame(width:360)
                                
                                
                                
                            }.listRowBackground(Color("List"))
                            
                            
                            Section(header: Text("이전 30일").foregroundColor(.white).offset(x: -20,y:-5).font(.system(size: 25, weight:.bold))) {
                                NavigationLink(destination: SearchView(), label: {
                                    Text("메모1")
                                })
                            }.listRowBackground(Color("List"))
                                .foregroundColor(.white)
                            //                            .font(.system(size: 18, weight:.bold))
                            //.font(.custom("AppleSDGothicNeoM00", size: 18))
                            
                            
                            Section(header: Text("6월").foregroundColor(.white).offset(x: -20,y:-5).font(.system(size: 25, weight:.bold))) {
                                NavigationLink(destination: SearchView(), label: {
                                    Text("메모2")})
                                NavigationLink(destination: SearchView(), label: {
                                    Text("메모3")})
                            
                            }.listRowBackground(Color("List"))
                                .foregroundColor(.white)
                            
                            
                            Section(header: Text("5월").foregroundColor(.white).offset(x: -20,y:-5).font(.system(size: 25, weight:.bold))) {
                                NavigationLink(destination: SearchView(), label: {
                                    Text("메모4")
                                })
                                NavigationLink(destination: SearchView(), label: {
                                    Text("메모5")
                                })
                            }.listRowBackground(Color("List"))
                                .foregroundColor(.white)
                            
                            
                        }
                        .offset(y:5)
                        .listStyle(InsetGroupedListStyle())
                        .frame(width: 400, height: 680)
                        .listRowInsets(EdgeInsets.init(top:10, leading:10,bottom: 10,trailing: 10))
                        //.searchable(text: $Search)
                        //.padding(.top,0)
                        
                        
                    }
                    .listStyle(.plain)
                    .background(.black)
                    .scrollContentBackground(.hidden)
                }.frame(width: 400,height: 0) // 스크롤바
                    .border(Color.gray)
                    .offset(y:-30)
                
                
                
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(.yellow)
                        //.padding(.horizontal,-)
                    }
                    .padding(.top, -20)
                    .padding(.horizontal)
                    
                    HStack{
                        Text("5개의 메모")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        //.padding(.horizontal,30)
                        
                    }
                    .padding(.top, -20)
                    .padding(.horizontal)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

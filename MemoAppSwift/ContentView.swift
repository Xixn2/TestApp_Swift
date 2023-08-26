
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
                    
                    .padding(.top, -1)
                    .padding(.horizontal)
                    Spacer()
                } // Group
                ScrollView{
                    Group {
                        HStack {
                            // 중간 스크롤 부분
                            Text("메모")
                                .font(.system(size: 38, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal,7)
                            Spacer()
                        }
                        .padding(.top,20)
                        .padding(.horizontal)
                        Spacer()
                        
                        HStack{
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
                        Spacer()
                        
                        
                    }//그룹
                    
                
                    
                    VStack {
                        List {
                            Section(header: Text("이전 30일").foregroundColor(.black)) {
                                Text("메모1")
                                Text("메모2")
                                Text("메모3")
                            }
                        }
                        .listStyle(InsetGroupedListStyle())
                        .frame(width: 400, height: 456)
                        //.padding(.top,0)
                    }
                    .listStyle(.plain)
                    .background(.black)
                    .scrollContentBackground(.hidden)
                    //.background(Color.black)  // VStack의 배경색을 검은색으로 변경
                }
            }.frame(width: 400,height: 700)
                //.border(Color.gray)
                .offset(y:-30)
            
                  
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(.yellow)
                            //.padding(.horizontal,-20)
                            
                    
                    }
                    .padding(.top,100)
                    .padding(.horizontal)
                    
                    
                    HStack{
                        
                        Text("5개의 메모")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            // .padding(.horizontal,)
                        
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal)
                
            
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

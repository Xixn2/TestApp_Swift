import SwiftUI

struct TestView: View {
    @State private var showList = false

    var body: some View {
        VStack {
            Button("Show List") {
                showList.toggle()
            }
            if showList {
                VStack {
                    List {
                        Section(header: Text("제목").foregroundColor(.black)) {
                            Text("아이템 1")
                            Text("아이템 2")
                            Text("아이템 3")
                        }
                    }
                    .frame(width: 400, height: 200)
                }
                .background(Color.black)  // VStack의 배경색을 검은색으로 변경
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

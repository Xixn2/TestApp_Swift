import SwiftUI

struct Memo: Identifiable {
    let id = UUID()
    var content: String
}

class MemoStore: ObservableObject {
    @Published var memos: [Memo] = []
    
    func addMemo(content: String) {
        let memo = Memo(content: content)
        memos.append(memo)
    }
    
    func updateMemo(memo: Memo, content: String) {
        if let index = memos.firstIndex(where: { $0.id == memo.id }) {
            memos[index].content = content
        }
    }
    
    func deleteMemo(memo: Memo) {
        memos.removeAll(where: { $0.id == memo.id })
    }
}

struct MemoListView: View {
    @ObservedObject var memoStore = MemoStore()
    @State private var newMemoContent = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(memoStore.memos) { memo in
                        NavigationLink(destination: MemoDetailView(memo: memo, memoStore: memoStore)) {
                            Text(memo.content)
                        }
                    }
                    .onDelete(perform: deleteMemo)
                }
                
                HStack {
                    TextField("새로운 메모 작성", text: $newMemoContent)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: addMemo) {
                        Text("추가")
                    }
                }
                .padding()
            }
            .navigationBarTitle("메모장")
        }
    }
    
    private func addMemo() {
        memoStore.addMemo(content: newMemoContent)
        newMemoContent = ""
    }
    
    private func deleteMemo(at offsets: IndexSet) {
        offsets.forEach { index in
            let memo = memoStore.memos[index]
            memoStore.deleteMemo(memo: memo)
        }
    }
}

struct MemoDetailView: View {
    let memo: Memo
    @ObservedObject var memoStore: MemoStore
    @State private var editedContent: String
    
    init(memo: Memo, memoStore: MemoStore) {
        self.memo = memo
        self.memoStore = memoStore
        _editedContent = State(initialValue: memo.content)
    }
    
    var body: some View {
        VStack {
            TextField("", text: $editedContent)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: updateMemo) {
                Text("수정")
            }
            
            Spacer()
        }
        .navigationBarTitle("메모 편집")
    }
    
    private func updateMemo() {
        memoStore.updateMemo(memo: memo, content: editedContent)
    }
}

@main
struct MemoApp: App {
    var body: some Scene {
        WindowGroup {
            MemoListView()
        }
    }
}

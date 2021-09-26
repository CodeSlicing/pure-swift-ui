
import SwiftUI

/**
 A version of GeometryReader that behaves like a greedy ZStack with a default alignment of center.
 */
public struct GeometryReaderStack<Content>: View where Content: View {
    
    public var content: (GeometryProxy) -> Content
    
    private let alignment: Alignment
    
    public init(alignment: Alignment = .center, @ViewBuilder content: @escaping (GeometryProxy) -> Content) {
        self.alignment = alignment
        self.content = content
    }
    
    public var body: some View {
        GeometryReader { (geo: GeometryProxy) in
            ZStack(alignment: alignment) {
                Color.clear
                content(geo)
            }
        }
    }
}

struct CenteredGeometryReader_Previews: PreviewProvider {
    struct CenteredGeometryReader_Harness: View {

        var body: some View {
            VStack {
                Group {
                    GeometryReader { (geo: GeometryProxy) in
                        VStack {
                            Text("In a GeometryReader,")
                            Text("I'm not centered")
                            Text("by default 😭")
                        }
                    }
                    GeometryReaderStack { (geo: GeometryProxy) in
                        VStack {
                            Text("I'm centered by default in a")
                            Text("GeometryReaderStack! 🥳")
                        }
                    }
                    GeometryReaderStack(alignment: .trailing) { (geo: GeometryProxy) in
                        VStack {
                            Text("I'm trail edge aligned in a")
                            Text("GeometryReaderStack! 😎")
                        }
                    }
                }
                .frame(300, 200)
                .border(Color.black)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

    static var previews: some View {
        CenteredGeometryReader_Harness()
            .previewDevice(.iPhone_12_Pro_Max)
    }
}


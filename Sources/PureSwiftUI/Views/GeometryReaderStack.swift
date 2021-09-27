
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
            Color.clear
                .overlay(content(geo), alignment: alignment)
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
                        .padding()
                        .background(Color.blue.opacity(0.5))
                    }
                    GeometryReaderStack { (geo: GeometryProxy) in
                        VStack {
                            Text("I'm centered by default")
                            Text("in a GeometryReaderStack! 🥳")
                        }
                        .padding()
                        .background(Color.blue.opacity(0.5))
                    }
                    GeometryReaderStack(alignment: .trailing) { (geo: GeometryProxy) in
                        VStack {
                            Text("I'm trailing edge aligned")
                            Text("in a GeometryReaderStack! 😎")
                        }
                        .padding()
                        .background(Color.blue.opacity(0.5))
                    }
                    GeometryReaderStack(alignment: .bottomTrailing) { (geo: GeometryProxy) in
                        VStack {
                            Text("I'm bottom trailing edge aligned")
                            Text("with content larger than the bounds of the frame").fixedSize()
                            Text("in a GeometryReaderStack! 🤔")
                        }
                        .padding()
                        .background(Color.blue.opacity(0.5))
                    }
                }
                .frame(350, 200)
                .border(Color.black)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

    static var previews: some View {
        CenteredGeometryReader_Harness()
            .padding(100)
            .previewSizeThatFits()
    }
}


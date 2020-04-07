//
//  View+ClipShapeWithStroke.swift
//  PureSwiftUIProvingGround
//
//  Created by Adam Fordyce on 31/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

// MARK: ----- CAPSULE

public extension View {
    
    @inlinable
    func clipCapsuleWithStroke<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipCapsule()
            .strokeCapsule(content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCapsuleWithStroke<SS: ShapeStyle, TLW: UINumericType, FSS: ShapeStyle>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipCapsule(fill: fill, fillStyle: fillStyle)
            .strokeCapsule(content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCapsuleWithStroke<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipCapsule()
            .strokeCapsule(content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCapsuleWithStroke<SS: ShapeStyle, FSS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipCapsule(fill: fill, fillStyle: fillStyle)
            .strokeCapsule(content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCapsuleWithStroke<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipCapsule()
            .strokeCapsule(color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCapsuleWithStroke<TLW: UINumericType, FSS: ShapeStyle>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipCapsule(fill: fill, fillStyle: fillStyle)
            .strokeCapsule(color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCapsuleWithStroke(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipCapsule()
            .strokeCapsule(color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func clipCapsuleWithStroke<FSS: ShapeStyle>(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipCapsule(fill: fill, fillStyle: fillStyle)
            .strokeCapsule(color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: ----- CIRCLE

public extension View {
    
    @inlinable
    func clipCircleWithStroke<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipCircle()
            .strokeCircle(content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCircleWithStroke<SS: ShapeStyle, TLW: UINumericType, FSS: ShapeStyle>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipCircle(fill: fill, fillStyle: fillStyle)
            .strokeCircle(content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCircleWithStroke<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipCircle()
            .strokeCircle(content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCircleWithStroke<SS: ShapeStyle, FSS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipCircle(fill: fill, fillStyle: fillStyle)
            .strokeCircle(content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCircleWithStroke<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipCircle()
            .strokeCircle(color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCircleWithStroke<TLW: UINumericType, FSS: ShapeStyle>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipCircle(fill: fill, fillStyle: fillStyle)
            .strokeCircle(color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipCircleWithStroke(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipCircle()
            .strokeCircle(color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func clipCircleWithStroke<FSS: ShapeStyle>(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipCircle(fill: fill, fillStyle: fillStyle)
            .strokeCircle(color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}


// MARK: ----- ELLIPSE

public extension View {
    
    @inlinable
    func clipEllipseWithStroke<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipEllipse()
            .strokeEllipse(content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipEllipseWithStroke<SS: ShapeStyle, TLW: UINumericType, FSS: ShapeStyle>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipEllipse(fill: fill, fillStyle: fillStyle)
            .strokeEllipse(content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipEllipseWithStroke<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipEllipse()
            .strokeEllipse(content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipEllipseWithStroke<SS: ShapeStyle, FSS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipEllipse(fill: fill, fillStyle: fillStyle)
            .strokeEllipse(content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipEllipseWithStroke<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipEllipse()
            .strokeEllipse(color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipEllipseWithStroke<TLW: UINumericType, FSS: ShapeStyle>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipEllipse(fill: fill, fillStyle: fillStyle)
            .strokeEllipse(color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipEllipseWithStroke(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipEllipse()
            .strokeEllipse(color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func clipEllipseWithStroke<FSS: ShapeStyle>(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipEllipse(fill: fill, fillStyle: fillStyle)
            .strokeEllipse(color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: ----- RECTANGLE

public extension View {
    
    @inlinable
    func clipRectangleWithStroke<SS: ShapeStyle, TLW: UINumericType>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRectangle()
            .strokeRectangle(content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRectangleWithStroke<SS: ShapeStyle, TLW: UINumericType, FSS: ShapeStyle>(_ content: SS, lineWidth: TLW, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRectangle(fill: fill, fillStyle: fillStyle)
            .strokeRectangle(content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRectangleWithStroke<SS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRectangle()
            .strokeRectangle(content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRectangleWithStroke<SS: ShapeStyle, FSS: ShapeStyle>(_ content: SS, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRectangle(fill: fill, fillStyle: fillStyle)
            .strokeRectangle(content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRectangleWithStroke<TLW: UINumericType>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRectangle()
            .strokeRectangle(color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRectangleWithStroke<TLW: UINumericType, FSS: ShapeStyle>(_ color: Color, lineWidth: TLW, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRectangle(fill: fill, fillStyle: fillStyle)
            .strokeRectangle(color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRectangleWithStroke(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRectangle()
            .strokeRectangle(color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func clipRectangleWithStroke<FSS: ShapeStyle>(_ color: Color, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRectangle(fill: fill, fillStyle: fillStyle)
            .strokeRectangle(color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: ----- ROUNDED RECTANGLE

public extension View {

    @inlinable
    func clipRoundedRectangleWithStroke<TR: UINumericType, SS: ShapeStyle, TLW: UINumericType>(_ cornerRadius: TR, _ content: SS, lineWidth: TLW, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerRadius, cornerStyle: cornerStyle)
            .strokeRoundedRectangle(cornerRadius, content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<TR: UINumericType, SS: ShapeStyle, TLW: UINumericType, FSS: ShapeStyle>(_ cornerRadius: TR, _ content: SS, lineWidth: TLW, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerRadius, cornerStyle: cornerStyle, fill: fill, fillStyle: fillStyle)
            .strokeRoundedRectangle(cornerRadius, content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<TR: UINumericType, SS: ShapeStyle>(_ cornerRadius: TR, _ content: SS, cornerStyle: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerRadius, cornerStyle: cornerStyle)
            .strokeRoundedRectangle(cornerRadius, content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
   
    @inlinable
    func clipRoundedRectangleWithStroke<TR: UINumericType, SS: ShapeStyle, FSS: ShapeStyle>(_ cornerRadius: TR, _ content: SS, cornerStyle: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerRadius, cornerStyle: cornerStyle, fill: fill, fillStyle: fillStyle)
            .strokeRoundedRectangle(cornerRadius, content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<TR: UINumericType, TLW: UINumericType>(_ cornerRadius: TR, _ color: Color, lineWidth: TLW, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerRadius, cornerStyle: cornerStyle)
            .strokeRoundedRectangle(cornerRadius, color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<TR: UINumericType, TLW: UINumericType, FSS: ShapeStyle>(_ cornerRadius: TR, _ color: Color, lineWidth: TLW, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerRadius, cornerStyle: cornerStyle, fill: fill, fillStyle: fillStyle)
            .strokeRoundedRectangle(cornerRadius, color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<TR: UINumericType>(_ cornerRadius: TR, _ color: Color, strokeStyle: StrokeStyle, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerRadius, cornerStyle: cornerStyle)
            .strokeRoundedRectangle(cornerRadius, color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<TR: UINumericType, FSS: ShapeStyle>(_ cornerRadius: TR, _ color: Color, strokeStyle: StrokeStyle, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerRadius, cornerStyle: cornerStyle, fill: fill, fillStyle: fillStyle)
            .strokeRoundedRectangle(cornerRadius, color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

// MARK: ----- ROUNDED RECTANGLE WITH SIZE

public extension View {

    @inlinable
    func clipRoundedRectangleWithStroke<SS: ShapeStyle, TLW: UINumericType>(_ cornerSize: CGSize, _ content: SS, lineWidth: TLW, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerSize, cornerStyle: cornerStyle)
            .strokeRoundedRectangle(cornerSize, content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func clipRoundedRectangleWithStroke<SS: ShapeStyle, TLW: UINumericType, FSS: ShapeStyle>(_ cornerSize: CGSize, _ content: SS, lineWidth: TLW, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerSize, cornerStyle: cornerStyle, fill: fill, fillStyle: fillStyle)
            .strokeRoundedRectangle(cornerSize, content, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<SS: ShapeStyle>(_ cornerSize: CGSize, _ content: SS, cornerStyle: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerSize, cornerStyle: cornerStyle)
            .strokeRoundedRectangle(cornerSize, content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func clipRoundedRectangleWithStroke<SS: ShapeStyle, FSS: ShapeStyle>(_ cornerSize: CGSize, _ content: SS, cornerStyle: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerSize, cornerStyle: cornerStyle, fill: fill, fillStyle: fillStyle)
            .strokeRoundedRectangle(cornerSize, content, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<TLW: UINumericType>(_ cornerSize: CGSize, _ color: Color, lineWidth: TLW, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerSize, cornerStyle: cornerStyle)
            .strokeRoundedRectangle(cornerSize, color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }

    @inlinable
    func clipRoundedRectangleWithStroke<TLW: UINumericType, FSS: ShapeStyle>(_ cornerSize: CGSize, _ color: Color, lineWidth: TLW, cornerStyle: RoundedCornerStyle = .circular, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerSize, cornerStyle: cornerStyle, fill: fill, fillStyle: fillStyle)
            .strokeRoundedRectangle(cornerSize, color, lineWidth: lineWidth, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke(_ cornerSize: CGSize, _ color: Color, cornerStyle: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerSize, cornerStyle: cornerStyle)
            .strokeRoundedRectangle(cornerSize, color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
    
    @inlinable
    func clipRoundedRectangleWithStroke<FSS: ShapeStyle>(_ cornerSize: CGSize, _ color: Color, cornerStyle: RoundedCornerStyle = .circular, strokeStyle: StrokeStyle, strokeType: ShapeStrokeType = .center, fill: FSS, fillStyle: FillStyle = FillStyle(), constrainGestures: Bool = true) -> some View {
        clipRoundedRectangle(cornerSize, cornerStyle: cornerStyle, fill: fill, fillStyle: fillStyle)
            .strokeRoundedRectangle(cornerSize, color, strokeStyle: strokeStyle, strokeType: strokeType, constrainGestures: constrainGestures)
    }
}

#let braid(body, strands: 0, unit_width: 18pt, unit_height: 40pt, stroke: 2pt, bold_stroke: 4pt, curvature: 0.25) = {
    let crossings = body.body.children.filter(el => repr(el.func()) == "attach" and el.base.text == str(sym.sigma))

    box(
        width: (strands+2) * unit_width,
        height: crossings.len() * unit_height,
        
        for (idx, crossing) in crossings.enumerate() {
            if not crossing.has("bottom") {
                panic("A crossing is missing an index.")
            }

            let index = int(crossing.bottom.text) - 1
            for i in range(strands) {
                if i != index and i != index + 1 {
                    place(
                        top+left,
                        line(
                            stroke: stroke,
                            start: (unit_width * i, unit_height * idx),
                            end: (unit_width * i, (unit_height) * (idx+1))
                        )
                    )
                } else if i == index {
                    let (first_stroke, second_stroke) = if crossing.has("top") {
                        (stroke, bold_stroke)
                    } else {
                        (bold_stroke, stroke)
                    };

                    place(
                        top+left,
                        path(
                            stroke: first_stroke,
                            closed: false,
                            (unit_width * i, unit_height * idx),
                            ((unit_width * i, unit_height * (idx+curvature)), (0pt, 0pt), (0pt, unit_height*curvature)),
                            ((unit_width * (i+1), unit_height * (idx+1-curvature)), (0pt, -unit_height*curvature), (0pt, 0pt)),
                            (unit_width * (i+1), unit_height * (idx+1))
                        )
                    )

                    place(
                        top+left,
                        path(
                            stroke: second_stroke,
                            closed: false,
                            (unit_width * (i+1), unit_height * idx),
                            ((unit_width * (i+1), unit_height * (idx+curvature)), (0pt, 0pt), (0pt, unit_height*curvature)),
                            ((unit_width * i, unit_height * (idx+1-curvature)), (0pt, -unit_height*curvature), (0pt, 0pt)),
                            (unit_width * i, unit_height * (idx+1))
                        )
                    )
                }
            }
        }
    )
}
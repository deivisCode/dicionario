#let estilo_corpo(doc) = context {
    if target() == "pdf" {
        doc
    } else {
        show math.equation: set text(font: "New Computer Modern")
        html.html(
            {
                html.head(
                    {
                        html.meta(charset: "utf-8")
                        html.title[Dicionario]
                        html.style(read("/dicionario/estilo.css"))
                    }
                )
                html.body(html.main(doc))
            }
        )
    }
}


#let termo(
    denominacion: none,
    acepcions: none
) = context {
    if target() == "pdf" {
        text(size: 1.1em, strong(denominacion))
        block(
            breakable: true,
            inset: (left: 1em),
            for (i, acepcion) in acepcions.enumerate(start: 1) {
                let d = acepcion.definicion
                let l = acepcions.len()
                [
                    #if l > 1 { strong[#i.] }
                    DEF: #d\
                ]
            }
        )
    } else {
        html.div(
            class: "acepcions",
            {
                linebreak()
                html.strong(denominacion)
                for (i, acepcion) in acepcions.enumerate(start: 1) {
                    let d = acepcion.definicion
                    let l = acepcions.len()
                    html.div(
                        class: "acepcion",
                        [
                            #if l > 1 { strong[#i.] }
                            DEF: #d\
                        ]
                    )
                }
            }
        )
    }
}

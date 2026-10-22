#let estilo_corpo(doc) = {
    html.html(
        {
            html.head(
                {
                    html.meta(charset: "utf-8")
                    html.title[Dicionario]
                    html.style(read("/estilo.css"))
                }
            )
            html.body(html.main(doc))
        }
    )
}


#let termo(
    denominacion: none,
    acepcions: none
) = html.div(
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

#document(
    "/dicionario/dicionario.html",
    {
        import("/dicionario/estilo.typ"): *
        show: estilo_corpo
        include("/dicionario/contidos.typ")
    }
)

#asset(
    "/dicionario/fontes/cochineal/Cochineal-Bold.otf",
    read("/dicionario/fontes/cochineal/Cochineal-Bold.otf", encoding: none),
)
#asset(
    "/dicionario/fontes/cochineal/Cochineal-BoldItalic.otf",
    read("/dicionario/fontes/cochineal/Cochineal-BoldItalic.otf", encoding: none),
)
#asset(
    "/dicionario/fontes/cochineal/Cochineal-Italic.otf",
    read("/dicionario/fontes/cochineal/Cochineal-Italic.otf", encoding: none),
)
#asset(
    "/dicionario/fontes/cochineal/Cochineal-Roman.otf",
    read("/dicionario/fontes/cochineal/Cochineal-Roman.otf", encoding: none),
)

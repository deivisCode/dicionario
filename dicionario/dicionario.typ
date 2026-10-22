#document(
    "/dicionario.html",
    {
        import("/estilo.typ"): *
        show: estilo_corpo
        include("/contidos.typ")
    }
)

#asset("/fontes/Cochineal-Bold.otf"         , read("/fontes/cochineal/Cochineal-Bold.otf", encoding: none),)
#asset("/fontes/Cochineal-BoldItalic.otf"   , read("/fontes/cochineal/Cochineal-BoldItalic.otf", encoding: none),)
#asset("/fontes/Cochineal-Italic.otf"       , read("/fontes/cochineal/Cochineal-Italic.otf", encoding: none),)
#asset("/fontes/Cochineal-Roman.otf"        , read("/fontes/cochineal/Cochineal-Roman.otf", encoding: none),)
#asset("/fontes/LibertinusMath-Regular.otf" , read("/fontes/libertinus/LibertinusMath-Regular.otf", encoding: none),)

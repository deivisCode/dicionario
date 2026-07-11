# AVISO -> Perdón, fáltame inspiración e dáseme fatal poñer nomes as variables, pero creo que se entende a idea

class Documento: # Obxecto documento inicializado co nome do documento. Ten un atributo doc que contén o texto do documento
    def __init__(self,documento):
        file = open(documento,'r',encoding="utf-8")
        self.doc = file.read()
        paragrafo = contido("w:p",self.doc)
        self.paragrafos = []
        for coso in paragrafo:
            self.paragrafos.append(Paragrafo(coso))
        pass
    
class Paragrafo: # Obxecto paragrafo inicializado co contido dun parágrafo. Ten como atributos un booleano titulo, e un conxunto de obxectos executables
    def __init__(self,texto):
        self.texto = texto
        self.titulo = False
        conten = contido("w:r",texto)
        if "Ttulo" in contido("w:pPr",texto)[0]: # Aínda teño que ver como está organizado o que nos vaian mandando, pero de momento isto funciona
            self.titulo = True
        self.executables = []
        for coso in conten:
            self.executables.append(Executable(coso))

class Executable: # Obxecto executable inicializado co contido dun elemento parágrafo. Ten como atributos un obxecto estilo, un obxecto e un texto
    def __init__(self,texto):
        estilo = contido("w:rPr",texto)[0]
        self.estilo = Estilo(estilo)
        self.texto = contido("w:t",texto)[0]
        self.obxecto = True if ("w:object" in texto) else False # Isto basicamente dime se o executable é unha ecuación. Xa mirarei máis o tema

class Estilo: # Obxecto estilo inicializado co contido de calquera dos elementos executable ou parágrafo, ten atributos b, i e tamaño.
    b = False
    i = False
    def __init__(self,texto):
        if "<w:b/>" in texto:
            self.b = True
        if "w:i" in texto:
            self.i = True   # Podería meter tamén o tamaño da fonte (w:sz) pero de momento non é relevante

def contido(elemento,texto): # Esta función basicamente colle un texto e un elemento, e me devolve un array co contido dos elementos dese tipo no texto
    textoSeparado = texto.split("</" + elemento + ">")[:-1]
    textoFinal = []
    for linea in textoSeparado:
        if "<" + elemento + " " in linea: # Isto parece medio raro, pero fágoo así porque se poño só "<" + elemento nalgúns casos non rula como debería (co w:b, por exemplo)
            texto = (linea[linea.index("<" + elemento + " "):])
        else:
            texto = (linea[linea.index("<" + elemento + ">"):])
        textoFinal.append(texto[texto.index(">") + 1:])
    if textoFinal == []:
        textoFinal = [""] #Fago isto porque a función me da problemas cando devolve un array baleiro
    return(textoFinal)

# Falta saber que facer con figuras e ecuacións
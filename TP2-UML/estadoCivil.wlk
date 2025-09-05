class EstadoCivil{
        method esCasado() = false
}

object casado inherits EstadoCivil {

     override method esCasado() =true  
}

object divorciado inherits EstadoCivil  { 
}

object viudo inherits EstadoCivil{
}

object soltero inherits EstadoCivil{ 
}












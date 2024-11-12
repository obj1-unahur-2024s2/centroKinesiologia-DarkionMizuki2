import pacientesEspeciales.*
class Kinesiologia{

}

class Aparato inherits Kinesiologia{
    var property color="blanco"
    method seUsaPor(unPaciente)
    method condicionDeUso(unPaciente)
    method colorearDe(unColor){
      color=unColor
    }
}

class Paciente inherits Kinesiologia{
    var nivelDeFortalezaMuscular
    var nivelDeDolor
    const edad
    const property rutina=[]
    method edad()=edad
    method nivelDeFortalezaMuscular()=nivelDeFortalezaMuscular
    method nivelDeDolor()=nivelDeDolor
    method disminuirDolorEnUn_Porciento(n){
      nivelDeDolor = 0.max(nivelDeDolor - nivelDeDolor * (n/100))
    }
    method disminuirDolorEn_Puntos(n){
      nivelDeDolor = 0.max(nivelDeDolor - n)
    }
    method sumar_PuntosDeFortalezaMuscular(n){
      nivelDeFortalezaMuscular += n
    }
    method aumentarNivelDeFortalezaUn_PorcientoDeLaEdadDelPaciente(n){
      nivelDeFortalezaMuscular + edad * (n/100)
    }
    method utilizarAparato(unAparato){
        unAparato.seUsaPor(self)
    }
    method puedeUsar(unAparato)=unAparato.condicionDeUso(self)
    method asignarRutina(unaRutina){
      unaRutina.forEach({a => self.rutina().add(a)})
    }
    method puedeHacerLaRutinaAsignada()=
    rutina.all({unAparato => self.puedeUsar(unAparato)})
    method realizarSesionCompleta(){
      rutina.forEach({a => self.utilizarAparato(a)})
    }
}

object centro{
  var property 
  cantidadDeDecrementoDeDolorParaPacientesDeRecuperacionRapida=3
  method concurre(unPaciente){
    unPaciente.realizarSesionCompleta()
  }
}

class Magneto inherits Aparato{
    override method seUsaPor(unPaciente){
      unPaciente.disminuirDolorEnUn_Porciento(10)
    }
    override method condicionDeUso(unPaciente)=true
}
class Bicicleta inherits Aparato{
    override method seUsaPor(unPaciente){
      unPaciente.disminuirDolorEn_Puntos(4)
      unPaciente.sumar_PuntosDeFortalezaMuscular(3)
    }
    override method condicionDeUso(unPaciente)=
    unPaciente.edad()>8
}
class Minitramp inherits Aparato{
    override method seUsaPor(unPaciente){
        unPaciente.aumentarNivelDeFortalezaUn_PorcientoDeLaEdadDelPaciente(10)
    }
    override method condicionDeUso(unPaciente)=
    unPaciente.nivelDeDolor()<20
}
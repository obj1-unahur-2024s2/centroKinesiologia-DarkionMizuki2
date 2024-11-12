import pacientesEspeciales.*
import centro.*
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

class Magneto inherits Aparato{
    var puntosDeImantacion=800
    override method seUsaPor(unPaciente){
      unPaciente.disminuirDolorEnUn_Porciento(10)
      puntosDeImantacion=puntosDeImantacion-1
    }
    override method condicionDeUso(unPaciente)=true
    method necesitaMantenimiento()=puntosDeImantacion<100
    method hacerMantenimiento(){
      puntosDeImantacion=puntosDeImantacion+500
    }
    method hacerMantenimientoSiLoNecesita(){
      if(self.necesitaMantenimiento()){
        self.hacerMantenimiento()
      }
    }
}
class Bicicleta inherits Aparato{
    var cantidadDeVecesQueSeDesajustanLosTornillos=0
    var cantidadDeVecesQuePierdeAceite=0
    override method seUsaPor(unPaciente){
      if(unPaciente.nivelDeDolor()>30){
        self.desajustarTornillos()
      }
      if(unPaciente.edad()>=30 and unPaciente.edad()<=50){
        self.perderAceite()
      }
      unPaciente.disminuirDolorEn_Puntos(4)
      unPaciente.sumar_PuntosDeFortalezaMuscular(3)
    }
    method desajustarTornillos(){
      cantidadDeVecesQueSeDesajustanLosTornillos+=1
    }
    method perderAceite(){
      cantidadDeVecesQuePierdeAceite+=1
    }
    override method condicionDeUso(unPaciente)=
    unPaciente.edad()>8
    method necesitaMantenimiento()=cantidadDeVecesQueSeDesajustanLosTornillos>=10
    or cantidadDeVecesQuePierdeAceite>=5
    method hacerMantenimiento(){
      cantidadDeVecesQueSeDesajustanLosTornillos=0
      cantidadDeVecesQuePierdeAceite=0
    }
    method hacerMantenimientoSiLoNecesita(){
      if(self.necesitaMantenimiento()){
        self.hacerMantenimiento()
      }
    }
}
class Minitramp inherits Aparato{
    override method seUsaPor(unPaciente){
        unPaciente.aumentarNivelDeFortalezaUn_PorcientoDeLaEdadDelPaciente(10)
    }
    override method condicionDeUso(unPaciente)=
    unPaciente.nivelDeDolor()<20
    method necesitaMantenimiento()=false
    method hacerMantenimiento(){}
    method hacerMantenimientoSiLoNecesita(){
      if(self.necesitaMantenimiento()){
        self.hacerMantenimiento()
      }
    }
}
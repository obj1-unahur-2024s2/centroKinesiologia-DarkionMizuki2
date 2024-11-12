import aparatosYPacientes.*
import centro.*

class PacienteResistente inherits Paciente{
    override method realizarSesionCompleta(){
      rutina.forEach({
        a => self.utilizarAparato(a)
        self.sumar_PuntosDeFortalezaMuscular(1)
      })
    }
    method puntoAdicionalPorCadaAparatoUsado()=1
}
class PacienteCaprichoso inherits Paciente{
    override method puedeHacerLaRutinaAsignada()=
    super() and rutina.any({unAparato => 
    unAparato.color()=="rojo"})
    override method realizarSesionCompleta(){
      rutina.forEach({a => self.utilizarAparato(a)})
      rutina.forEach({a => self.utilizarAparato(a)})
    }
}
class PacienteDeRapidaRecuperacion inherits Paciente{
    override method realizarSesionCompleta(){
      rutina.forEach({a => self.utilizarAparato(a)})
      nivelDeDolor = 0.max(nivelDeDolor - 
centro.cantidadDeDecrementoDeDolorParaPacientesDeRecuperacionRapida())
    }
}
import aparatosYPacientes.*
import pacientesEspeciales.*
object centro{
    const pacientes=[]
    const aparatos=[]
  var property 
  cantidadDeDecrementoDeDolorParaPacientesDeRecuperacionRapida=3
  method concurre(unPaciente){
    unPaciente.realizarSesionCompleta()
  }
  method coloresDeSusAparatos()=aparatos.map({a => a.color()}).asSet()
  method pacientesMenosDe8Anios()=pacientes.filter({p => p.edad()<8})
  method cantidadDePacientesQueNoPuedenCumplirSesion()=
  pacientes.count({p => p.puedeHacerLaRutinaAsignada()})
  method estaEnOptimasCondiciones()=aparatos.all({a=>a.necesitaMantenimiento()})
  method estaComplicado(){
    const nroDeLaMitadDeAparatos=aparatos.size()/2
    const nroDeAparatosQueNecesitanMantenimiento=aparatos.count({a=>a.necesitaMantenimiento()})
    return nroDeAparatosQueNecesitanMantenimiento>=nroDeLaMitadDeAparatos
  }
  method registrarUnaVisitaDeTecnico(){
    aparatos.forEach({a => a.hacerMantenimientoSiLoNecesita()})
  }
  
}
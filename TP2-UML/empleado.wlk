import empresa.*
class Empleado{

var nombre
var direccion
var estadoCivil
var fechaDeNacimiento
var sueldoBasico=50000


method edad()=2025-fechaDeNacimiento.year()

method sueldoBruto()
method retenciones()
method sueldoNeto() = self.sueldoBruto() - self.retenciones()

method nombre() = nombre 

method direccion()= direccion 

method estadoCivil() =estadoCivil 

method fechaDeNacimiento() =fechaDeNacimiento 

method conceptos()


}
 
class EmpleadoPermanente inherits Empleado{
var cantHijos
var antiguedad 

 override method sueldoBruto()= sueldoBasico +(150*cantHijos)+ self.asignacionSiEsCasado()  + (50*antiguedad)

method asignacionSiEsCasado() = if (self.esCasado()) 100 else 0 

method esCasado()= estadoCivil.esCasado()

override method retenciones()=(0.10*self.sueldoBruto())+ (20*cantHijos)+(0.15*self.sueldoBruto())

override method conceptos()=
#{new Concepto(descripcion="Sueldo básico", monto=sueldoBasico),
  new Concepto(descripcion="Asignación por hijos", monto=(150 * cantHijos)),
  new Concepto(descripcion="Asignación por cónyuge", monto=self.asignacionSiEsCasado()),
  new Concepto(descripcion="Antigüedad", monto=(50 * antiguedad)),
  new Concepto(descripcion="Retenciones", monto= -self.retenciones())}


}

class EmpleadoTemporal inherits Empleado{
var finDeDesignacion
var cantHorasExtra

 override method sueldoBruto()=sueldoBasico +(40*cantHorasExtra)

 override method retenciones()=(0.10 * self.sueldoBruto())+(0.10 * self.sueldoBruto()) 
                                 + (5*cantHorasExtra)+ self.retencionSiEsAntiguo()

 method retencionSiEsAntiguo() = if (self.edad() > 50) 25 else 0

override method conceptos() = #{
  new Concepto(descripcion="Sueldo básico", monto=sueldoBasico),
  new Concepto(descripcion="Horas extra", monto=(40 * cantHorasExtra)),
  new Concepto(descripcion="Retenciones", monto= -self.retenciones())
}

}

class EmpleadoContratado inherits Empleado{

var nroContrato 
var medioDePago
var gastoAdministrativo=50

override method sueldoBruto()=sueldoBasico 

override method retenciones()=gastoAdministrativo

override method conceptos() = #{
  new Concepto(descripcion="Sueldo básico", monto=sueldoBasico),
  new Concepto(descripcion="Gastos administrativos", monto = gastoAdministrativo)
}
}
class Empresa{
var nombre
var cuit
var empleados = #{}
var recibos= #{}

method totalDeSueldoNetos() = empleados.sum{empleado=> empleado.sueldoNeto()}

method totalDeSueldoBruto() =empleados.sum{empleado=> empleado.sueldoBruto()}

method totalDeRetenciones()=empleados.sum{empleado=> empleado.retenciones()}

method liquidarSueldos(){
        recibos = (empleados.map{empleado=>self.crearRecibo(empleado)}).asSet()
}

method crearRecibo(empleado) = new ReciboDeHaberes(
                        nombreEmpleado = empleado.nombre(),
                        direccion      = empleado.direccion(),
                        fechaEmision   = hoy,
                        sueldoBruto    = empleado.sueldoBruto(),
                        sueldoNeto     = empleado.sueldoNeto(),
                        desgloceConcepto=empleado.conceptos()
                        )

method cantDeRecibos()=recibos.size()

}

class ReciboDeHaberes{

var nombreEmpleado
var direccion
var fechaEmision
var sueldoBruto
var sueldoNeto
var desgloceConcepto

}

class Concepto {
  var descripcion
  var monto

  method descripcion() = descripcion
  method monto() = monto
}

class MedioDePago{}
object transferencia inherits MedioDePago{
}
object cheque inherits MedioDePago{
}


const hoy = new Date ()
const nacimientoJuan = new Date (day=8,month=09,year=1990)
const nacimientoMaria= new Date (day=6,month=7,year=1998)
const nacimientoCarla= new Date (day=9,month=10,year=2000)
const nacimientoCarlo= new Date (day=9,month=12,year=1999)

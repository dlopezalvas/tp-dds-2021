package model.asociacion;

import model.excepciones.AsociacionNoEncontradaException;
import model.adopciones.PublicacionIntencionDeAdopcion;
import model.adopciones.PublicacionMascotaEnAdopcion;
import model.rescate.RescateDeMascota;
import model.rescate.RescateDeMascotaSinRegistrar;
import model.ubicacion.Ubicacion;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class RepositorioAsociaciones {
  private List<Asociacion> asociaciones = new ArrayList<>();

  private static final RepositorioAsociaciones INSTANCIA = new RepositorioAsociaciones();

  public List<RescateDeMascotaSinRegistrar> publicacionesRescatesAprobados() {
    List<RescateDeMascotaSinRegistrar> publicaciones = new ArrayList<>();
    this.asociaciones.forEach(asociacion -> publicaciones.addAll(asociacion.obtenerPublicacionesAprobadas()));
    return publicaciones;
  }

  // VER SI QUEDA ESTE METODO EN BASE A LOS REQUERIMIENTOS - TODO esto no va creo
  public List<RescateDeMascota> ultimasMascotasEncontradas(int dias) {
    List<RescateDeMascota> rescatesGlobales = new ArrayList<>();
    this.asociaciones.forEach(asociacion -> rescatesGlobales.addAll(asociacion.ultimasMascotasEncontradas(dias)));
    return rescatesGlobales;
  }

  public Asociacion asociacionMasCercana (Ubicacion ubicacion) {
    if (this.asociaciones.isEmpty()){
      throw new AsociacionNoEncontradaException("no se encontro una model.asociacion");
    }
    else {
      this.asociaciones.sort(Comparator.comparing(asociacion -> asociacion.calcularDistanciaA(ubicacion)));
      return asociaciones.stream().findFirst().orElse(null);
    }
  }

  public List<PublicacionMascotaEnAdopcion> publicacionesMascotasEnAdopcion() {
    List<PublicacionMascotaEnAdopcion> mascotasEnAdopcionGlobales = new ArrayList<>();
    this.asociaciones.forEach(asociacion -> mascotasEnAdopcionGlobales.addAll(asociacion.getMascotasEnAdopcion()));
    return mascotasEnAdopcionGlobales;
  }

  public List<PublicacionIntencionDeAdopcion> publicacionesIntencionDeAdopcion() {
    List<PublicacionIntencionDeAdopcion> intencionesDeAdoptarGlobales = new ArrayList<>();
    this.asociaciones.forEach(asociacion -> intencionesDeAdoptarGlobales.addAll(asociacion.getIntencionesDeAdoptar()));
    return intencionesDeAdoptarGlobales;
  }

  public static RepositorioAsociaciones getInstancia() {
    return INSTANCIA;
  }

  public void agregarAsociacion(Asociacion asociacion){
    this.asociaciones.add(asociacion);
  }

  public void removerAsociacion(Asociacion asociacion){
    this.asociaciones.remove(asociacion);
  }
}

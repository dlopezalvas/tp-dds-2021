package model.hogares;

import model.caracteristicas.definidas.TextoDefinida;
import model.mascota.Tamanio;
import model.mascota.TipoAnimal;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;
import model.ubicacion.Ubicacion;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity(name = "HogaresDeTransito")
@JsonIgnoreProperties({"id"})
public class HogarDeTransito {
  @Id
  @GeneratedValue
  private Long id;

  @JsonProperty("patio")
  Boolean tienePatio;

  @JsonProperty("nombre")
  String nombre;

  @JsonProperty("capacidad")
  int Capacidad;

  @Embedded
  @JsonProperty("ubicacion")
  Ubicacion ubicacion;

  @JsonProperty("telefono")
  String telefono;

  @JsonProperty("admisiones")
  public void setAdmisiones(JsonNode admisiones) {
    if(admisiones.get("perros").getBooleanValue()) animalesAdmitidos.add(TipoAnimal.PERRO);
    if(admisiones.get("gatos").getBooleanValue()) animalesAdmitidos.add(TipoAnimal.GATO);
  }

  @ElementCollection
  List<TipoAnimal> animalesAdmitidos = new ArrayList<>();

  @JsonProperty("lugares_disponibles")
  int lugaresDisponibles;

  @ElementCollection
  @JsonProperty("caracteristicas")
  List<String> conductasAdmitidas = new ArrayList<>();

  public HogarDeTransito(Boolean tienePatio, int capacidad, Ubicacion ubicacion, String telefono, List<TipoAnimal> animalesAdmitidos, int lugaresDisponibles, List<String> conductasAdmitidas) {
    this.tienePatio = tienePatio;
    Capacidad = capacidad;
    this.ubicacion = ubicacion;
    this.telefono = telefono;
    this.animalesAdmitidos = animalesAdmitidos;
    this.lugaresDisponibles = lugaresDisponibles;
    this.conductasAdmitidas = conductasAdmitidas;
  }

  public HogarDeTransito() {

  }

  public boolean admiteTipoAnimal(TipoAnimal tipoAnimal) {
    return animalesAdmitidos.contains(tipoAnimal);
  }

  private boolean tieneLugaresDisponibles() {
    return lugaresDisponibles > 0;
  }

  public boolean admiteTamanio(Tamanio tamanio) {
    return tienePatio || !tamanio.necesitaPatio();
  }

  public boolean estaDisponibleYcercaDe(Ubicacion ubicacionRescate, double radio) {
    return ubicacion.estaDentroDelRadio(ubicacionRescate, radio) && tieneLugaresDisponibles();
  }

  public boolean admiteAnimal(TipoAnimal tipoAnimal, Tamanio tamanio, double radio , Ubicacion ubicacionRescate, TextoDefinida personalidad){
    return tieneLugaresDisponibles() && admiteTamanio(tamanio) && admiteTipoAnimal(tipoAnimal)
        && ubicacion.estaDentroDelRadio(ubicacionRescate, radio) && admitePersonalidad(personalidad);
  }

  private boolean admitePersonalidad(TextoDefinida personalidad) {
    return conductasAdmitidas.isEmpty() || conductasAdmitidas.contains(personalidad.getValor());
  }


  public String getNombre() {
    return nombre;
  }

  public Ubicacion getUbicacion() {
    return ubicacion;
  }

  public int getCapacidad() {
    return Capacidad;
  }

  public String getTelefono() {
    return telefono;
  }
}

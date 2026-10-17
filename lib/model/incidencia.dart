class Incidencia {
static const List<String> prioridadValida = ['Baja', 'Media', 'Alta'];

  String id;
  String titulo;
  String descripcion;
  String cliente;
  String categoria;
  String estado;
  String fecha;
  String prioridad;

  Incidencia({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.cliente,
    required this.categoria,
    required this.estado,
    required this.fecha,
    String prioridad = 'Media',
  }) : prioridad = prioridadValida.contains(prioridad) ? prioridad : 'Media';

  factory Incidencia.desdeJson(Map<String, dynamic> m) {
    final prioridadGuardada = m['prioridad']?.toString() ?? 'Media';
    return Incidencia(
      id: m['id']?.toString() ?? '',
      titulo: m['titulo']?.toString() ?? '',
      descripcion: m['descripcion']?.toString() ?? '',
      cliente: m['cliente']?.toString() ?? '',
      categoria: m['categoria']?.toString() ?? 'Software',
      estado: m['estado']?.toString() ?? 'Pendiente',
      fecha: m['fecha']?.toString() ?? '',
      prioridad: prioridadValida.contains(prioridadGuardada)
          ? prioridadGuardada : 'Media',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'cliente': cliente,
      'categoria': categoria,
      'estado': estado,
      'fecha': fecha,
      'prioridad' : prioridad,
    };
  }
}
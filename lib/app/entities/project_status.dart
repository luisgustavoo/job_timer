enum ProjectStatus {
  emAndamento(label: 'Em Andamento'),
  finalizado(label: 'FinalizSado');

  const ProjectStatus({required this.label});
  final String label;
}

enum ProjectStatus {
  emAndamento(label: 'Em Andamento'),
  finalizado(label: 'Finalizado');

  const ProjectStatus({required this.label});
  final String label;
}

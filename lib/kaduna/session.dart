enum KadunaRole {
  governor,
  directorGeneral,
  situationRoomDirector,
  stateCoordinator,
  operationsOfficer,
  mediaIntelligenceOfficer,
  legalOfficer,
  logisticsOfficer,
  financeOfficer,
  lgaCoordinator,
  wardCoordinator,
  pollingUnitAgent,
  fieldReporter,
  executiveViewer,
}

extension KadunaRoleLabel on KadunaRole {
  String get label => switch (this) {
        KadunaRole.governor => 'Governor / Principal',
        KadunaRole.directorGeneral => 'Director General',
        KadunaRole.situationRoomDirector => 'Situation Room Director',
        KadunaRole.stateCoordinator => 'State Coordinator',
        KadunaRole.operationsOfficer => 'Operations Officer',
        KadunaRole.mediaIntelligenceOfficer => 'Media & Intelligence',
        KadunaRole.legalOfficer => 'Legal Officer',
        KadunaRole.logisticsOfficer => 'Logistics Officer',
        KadunaRole.financeOfficer => 'Finance Officer',
        KadunaRole.lgaCoordinator => 'LGA Coordinator',
        KadunaRole.wardCoordinator => 'Ward Coordinator',
        KadunaRole.pollingUnitAgent => 'Polling Unit Agent',
        KadunaRole.fieldReporter => 'Field Reporter',
        KadunaRole.executiveViewer => 'Executive Viewer',
      };
}

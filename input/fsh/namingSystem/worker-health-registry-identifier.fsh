Instance: NamingSystemWorkerHealthRegistryIdentifier
InstanceOf: NamingSystem
Usage: #definition
Title: "Sistema de Identificadores del Worker Health Registry"
Description: "Sistema que define los identificadores utilizados en el modelo OpenHIE Worker Health Registry para profesionales de salud"

* name = "WorkerHealthRegistryIdentifier"
* status = #active
* experimental = false
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #normative

* kind = #identifier
* date = "2025-12-11"
* publisher = "Ministerio de Salud"
* responsible = "Ministerio de Salud"
* description = "Sistema que define los identificadores oficiales de profesionales de salud en Costa Rica"
* usage = "Utilizado en Practitioner.identifier.system, PractitionerRole.identifier.system para identificar profesionales de salud."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://hl7.or.cr/fhir/identifier/worker-health-registry"
* uniqueId[0].preferred = true

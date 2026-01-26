Instance: NamingSystemClientRegistryIdentifier
InstanceOf: NamingSystem
Usage: #definition
Title: "Sistema de Identificadores del Client Registry"
Description: "Sistema que define los identificadores utilizados en el modelo OpenHIE Client Registry para pacientes"

* name = "ClientRegistryIdentifier"
* status = #active
* experimental = false
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #normative

* kind = #identifier
* date = "2025-12-11"
* publisher = "Ministerio de Salud"
* responsible = "Ministerio de Salud"
* description = "Sistema que define los identificadores oficiales de la población usuaria"
* usage = "Utilizado en Organization.identifier.system, Patient.identifier.system, etc."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://hl7.or.cr/fhir/identifier/client-registry"
* uniqueId[0].preferred = true

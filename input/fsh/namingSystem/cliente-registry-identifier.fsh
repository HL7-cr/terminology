Instance: NamingSystemHClientRegistryIdentifier
InstanceOf: NamingSystem
Usage: #definition
Title: "Sistema de Identificadores del Client Registry"
Description: "Sistema que define los identificadores utilizados en el modelo OpenHIE Client Registry"

* name = "ClientRegistryIdentifier"
* status = #draft
* experimental = false
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft

* kind = #identifier
* date = "2025-11-20"
* publisher = "Ministerio de Salud"
* responsible = "Ministerio de Salud"
* description = "Sistema que define los identificadores oficiales de la población usuaria"
* usage = "Utilizado en Organization.identifier.system, Patient.identifier.system, etc."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://cr.openhie.org/client-registry/fhir/Patient"
* uniqueId[0].preferred = true

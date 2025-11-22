Instance: NamingSystemTaxFacilityIdentifier
InstanceOf: NamingSystem
Usage: #definition
Title: "Sistema de Identificadores de Hacienda"
Description: "Sistema que define los identificadores utilizados en Hacienda"

* name = "TaxFacilityIdentifier"
* status = #draft
* experimental = false
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft

* kind = #identifier
* date = "2025-11-22"
* publisher = "Ministerio de Hacienda"
* responsible = "Ministerio de Hacienda"
* description = "Sistema que define los identificadores oficiales de la población usuaria del Hacienda"
* usage = "Utilizado en Organization.identifier.system, Patient.identifier.system, etc."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://api.hacienda.go.cr/fe/ae"
* uniqueId[0].preferred = true

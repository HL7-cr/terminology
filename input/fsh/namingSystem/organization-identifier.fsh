Instance: NamingSystemCROrganization
InstanceOf: NamingSystem
Usage: #definition
Title: "Sistema de Identificadores para Organizaciones"
Description: "Sistema que define los identificadores utilizados para organizaciones en Costa Rica"

* name = "CROrganizationIdentifier"
* status = #draft
* experimental = false
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft

* kind = #identifier
* date = "2025-12-09"
* publisher = "HL7 Costa Rica"
* responsible = "HL7 Costa Rica"
* description = "Sistema que define los identificadores de organizaciones como cédula jurídica y códigos de prestador"
* usage = "Utilizado en Organization.identifier.system"

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://hl7.or.cr/fhir/terminology/NamingSystem/cr-organization-id"
* uniqueId[0].preferred = true

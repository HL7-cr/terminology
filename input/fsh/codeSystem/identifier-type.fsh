/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® CodeSystem Resource
 @about:        HL7® FHIR® TERMINOLOGY Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-09-22
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - Instituto Nacional de Seguros
                - DHIT Costa Rica
                - Camara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
--------------------------------------------------------------------*/


CodeSystem:     IdentifierTypeCodes
Id:             identifier-type
Title:          "Identificador de Personas"
Description:    "Listado de tipos de identificadores para personas."

* insert CodeSystemMeta
* insert RuleSetStatus (0, draft, pc)

* #cedula-nacional "Cédula Nacional" "Identificador oficial para ciudadanos costarricenses."
* #pasaporte "Pasaporte" "Identificador para pasaporte."
* #dimex "DIMEX" "Documento de Identificación Migratorio para Extranjeros."
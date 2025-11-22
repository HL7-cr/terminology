/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® ValueSet Resource
 @about:        HL7® FHIR® TERMINOLOGY Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-11-20
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - Instituto Nacional de Seguros
                - DHIT Costa Rica
                - Camara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
--------------------------------------------------------------------*/

ValueSet:       CountryCode3Alpha
Id:             country-code-3-alpha
Title:          "Países"
Description:    "Código de país en formato ISO 3166-1 alpha-3"

* insert ValueSetMeta
* insert RuleSetStatus (0, draft, pc)

// Incluimos todos los códigos de países
* include codes from valueset http://hl7.org/fhir/ValueSet/iso3166-1-3
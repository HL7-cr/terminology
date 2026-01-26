/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® ValueSet Resource
 @about:        HL7® FHIR® TERMINOLOGY Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-12-11
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - Instituto Nacional de Seguros
                - DHIT Costa Rica
                - Camara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
--------------------------------------------------------------------*/

ValueSet: PractitionerSpecialtiesSet
Id: cr-practitioner-specialties
Title: "Especialidades de Profesionales de Salud"
Description: "Conjunto de valores que describe las especialidades de los profesionales de salud en Costa Rica, basado en el CodeSystem de especialidades."

* insert ValueSetMeta
* insert RuleSetStatus (0, draft, pc)

* include codes from system PractitionerSpecialityCodes

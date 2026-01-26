/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® CodeSystem Resource
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

CodeSystem:     ReligionCodes
Id:             religion-codes
Title:          "Religiones"
Description:    "Listado de religiones para Costa Rica, basado en SNOMED CT."

/* Definicion de los valores del CodeSystem */
* insert CodeSystemMeta
* insert RuleSetStatus (0, draft, pc)

* #276120001 "Católica" "Religión Católica"
* #42609005 "Evangélica" "Religión Evangélica"
* #276118004 "Testigos de Jehová" "Religión de los Testigos de Jehová"
* #298044001 "Judaísmo" "Religión Judía"
* #271390004 "Islam" "Religión Islámica"
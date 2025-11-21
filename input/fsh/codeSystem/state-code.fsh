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

CodeSystem:     StateCode
Id:             state-code
Title:          "Provincias de Costa Rica"
Description:    "Listado de provincia en formato Zip Code"

* insert CodeSystemMeta
* insert RuleSetStatus (0, draft, pc)

// Incluimos todos los códigos de provincias

* #1 "San José" "San José"
* #2 "Alajuela" "Alajuela"
* #3 "Cartago" "Cartago"
* #4 "Heredia" "Heredia"
* #5 "Guanacaste" "Guanacaste"
* #6 "Puntarenas" "Puntarenas"
* #7 "Limon" "Limon"

/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® CodeSystem Resource
 @about:        HL7® FHIR® TERMINOLOGY Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-12-08
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - Instituto Nacional de Seguros
                - DHIT Costa Rica
                - Camara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
--------------------------------------------------------------------*/

CodeSystem: RelationshipCodes
Id: relation-codes
Title: "Códigos de Relación"
Description: "Códigos SNOMED CT que representan diferentes tipos de relaciones entre individuos en Costa Rica"

/* Definicion de los valores del CodeSystem - Códigos SNOMED CT válidos */
* insert CodeSystemMeta
* insert RuleSetStatus (0, draft, pc)

* #72705000 "Madre" "La madre biológica o legal del individuo"
* #66839005 "Padre" "El padre biológico o legal del individuo"
* #375005 "Hermano/Hermana" "Un hermano o hermana biológico o legal del individuo"
* #127848009 "Cónyuge" "La esposa, esposo o pareja legalmente casada del individuo"
* #67822003 "Hijo/Hija" "Un hijo o hija biológico o legal del individuo"
* #58626002 "Tutor legal" "Una persona designada legalmente como tutor del individuo"
* #125680007 "Amigo" "Una persona que mantiene una relación de amistad con el individuo"
* #394921008 "Conviviente" "Una persona con la que el individuo mantiene una relación de convivencia"
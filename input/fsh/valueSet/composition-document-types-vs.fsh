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

ValueSet: CRCompositionDocumentTypesVS
Id: cr-composition-document-types
Title: "Tipos de Documentos Clínicos"
Description: "ValueSet que define los tipos de documentos clínicos basados en códigos LOINC para su uso en Composition en Costa Rica."

* insert ValueSetMeta
* insert RuleSetStatus (0, draft, pc)

* ^url = "https://hl7.or.cr/fhir/terminology/ValueSet/cr-composition-document-types"

// Incluir códigos del CodeSystem local
* include codes from system CompositionDocumentTypesCS

// Comentario: También se pueden incluir otros documentos de LOINC si es necesario
// * include http://loinc.org#[other-loinc-code] "[display]"

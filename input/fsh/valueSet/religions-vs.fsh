/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® ValueSet Resource
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

ValueSet: ReligionsSet
Id: cr-religions-set
Title: "Religiones de Costa Rica"
Description: "Conjunto de valores para religiones en Costa Rica"

* insert ValueSetMeta
* ^url = "https://hl7.or.cr/fhir/terminology/ValueSet/cr-religions-set"

// Listado explícito con display en español
* include http://snomed.info/sct#276120001 "Católica"
* include http://snomed.info/sct#42609005 "Evangélica"
* include http://snomed.info/sct#276118004 "Testigos de Jehová"
* include http://snomed.info/sct#298044001 "Judaísmo"
* include http://snomed.info/sct#271390004 "Islam"
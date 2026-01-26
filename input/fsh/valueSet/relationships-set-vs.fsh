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

ValueSet: RelationsSet
Id: cr-relationships-set
Title: "Códigos de Relación de Costa Rica"
Description: "Conjunto de valores para relaciones entre individuos en Costa Rica, basado en SNOMED CT"

* insert ValueSetMeta
* ^url = "https://hl7.or.cr/fhir/terminology/ValueSet/cr-relationships-set"

* include http://snomed.info/sct#72705000 "Madre"
* include http://snomed.info/sct#66839005 "Padre"
* include http://snomed.info/sct#375005 "Hermano/Hermana"
* include http://snomed.info/sct#127848009 "Cónyuge"
* include http://snomed.info/sct#67822003 "Hijo/Hija"
* include http://snomed.info/sct#58626002 "Tutor legal"
* include http://snomed.info/sct#125680007 "Amigo"
* include http://snomed.info/sct#394921008 "Conviviente"
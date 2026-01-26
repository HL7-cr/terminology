/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® CodeSystem Resource
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

CodeSystem: CompositionDocumentTypesCS
Id: cr-composition-document-types
Title: "Tipos de Documentos Clínicos"
Description: "CodeSystem que define los tipos de documentos clínicos basados en códigos LOINC para su uso en Composition en Costa Rica."

* insert CodeSystemMeta
* insert RuleSetStatus (0, draft, pc)

* ^url = "https://hl7.or.cr/fhir/terminology/CodeSystem/cr-composition-document-types"
* ^caseSensitive = true
* ^content = #complete

// IPS - International Patient Summary
* #60591-5 "Resumen del Paciente" "Documento de resumen del paciente que contiene información clínica esencial y relevante (IPS - International Patient Summary)."

// Resultados de Laboratorio
* #11502-2 "Reporte de Laboratorio" "Documento que contiene los resultados de pruebas y análisis de laboratorio realizados al paciente."

// Informes de Imágenes Médicas
* #18748-4 "Reporte de Diagnóstico por Imágenes" "Documento que contiene los hallazgos e interpretación de estudios de diagnóstico por imágenes (radiografías, tomografías, resonancias, ecografías, etc.)."

// Notas Clínicas y Consultas
* #34108-1 "Nota de Consulta Médica" "Documento que registra la evaluación y valoración de un paciente durante una consulta médica ambulatoria."
* #28570-0 "Evaluación Médica" "Documento de evaluación clínica completa del paciente incluyendo historia y examen físico."

// Informes Especializados
* #11506-3 "Reporte de Patología" "Documento que contiene el análisis patológico de muestras de tejido obtenidas mediante biopsia o procedimiento quirúrgico."
* #11488-4 "Informe de Endoscopia" "Documento que registra los hallazgos e interpretación de procedimientos endoscópicos realizados al paciente."
* #19005-8 "Informe Quirúrgico" "Documento que describe el procedimiento quirúrgico realizado, técnica utilizada, hallazgos y complicaciones."

// Prescripciones y Medicamentos
* #34106-5 "Receta Farmacéutica" "Documento que contiene las prescripciones de medicamentos autorizadas por un profesional de la salud."
* #63249-9 "Lista de Medicamentos Activos" "Documento que lista todos los medicamentos actualmente administrados o prescritos al paciente."

// Documentos de Seguimiento y Egreso
* #34111-5 "Resumen de Hospitalización" "Documento que resume la evolución clínica, diagnósticos y tratamiento durante la estancia hospitalaria del paciente."
* #34117-2 "Informe de Alta Hospitalaria" "Documento de egreso que contiene el resumen clínico, diagnósticos finales, tratamientos realizados y recomendaciones al alta."

// Certificados Médicos
* #34094-3 "Certificado de Incapacidad" "Documento médico que certifica la incapacidad laboral temporal o permanente del paciente por razones de salud."
* #34098-4 "Certificado de Defunción" "Documento médico oficial que certifica el fallecimiento de una persona y sus causas."

// Historias Médicas
* #34619-5 "Historia Médica Completa" "Documento que contiene el registro completo de la historia médica del paciente incluyendo antecedentes, diagnósticos previos y tratamientos."

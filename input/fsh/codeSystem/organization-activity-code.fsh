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

CodeSystem:     OrganizationActivityCode
Id:             organization-activity-code
Title:          "Tipo de actividad de atención a la salud"
Description:    "Códigos para clasificar los tipos de actividades de atención a la salud"

* insert CodeSystemMeta
* insert RuleSetStatus (0, draft, pc)
* ^hierarchyMeaning = #is-a

* #8600 "Actividades de atención a la salud humana" "Actividades relacionadas con la atención de la salud humana en sus diversas modalidades"
* #8600 #8601 "Actividades de hospitales" "Servicios prestados en establecimientos hospitalarios"
* #8600 #8610 "Actividades de hospitales generales" "Servicios de hospitalización general y especializada"
* #8600 #8610 #8610.0 "Servicios de hospitales generales" "Conjunto de servicios proporcionados por hospitales de atención general"
* #8600 #8610 #8610.0 #8610.0.01 "Servicios de hospitalización" "Atención médica con internamiento de pacientes"
* #8600 #8610 #8610.0 #8610.0.02 "Servicios de atención de emergencias." "Atención médica urgente para casos críticos"
* #8600 #8610 #8610.0 #8610.0.03 "Salas de operaciones para cirugía general o especializada" "Espacios equipados para procedimientos quirúrgicos generales o especializados"
* #8600 #8610 #8610.0 #8610.0.04 "Servicios de atención del parto." "Atención médica durante el trabajo de parto y nacimiento"
* #8600 #8610 #8610.0 #8610.0.05 "Servicios de radioterapia." "Tratamiento de enfermedades mediante radiación ionizante"
* #8600 #8610 #8610.0 #8610.0.06 "Servicios de diagnóstico por imágenes." "Obtención de imágenes médicas para diagnóstico"
* #8600 #8610 #8610.0 #8610.0.07 "Servicios de alimentación a pacientes hospitalizados." "Provisión de dietas terapéuticas y alimentación a pacientes internados"
* #8600 #8610 #8610.0 #8610.0.08 "Servicios de urgencias." "Atención médica inmediata para situaciones urgentes"
* #8600 #8610 #8610.0 #8610.0.09 "Farmacias comunitarias." "Dispensación de medicamentos en establecimientos comunitarios"
* #8600 #8610 #8610.0 #8610.0.10 "Farmacias hospitalarias." "Dispensación y gestión de medicamentos en ambiente hospitalario"
* #8600 #8610 #8610.0 #8610.0.11 "Servicios de medicina nuclear." "Diagnóstico y tratamiento mediante radioisótopos y trazadores radiactivos"
* #8600 #8610 #8610.0 #8610.0.12 "Servicios de esterilización de equipos." "Procesamiento de instrumentos y equipos médicos para asegurar su esterilidad"
* #8600 #8610 #8610.0 #8610.0.13 "Servicios de lavandería hospitalaria." "Procesamiento de ropa hospitalaria y lencería"
* #8600 #8610 #8610.0 #8610.0.14 "Servicios de aplicación de quimioterapia oncológica." "Administración de tratamientos quimioterápicos para pacientes con cáncer"
* #8600 #8610 #8610.0 #8610.0.15 "Servicios de hospitalización para personas con trastornos mentales." "Internamiento y atención de pacientes con enfermedades mentales"
* #8600 #8610 #8610.0 #8610.0.16 "Servicios de hemodiálisis." "Tratamiento de insuficiencia renal mediante filtración sanguínea"
* #8600 #8620 "Servicios ambulatorios de atención a la salud" "Atención médica sin internamiento del paciente"
* #8600 #8620 #8620.1 "Servicios ambulatorios de atención médica" "Consultas y procedimientos médicos ambulatorios"
* #8600 #8620 #8620.1 #8620.1.01 "Servicios de consulta ambulatoria en medicina general o especializada." "Atención médica ambulatoria general o por especialistas"
* #8600 #8620 #8620.1 #8620.1.03 "Servicios de cuidados paliativos." "Atención integral para pacientes con enfermedades terminales"
* #8600 #8620 #8620.1 #8620.1.04 "Servicios de aplicación de técnicas de reproducción humana asistida de alta complejidad." "Procedimientos de fertilización asistida de alta complejidad"
* #8600 #8620 #8620.1 #8620.1.07 "Servicios de tratamiento hiperbárico." "Terapia con oxígeno a presiones superiores a la atmosférica"
* #8600 #8620 #8620.1 #8620.1.08 "Consultorios de psiquiatría." "Atención ambulatoria de trastornos mentales y emocionales"
* #8600 #8620 #8620.1 #8620.1.09 "Salas para la realización de procedimientos bajo sedación o anestesia local." "Espacios para procedimientos con sedación o anestesia local"
* #8600 #8620 #8620.2 "Servicios ambulatorios de atención odontológica" "Atención dental sin internamiento"
* #8600 #8620 #8620.2 #8620.2.01 "Servicios de consulta ambulatoria odontología generales o especializados." "Atención dental general o especializada ambulatoria"
* #8600 #8620 #8620.2 #8620.2.02 "Servicios de diagnóstico por imágenes odontológicas." "Radiografías y otros estudios de imagen dental"
* #8600 #8690 "Otras actividades de atención de la salud humana" "Servicios de salud complementarios y de apoyo"
* #8600 #8690 #8690.1 "Servicios de laboratorio y bancos" "Análisis de laboratorio y almacenamiento de material biológico"
* #8600 #8690 #8690.1 #8690.1.01 "Laboratorios de microbiología y química clínica." "Análisis microbiológicos y bioquímicos de muestras clínicas"
* #8600 #8690 #8690.1 #8690.1.02 "Laboratorios de patología y citopatología." "Estudio de tejidos y células para diagnóstico"
* #8600 #8690 #8690.1 #8690.1.03 "Servicios de sangre." "Recolección, procesamiento y distribución de sangre y derivados"
* #8600 #8690 #8690.1 #8690.1.04 "Bancos de órganos, tejidos, células y componentes anatómicos humanos." "Almacenamiento y distribución de material biológico para trasplante"
* #8600 #8690 #8690.1 #8690.1.05 "Bancos de gametos humanos." "Almacenamiento de óvulos y espermatozoides"
* #8600 #8690 #8690.1 #8690.1.06 "Bancos de leche humana." "Recolección, procesamiento y distribución de leche materna"
* #8600 #8690 #8690.1 #8690.1.07 "Biorepositorios." "Almacenamiento de muestras biológicas para investigación"
* #8600 #8690 #8690.9 "Otros servicios de atención de la salud" "Servicios de salud especializados diversos"
* #8600 #8690 #8690.9 #8690.9.01 "Servicios de consulta ambulatoria en terapia física." "Rehabilitación física y fisioterapia ambulatoria"
* #8600 #8690 #8690.9 #8690.9.02 "Ambulancias de soporte básico." "Transporte sanitario con soporte vital básico"
* #8600 #8690 #8690.9 #8690.9.03 "Ambulancias de soporte avanzado." "Transporte sanitario con soporte vital avanzado"
* #8600 #8690 #8690.9 #8690.9.04 "Ambulancias de traslado de pacientes." "Transporte sanitario para pacientes estables"
* #8600 #8690 #8690.9 #8690.9.05 "Ambulancias aéreas." "Transporte sanitario por vía aérea"
* #8600 #8690 #8690.9 #8690.9.06 "Ambulancias acuáticas." "Transporte sanitario por vía acuática"
* #8600 #8690 #8690.9 #8690.9.07 "Servicios de consulta ambulatoria en quiropráctica." "Atención quiropráctica ambulatoria"
* #8600 #8690 #8690.9 #8690.9.08 "Servicios de consulta ambulatoria en optometría." "Evaluación y corrección de problemas visuales"
* #8600 #8690 #8690.9 #8690.9.09 "Servicios de consulta ambulatoria en nutrición." "Asesoría nutricional y dietética ambulatoria"
* #8600 #8690 #8690.9 #8690.9.10 "Servicios de consulta ambulatoria en psicología" "Atención psicológica ambulatoria"
* #8600 #8690 #8690.9 #8690.9.12 "Servicios de consulta ambulatoria en audiología." "Evaluación y rehabilitación auditiva"
* #8600 #8690 #8690.9 #8690.9.13 "Servicios de homeopatía (biólogos)" "Atención mediante medicina homeopática"
* #8600 #8690 #8690.9 #8690.9.14 "Servicios ambulatorios de atención en enfermería" "Cuidados de enfermería en modalidad ambulatoria"
* #8600 #8690 #8690.9 #8690.9.15 "Servicios de consulta farmacéutica." "Asesoría farmacológica y seguimiento farmacoterapéutico"
* #8600 #8690 #8690.9 #8690.9.16 "Servicios de terapia del lenguaje." "Evaluación y rehabilitación de trastornos del habla y lenguaje"
* #8600 #8690 #8690.9 #8690.9.17 "Servicios de terapia ocupacional" "Rehabilitación de habilidades para actividades de la vida diaria"
* #8600 #8720 "Actividades de atención residencial para el cuidado de la salud" "Atención en establecimientos residenciales de salud"
* #8600 #8720 #8720.0 "Servicios residenciales de salud" "Servicios de salud con alojamiento de larga estancia"
* #8600 #8720 #8720.0 #8720.0.01 "Servicios de desintoxicación para personas con problemas con el consumo de alcohol y otras drogas" "Tratamiento residencial para desintoxicación de sustancias"
* #8600 #8720 #8720.0 #8720.0.07 "Servicios de atención residencial para personas con problemas con el consumo de alcohol y otras drogas" "Atención residencial para tratamiento de adicciones"
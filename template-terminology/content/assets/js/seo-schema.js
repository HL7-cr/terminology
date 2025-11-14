// Schema.org Structured Data for HL7 CR Terminology IG
(function() {
  var script = document.createElement('script');
  script.type = 'application/ld+json';
  script.text = JSON.stringify({
    "@context": "https://schema.org",
    "@type": "MedicalWebPage",
    "name": "HL7 FHIR Costa Rica Terminología",
    "description": "Guía de implementación FHIR R5 de Terminología para Costa Rica. Define CodeSystems y ValueSets utilizados por la Iniciativa HL7 Costa Rica.",
    "publisher": {
      "@type": "Organization",
      "name": "HL7 Costa Rica",
      "url": "https://hl7.or.cr",
      "email": "info@hl7.or.cr"
    },
    "inLanguage": "es-CR",
    "audience": {
      "@type": "MedicalAudience",
      "audienceType": "Healthcare professionals"
    },
    "about": {
      "@type": "Thing",
      "name": "FHIR Terminology"
    }
  });
  document.head.appendChild(script);
})();

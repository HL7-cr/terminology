docker stop ig-terminology
docker rm ig-terminology
docker rmi hl7cr/sushi:v1
cd /home/ale/Proyectos/HL7\ CR/ig/terminology.git/
docker build --no-cache -t hl7cr/sushi:v1 .
cd /home/ale/Proyectos/HL7\ CR/ig
docker run -it --name ig-terminology -v "/home/ale/Proyectos/HL7 CR/ig/terminology.git:/ig" hl7cr/sushi:v1

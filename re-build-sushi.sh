docker rm ig-terminology
docker rmi hl7cr/sushi:v1
cd /home/ale/Proyectos/HL7\ CR/ig/terminology.git/
docker build -t hl7cr/sushi:v1 .
cd /home/ale/Proyectos/HL7\ CR/ig
docker run -it --name ig-terminology -v "$(pwd)/ig/terminology.git:/ig" hl7cr/sushi:v1

docker rm sushi
docker rmi hl7cr/sushi:v1
cd /home/ale/Proyectos/HL7\ CR/terminology.git/
docker build -t hl7cr/sushi:v1 .
cd /home/ale/Proyectos/HL7\ CR/
docker run -it --name sushi -v "$(pwd)/terminology.git:/ig" hl7cr/sushi:v1

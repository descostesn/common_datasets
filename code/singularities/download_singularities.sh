#!/usr/bin/bash


outputFiles=("bowtie2v245.sif" "bedr-v107.sif" "genomeinfodb-v1323.sif" "genomicranges-v1480.sif")
tags=("bowtie2:245" "bedr:107" "genomeinfodb:1323" "genomicranges:1480")

for i in "${!tags[@]}"; do 

	echo "singularity pull --docker-username descoste --docker-password $SINGULARITY_DOCKER_PASSWORD ${outputFiles[$i]} git.embl.de:4567/descoste/singularityhub-emblrome/${tags[$i]}"
	singularity pull --docker-username descoste --docker-password $SINGULARITY_DOCKER_PASSWORD ${outputFiles[$i]} oras://git.embl.de:4567/descoste/singularityhub-emblrome/${tags[$i]}
done

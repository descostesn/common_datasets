FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="9d6ce4d45f16f4ae97830cf62d0262be27363c037b2e5cff44ba80813448ea51"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: conda/bowtie2.yaml
#   prefix: /conda-envs/037018897d6807deba33d27eb8b0eb32
#   channel:
#     - bioconda
#   
#   dependencies:
#     - bowtie2=2.4.5
RUN mkdir -p /conda-envs/037018897d6807deba33d27eb8b0eb32
COPY conda/bowtie2.yaml /conda-envs/037018897d6807deba33d27eb8b0eb32/environment.yaml

# Conda environment:
#   source: conda/genomeinfodb.yaml
#   prefix: /conda-envs/2618aa204f36f5fb28797c6b121aec83
#   channel:
#     - bioconda
#   
#   dependencies:
#     - bioconductor-genomeinfodb=1.30.0
RUN mkdir -p /conda-envs/2618aa204f36f5fb28797c6b121aec83
COPY conda/genomeinfodb.yaml /conda-envs/2618aa204f36f5fb28797c6b121aec83/environment.yaml

# Conda environment:
#   source: conda/genomicranges.yaml
#   prefix: /conda-envs/218dc1460db780f35e0c297cf26b6647
#   channel:
#     - bioconda
#   
#   dependencies:
#     - bioconductor-genomicranges=1.46.1
RUN mkdir -p /conda-envs/218dc1460db780f35e0c297cf26b6647
COPY conda/genomicranges.yaml /conda-envs/218dc1460db780f35e0c297cf26b6647/environment.yaml

# Conda environment:
#   source: conda/rbedr.yaml
#   prefix: /conda-envs/47999721ff5516e76fc84b022d87dc86
#   channel:
#     - conda-forge
#   
#   depedencies:
#     - r-bedr=1.0.7
RUN mkdir -p /conda-envs/47999721ff5516e76fc84b022d87dc86
COPY conda/rbedr.yaml /conda-envs/47999721ff5516e76fc84b022d87dc86/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/037018897d6807deba33d27eb8b0eb32 --file /conda-envs/037018897d6807deba33d27eb8b0eb32/environment.yaml && \
    mamba env create --prefix /conda-envs/2618aa204f36f5fb28797c6b121aec83 --file /conda-envs/2618aa204f36f5fb28797c6b121aec83/environment.yaml && \
    mamba env create --prefix /conda-envs/218dc1460db780f35e0c297cf26b6647 --file /conda-envs/218dc1460db780f35e0c297cf26b6647/environment.yaml && \
    mamba env create --prefix /conda-envs/47999721ff5516e76fc84b022d87dc86 --file /conda-envs/47999721ff5516e76fc84b022d87dc86/environment.yaml && \
    mamba clean --all -y


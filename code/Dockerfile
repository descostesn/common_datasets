FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="b34e09c73fd5f81967b752cefd56d925b9a6db398751be87f38c0574545d499d"

# Step 1: Retrieve conda environments

# Conda environment:
#   source: conda/bowtie2.yaml
#   prefix: /conda-envs/9396826f72d1825f10f2bda859604ce6
#   channels:
#     - bioconda
#   
#   dependencies:
#     - bowtie2=2.4.5
RUN mkdir -p /conda-envs/9396826f72d1825f10f2bda859604ce6
COPY conda/bowtie2.yaml /conda-envs/9396826f72d1825f10f2bda859604ce6/environment.yaml

# Conda environment:
#   source: conda/genomeinfodb.yaml
#   prefix: /conda-envs/77e7c34e343598a072c504aaa67b32ce
#   channels:
#     - conda-forge
#     - bioconda
#   
#   dependencies:
#     - c-ares=1.18.1
#     - libnghttp2=1.47.0
#     - libcurl=7.83.1
#     - libdeflate=1.14
#     - libtiff=4.4.0
#     - r-base=4.1.3
#     - bioconductor-biocgenerics=0.40.0
#     - bioconductor-genomeinfodb=1.30.0
RUN mkdir -p /conda-envs/77e7c34e343598a072c504aaa67b32ce
COPY conda/genomeinfodb.yaml /conda-envs/77e7c34e343598a072c504aaa67b32ce/environment.yaml

# Conda environment:
#   source: conda/genomicranges.yaml
#   prefix: /conda-envs/cd9d783d1fdbb0c00dbbfb75c50541ce
#   channels:
#     - conda-forge
#     - bioconda
#   
#   dependencies:
#     - r-base=4.1.3
#     - bioconductor-genomicranges=1.46.1
RUN mkdir -p /conda-envs/cd9d783d1fdbb0c00dbbfb75c50541ce
COPY conda/genomicranges.yaml /conda-envs/cd9d783d1fdbb0c00dbbfb75c50541ce/environment.yaml

# Conda environment:
#   source: conda/r.yaml
#   prefix: /conda-envs/2e39cd6010fe7cd1509f2bb5c85547d7
#   channels:
#     - conda-forge
#   
#   depedencies:
#     - r-essentials=4.1
#     - r-base=4.2.1
#     - r-r.utils=2.12.0
RUN mkdir -p /conda-envs/2e39cd6010fe7cd1509f2bb5c85547d7
COPY conda/r.yaml /conda-envs/2e39cd6010fe7cd1509f2bb5c85547d7/environment.yaml

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/9396826f72d1825f10f2bda859604ce6 --file /conda-envs/9396826f72d1825f10f2bda859604ce6/environment.yaml && \
    mamba env create --prefix /conda-envs/77e7c34e343598a072c504aaa67b32ce --file /conda-envs/77e7c34e343598a072c504aaa67b32ce/environment.yaml && \
    mamba env create --prefix /conda-envs/cd9d783d1fdbb0c00dbbfb75c50541ce --file /conda-envs/cd9d783d1fdbb0c00dbbfb75c50541ce/environment.yaml && \
    mamba env create --prefix /conda-envs/2e39cd6010fe7cd1509f2bb5c85547d7 --file /conda-envs/2e39cd6010fe7cd1509f2bb5c85547d7/environment.yaml && \
    mamba clean --all -y

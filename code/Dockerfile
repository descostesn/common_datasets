

 ## The table is composed of single-end and paired-end experiments ##

FROM condaforge/mambaforge:latest
LABEL io.github.snakemake.containerized="true"
LABEL io.github.snakemake.conda_env_hash="7255a2f0b96be5ccf003fe6699d21cf2931a6460214bbce9921d30cebe396c84"

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

# Step 2: Generate conda environments

RUN mamba env create --prefix /conda-envs/9396826f72d1825f10f2bda859604ce6 --file /conda-envs/9396826f72d1825f10f2bda859604ce6/environment.yaml && \
    mamba env create --prefix /conda-envs/77e7c34e343598a072c504aaa67b32ce --file /conda-envs/77e7c34e343598a072c504aaa67b32ce/environment.yaml && \
    mamba env create --prefix /conda-envs/cd9d783d1fdbb0c00dbbfb75c50541ce --file /conda-envs/cd9d783d1fdbb0c00dbbfb75c50541ce/environment.yaml && \
    mamba clean --all -y

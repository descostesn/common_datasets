def retrieve_test_singleEnded(wildcards):


rule downloadTestData_single:
  output:
    "../test_datasets/{technique}/{organism}/single_ended/{singleEndName}.fastq.gz"
  params:
    fileURL = lambda wildcards: config["testDatasets"][wildcards.technique][wildcards.organism]["singleEnded"]
  shell:
  
##############
# This script retrieves the chromosomes names and length to create a 
# chromInfo.txt file. This file is needed by several programs such as 
# hiddendomains.
#
# R 4.1.1
# Descostes Feb 2022
##############


library("GenomeInfoDb")


#############
## PARAMS
#############


outputFile <- snakemake@output[[1]]
releaseVersion <- snakemake@params$release
excludeChrom <- snakemake@params$excludeChrom
outputFolder <- dirname(outputFile)
assembly <- gsub("-chromInfo.txt", "", basename(outputFile)) 

#save(outputFile, file="/g/romebioinfo/common_datasets/code/tmp-chrominfo/outputFile.Rdat")
#save(releaseVersion, file="/g/romebioinfo/common_datasets/code/tmp-chrominfo/releaseVersion.Rdat")
#save(outputFolder, file="/g/romebioinfo/common_datasets/code/tmp-chrominfo/outputFolder.Rdat")
#save(assembly, file="/g/romebioinfo/common_datasets/code/tmp-chrominfo/assembly.Rdat")
#stop("## object saved")
#load("/g/romebioinfo/common_datasets/code/tmp-chrominfo/outputFile.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp-chrominfo/releaseVersion.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp-chrominfo/outputFolder.Rdat")
#load("/g/romebioinfo/common_datasets/code/tmp-chrominfo/assembly.Rdat")



#############
## MAIN
#############

releaseVersion <- as.numeric(strsplit(releaseVersion, "\\.")[[1]][3])

res <- getChromInfoFromEnsembl(assembly, assembled.molecules.only=TRUE, release=releaseVersion)
res <- res[,c("name", "length")]

## Removing chrom MT
idx <- which(res$name == excludeChrom)
if(!isTRUE(all.equal(length(idx),1)))
    stop("Problem in excluding chromosome ", excludeChrom)
res <- res[-idx,]

## Ordering chromosomes. Replacing, if any, letters to a high number to put 
## them at the end. Letters are spotted by converting to numeric and retrieving
## NA indexes.
idxLetters <- suppressWarnings(which(is.na(as.numeric(res$name))))
chromNumbers <- res$name
chromNumbers[idxLetters] <- seq(from=500, to=500+(length(idxLetters)-1),by=1)
res <- res[order(as.numeric(chromNumbers)),]

if(!file.exists(outputFolder))
    dir.create(outputFolder, recursive=TRUE)

write.table(res, file=outputFile, sep="\t", 
        quote=FALSE, row.names=FALSE, col.names=FALSE)


GENOMEID=config["genomeList"]
GENOMEBIOMART=config["genomeBiomart"]

PREFIXES=[]
PREFIXESEXT=[]
SPECIES=[]
for genome in GENOMEID:
  PREFIXES.append(config["prefixes"][genome])
  SPECIES.append(config["species"][genome])
  PREFIXESEXT.append(config["prefixesExtended"][genome])

def extract_info_df(df):
  return (df['speciessingle'].tolist(), df['genome'].tolist(), df['prefixes'].tolist(), df['prefixesExtended'].tolist(), df['sampleName'].tolist())

def alignment_variables(fun):
  results = fun()
  df = pd.DataFrame(results)
  df.rename(columns={0: 'speciessingle', 1: 'sampleName', 2: 'genome', 3: 'prefixes', 4: 'prefixesExtended', 5: 'technique'}, inplace=True)
  index_others = df['technique'] != 'RNASeq'
  index_rnaseq = df['technique'] == 'RNASeq'
  df_bowtie = df[index_others]
  df_star = df[index_rnaseq]
  
  # Defining variables for STAR
  (SPECIESSTAR, GENOMESTAR, PREFIXSTAR, PREFIXEXTSTAR, SAMPLENAMESSTAR) = extract_info_df(df_star)
  
  # Defining variables for bowtie
  (SPECIESBOW, GENOMEBOW, PREFIXBOW, PREFIXEXTBOW, SAMPLENAMESBOW) = extract_info_df(df_bowtie)
  
  return {"star": [SPECIESSTAR, GENOMESTAR, PREFIXSTAR, PREFIXEXTSTAR, SAMPLENAMESSTAR], 
          "bowtie": [SPECIESBOW, GENOMEBOW, PREFIXBOW, PREFIXEXTBOW, SAMPLENAMESBOW]}

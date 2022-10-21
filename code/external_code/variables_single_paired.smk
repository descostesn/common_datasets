# Splitting the table into single or paired end experiments

index_single = df['library_layout'] == 'single'
index_paired = df['library_layout'] == 'paired'
df_single = df[index_single]
df_paired = df[index_paired]

# Output files names

SINGLESAMPLES = df_single['samples'].tolist()
PAIREDSAMPLES = df_paired['samples'].tolist()

# For Retrieving links to download sra files

samples_single_indexedPD = pd.DataFrame(df_single).set_index("samples",drop=False)
samples_paired_indexedPD = pd.DataFrame(df_paired).set_index("samples",drop=False)

# Technique names

SINGLETECH = df_single['library_strategy'].tolist()
PAIREDTECH = df_paired['library_strategy'].tolist()

## Species name

SPECIESSINGLE = df_single['organism'].tolist()
SPECIESPAIRED = df_paired['organism'].tolist()

## Layout names

LAYOUTSINGLE = df_single['library_layout'].tolist()
LAYOUTPAIRED = df_paired['library_layout'].tolist()

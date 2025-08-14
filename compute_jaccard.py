import json
import pandas as pd


with open('valid_combos_function.json', 'r') as f1:
    data_fct = json.load(f1)

with open('valid_combos_constructor.json', 'r') as f2:
    data_constr = json.load(f2)    

#data = data_fct + data_constr

#unchecked_contracts = [entry['contractName'] for entry in data if entry['checkSuccess'] is None]

unchecked_fct_contracts = [entry['contractName'] for entry in data_fct if entry['checkSuccess'] is None]
unchecked_constr_contracts = [entry['contractName'] for entry in data_constr if entry['checkSuccess'] is None]


df_m_s = pd.read_csv('tool_results/results_test_run_mythril_slither.csv', encoding='utf-16', skip_blank_lines=True)

df_c = pd.read_csv('tool_results/results_test_run_confuzzius2.csv', encoding='utf-16', skip_blank_lines=True)

# all fct and constr contracts, which hold vulnerability and are flagged as vulnerable by Mythril; respectively slither and confuzzius (only fct)
mythril_fct_flagged = set()
mythril_constr_flagged = set()

slither_fct_flagged = set()
slither_constr_flagged = set()

confuzzius_fct_flagged = set()

for name in unchecked_fct_contracts:
    matching_rows = df_m_s[
        (df_m_s['toolid'].str.contains('mythril')) &
        (df_m_s['basename'] == f'{name}.sol')
    ]

    for _, row in matching_rows.iterrows():
        if '104' in row['findings']:
            mythril_fct_flagged.add(name)
            break

for name in unchecked_constr_contracts:
    matching_rows = df_m_s[
        (df_m_s['toolid'].str.contains('mythril')) &
        (df_m_s['basename'] == f'{name}.sol')
    ]

    for _, row in matching_rows.iterrows():
        if '104' in row['findings']:
            mythril_constr_flagged.add(name)
            break        



for name in unchecked_fct_contracts:
    matching_rows = df_m_s[
        (df_m_s['toolid'].str.contains('slither')) &
        (df_m_s['basename'] == f'{name}.sol')
    ]

    for _, row in matching_rows.iterrows():
        if 'unchecked_lowlevel' in row['findings'] or 'unchecked_send' in row['findings']:
            slither_fct_flagged.add(name)
            break

for name in unchecked_constr_contracts:
    matching_rows = df_m_s[
        (df_m_s['toolid'].str.contains('slither')) &
        (df_m_s['basename'] == f'{name}.sol')
    ]

    for _, row in matching_rows.iterrows():
        if 'unchecked_lowlevel' in row['findings'] or 'unchecked_send' in row['findings']:
            slither_constr_flagged.add(name)
            break
    

        
for name in unchecked_fct_contracts:
    matching_rows = df_c[
        (df_c['toolid'].str.contains('confuzzius')) &
        (df_c['basename'] == f'{name}.sol')
    ]

    for _, row in matching_rows.iterrows():
        if 'Unhandled_Exception' in row['findings']:
            confuzzius_fct_flagged.add(name)
            break



print("******* FLAGGED MYTHRIL fct + constr *********")
print(len(mythril_fct_flagged))
print(len(mythril_constr_flagged))
print("******* FLAGGED SLITHER *********")
print(len(slither_fct_flagged))
print(len(slither_constr_flagged))       
print("******* FLAGGED CONFUZZIUS *********")
print(len(confuzzius_fct_flagged))



# # *************************************
# # Jaccard
# # |(A Schnitt B)| / |(A Vereinigung B)|
# # *************************************

# Jaccard between Mythril Fct - Slither Fct

intersect_m_s_fct = mythril_fct_flagged.intersection(slither_fct_flagged)
union_m_s_fct = mythril_fct_flagged.union(slither_fct_flagged)

jaccard_m_s_fct = len(intersect_m_s_fct) / len(union_m_s_fct)
print("********* Jaccard Mythril - Slither Function")
print(jaccard_m_s_fct)


# Jaccard between Mythril Constr - Slither Constr

intersect_m_s_constr = mythril_constr_flagged.intersection(slither_constr_flagged)
union_m_s_constr = mythril_constr_flagged.union(slither_constr_flagged)

jaccard_m_s_constr = len(intersect_m_s_constr) / len(union_m_s_constr)
print("********* Jaccard Mythril - Slither Constructor")
print(jaccard_m_s_constr)


# Jaccard between Mythril Fct - Confuzzius Fct

intersect_m_c_fct = mythril_fct_flagged.intersection(confuzzius_fct_flagged)
union_m_c_fct = mythril_fct_flagged.union(confuzzius_fct_flagged)

jaccard_m_c_fct = len(intersect_m_c_fct) / len(union_m_c_fct)
print("********* Jaccard Mythril - Confuzzius Function")
print(jaccard_m_c_fct)


# Jaccard between Slither Fct - Confuzzius Fct

intersect_s_c_fct = slither_fct_flagged.intersection(confuzzius_fct_flagged)
union_s_c_fct = slither_fct_flagged.union(confuzzius_fct_flagged)

jaccard_s_c_fct = len(intersect_s_c_fct) / len(union_s_c_fct)
print("********* Jaccard Slither - Confuzzius Function")
print(jaccard_s_c_fct)



# # *************************************
# # Overlap
# # |(A Schnitt B)| / |B|
# # |(A Schnitt B)| / |A|
# # *************************************


overlap_s_m_fct = len(intersect_m_s_fct) / len(slither_fct_flagged)
print("********* Overlap - how much Slither in Mythril Function")
print(overlap_s_m_fct)

overlap_m_s_fct = len(intersect_m_s_fct) / len(mythril_fct_flagged)
print("********* Overlap - how much Mythril in Slither Function")
print(overlap_m_s_fct)


overlap_s_m_constr = len(intersect_m_s_constr) / len(slither_constr_flagged)
print("********* Overlap - how much Slither in Mythril Constructor")
print(overlap_s_m_constr)

overlap_m_s_constr = len(intersect_m_s_constr) / len(mythril_constr_flagged)
print("********* Overlap - how much Mythril in Slither Constructor")
print(overlap_m_s_constr)

# *****************

overlap_c_m_fct = len(intersect_m_c_fct) / len(confuzzius_fct_flagged)
print("********* Overlap - how much Confuzzius in Mythril Function")
print(overlap_c_m_fct)

overlap_m_c_fct = len(intersect_m_c_fct) / len(mythril_fct_flagged)
print("********* Overlap - how much Mythril in Confuzzius Function")
print(overlap_m_c_fct)

# *****************

overlap_c_s_fct = len(intersect_s_c_fct) / len(confuzzius_fct_flagged)
print("********* Overlap - how much Confuzzius in Slither Function")
print(overlap_c_s_fct)

overlap_s_c_fct = len(intersect_s_c_fct) / len(slither_fct_flagged)
print("********* Overlap - how much Slither in Confuzzius Function")
print(overlap_s_c_fct)
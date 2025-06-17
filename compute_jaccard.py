import json
import pandas as pd


with open('valid_combos_function.json', 'r') as f1:
    data_fct = json.load(f1)

with open('valid_combos_constructor.json', 'r') as f2:
    data_constr = json.load(f2)    

data = data_fct + data_constr

unchecked_contracts = [entry['contractName'] for entry in data if entry['checkSuccess'] is None]


df_m_s = pd.read_csv('tool_results/results_test_run_mythril_slither.csv', encoding='utf-16', skip_blank_lines=True)

df_c = pd.read_csv('tool_results/results_test_run_confuzzius2.csv', encoding='utf-16', skip_blank_lines=True)

mythril_flagged = set()
slither_flagged = set()
confuzzius_flagged = set()

for name in unchecked_contracts:
    matching_rows = df_m_s[
        (df_m_s['toolid'].str.contains('mythril')) &
        (df_m_s['basename'] == f'{name}.sol')
    ]

    for _, row in matching_rows.iterrows():
        if '104' in row['findings']:
            mythril_flagged.add(name)
            break
        

for name in unchecked_contracts:
    matching_rows = df_m_s[
        (df_m_s['toolid'].str.contains('slither')) &
        (df_m_s['basename'] == f'{name}.sol')
    ]

    for _, row in matching_rows.iterrows():
        if 'unchecked_lowlevel' in row['findings'] or 'unchecked_send' in row['findings']:
            slither_flagged.add(name)
            break        
        
for name in unchecked_contracts:
    matching_rows = df_c[
        (df_c['toolid'].str.contains('confuzzius')) &
        (df_c['basename'] == f'{name}.sol')
    ]

    for _, row in matching_rows.iterrows():
        if 'Unhandled_Exception' in row['findings']:
            confuzzius_flagged.add(name)
            break
        
print("******* FLAGGED MYTHRIL *********")
print(len(mythril_flagged))
#print(mythril_flagged)        
print("******* FLAGGED SLITHER *********")
print(len(slither_flagged))
#print(slither_flagged)        
print("******* FLAGGED CONFUZZIUS *********")
print(len(confuzzius_flagged))
#print(confuzzius_flagged)

# Jaccard
# |(A Schnitt B)| / |(A Vereinigung B)|

intersect_m_s = mythril_flagged.intersection(slither_flagged)
union_m_s = mythril_flagged.union(slither_flagged)

jaccard_m_s = len(intersect_m_s) / len(union_m_s)
print("********* Jaccard Mythril - Slither")
print(jaccard_m_s)


intersect_m_c = mythril_flagged.intersection(confuzzius_flagged)
union_m_c = mythril_flagged.union(confuzzius_flagged)

jaccard_m_c = len(intersect_m_c) / len(union_m_c)
print("********* Jaccard Mythril - Confuzzius")
print(jaccard_m_c)


intersect_s_c = slither_flagged.intersection(confuzzius_flagged)
union_s_c = slither_flagged.union(confuzzius_flagged)

jaccard_s_c = len(intersect_s_c) / len(union_s_c)
print("********* Jaccard Slither - Confuzzius")
print(jaccard_s_c)

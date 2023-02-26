#!/usr/bin/env python
# coding: utf-8

# In[ ]:


'''
    chara_ele(x)
        Retrieve list karakter berdasarkan elemen yang digunakan.
    Argument:
        x = element yang tersedia di dalam game Genshin Impact dalam tipe string
    
    Expected value:
        Cryo
        Hydro
        Pyro
        Electro
        Anemo
        Geo
        Dendro
    - 
'''

def chara_ele(x):
    list_cryo = ['Kamisato Ayaka', 'Shenhe', 'Kaeya', 'Diona', 'Chongyun', 'Rosaria', 'Ganyu', 'Aloy', 'Eula']
    list_pyro = ['Diluc', 'Thoma', 'Hu Tao', 'Amber', 'Klee', 'Bennett', 'Xinyan', 'Xiangling', 'Yanfei', 'Yoimiya']
    list_dendro = ['Tighnari', 'Collei', 'Nahida', 'Alhaitham', 'Yao Yao']
    list_anemo = ['Venti', 'Jean', 'Faruzan', 'Wanderer', 'Shikanoin Heizou', 'Xiao', 'Sayu', 'Sucrose', 'Kazuha']
    list_hydro = ['Tartaglia', 'Mona', 'Nilou', 'Barbara', 'Yelan', 'Xingqiu', 'Kamisato Ayato']
    list_geo = ['Zhongli', 'Yunjin', 'Ningguang', 'Arataki Itto', 'Gorou', 'Noelle', 'Albedo']
    list_electro = ['Raiden Shogun', 'Kujou Sara', 'Yae Miko', 'Kuki Shinobu', 'Fischl', 'Keqing', 'Beidou', 'Razor', 'Cyno']
    
    try:
        x = x.lower()
    
    except:
        print('isi dengan string')
    
    if x == 'cryo':
        result = list_cryo
    elif x == 'pyro':
        result = list_pyro
    elif x == 'dendro':
        result = list_dendro
    elif x == 'anemo':
        result = list_anemo
    elif x == 'hydro':
        result = list_hydro
    elif x == 'geo':
        result = list_geo
    elif x == 'electro':
        result = list_electro
    else:
        result = 'Tidak ada karakter berelemen yang dimminta'
    
    return result


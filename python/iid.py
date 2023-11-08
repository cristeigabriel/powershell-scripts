def iid_str_to_iid(x, n):
    result = f'IID {n};\n'
    sp = list(x.split('-'))
    result += f'{n}.Data1 = 0x{sp[0]};\n'
    result += f'{n}.Data2 = 0x{sp[1]};\n'
    result += f'{n}.Data3 = 0x{sp[2]};\n'
    for i in range(0, 2):
        cur = sp[3][2*i:][:2]
        result += f'{n}.Data4[{i}] = 0x{cur};\n'
        
    for i in range(0, 6):
        cur = sp[4][2*i:][:2]
        result += f'{n}.Data4[{i + 2}] = 0x{cur};\n'
        
    return result
    

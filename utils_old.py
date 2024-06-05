import re
# %%
# Save the content of the page to csv file
import io
def save_result_to_csv(text_per_page, filename):
    result = ''
    for i in range(0, len(text_per_page)):
        result += ''.join(text_per_page['Page_'+str(i)][4])
        result += '\n'
    with open(filename, 'w', encoding='utf-8') as f: 
        f.write(result)
        f.close()

def read_csv(filename) -> str:
    with io.open(filename, encoding = 'utf-8') as f:
        text_from_file = f.read()
        f.close
        return  text_from_file

def XML_date_format(strDate):
    d,m,y = strDate.split('.')
    #if d[0] == '0': d = d[1:]
    #if m[0] == '0': m = m[1:]
    return (y + '-' + m + '-' + d)  

def check_string(pattern, s):
    if re.compile(pattern).search(s):
        return True
    else:
        return False
    


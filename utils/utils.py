import re
import pandas as pd
import datetime 
# %%
# Save the content of the page to csv file
import io
def save_result_to_csv (text_per_page, filename):
    result= ''

def save_result_to_csv_old(text_per_page, filename):
    result= ''
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

def XML_date_format(in_date):
    if isinstance(in_date, str):
        d,m,y = in_date.split('.')
        #if d[0] == '0': d = d[1:]
        #if m[0] == '0': m = m[1:]
        return (y + '-' + m + '-' + d)  
    else:
        return in_date.strftime("%Y-%m-%d")   


   

def check_string(pattern, s):
    if re.compile(pattern).search(s):
        return True
    else:
        return False
    
def conver_digit_to_str(in_number)->str:
    if isinstance(in_number, float) or isinstance(in_number, int):
        return str(int(in_number))
    else:
        return str(in_number)
    
def test_utils():
    float = datetime.datetime.today().strftime("%Y-%m-%d")
    float = 283.00
    print(conver_digit_to_str(float))

if __name__ == '__main__':
    test_utils()


# %%
def test_utils():
    float = 2345102
    print(conver_digit_to_str(float))


# %%

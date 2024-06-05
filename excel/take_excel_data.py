import sys
import pandas as pd

def take_excel_data(excel_file):
    df = pd.read_excel(excel_file)
    slice = df.iloc[-1,:]
    print(slice)
    return slice


if __name__ == '__main__':
    #path='C:\Users\1\PythonApp\ReneLogAsel\test'
    file = sys.argv[1]
    take_excel_data(file)
from datetime import datetime

def car_hs_code(engine_value, prod_year) -> str:
    age = datetime.today().year - prod_year
    if engine_value <= 1000:
        if age <= 3 :
            return '8703211099'
        elif age <= 5:
            return '8703219098'
        elif age < 7:
            return '8703219094'
        else:
            return '8703219093'
        
    if engine_value <= 1500:
        if age <= 3 :
            return '8703221099'
        elif age <= 5:
            return '8703229098'
        elif age < 7:
            return '8703229094'
        else:
            return '8703229093'    

    elif engine_value <= 1800:
        if age <= 3 :
            return '8703231940'
        elif age <= 5:
            return '8703239049'
        elif age < 7:
            return '8703239042'
        else:
            return '8703239041'
            
    elif engine_value <= 2300:        
        if age <= 3 :
            return '8703231981'
        elif age <= 5:
            return '8703239083'
        elif age < 7:
            return '8703239082'
        else:
            return '8703239081'  
          
    if engine_value <= 3000:
        if age <= 3 :
            if engine_value <=2800:
                return '8703231982'
            else:
                return '8703231988'
        elif age <= 5:
            return '8703239089'
        elif age < 7:
            return '8703239088'
        else:
            return '8703239087' 
    else:
        if age <= 3 :
            return '8703241098'
        elif age <= 5:
            return '8703249098'
        elif age < 7:
            return '8703249094'
        else:
            return '8703249093'    

def test() -> None:        
    years = [2021, 2019, 2017, 2015] 
    values = [999, 1001 , 1501 , 1801 , 2301, 2801, 3001]
    for v in values:
        for y in years:
            print (f'Year = {y}, Engine Valus  = {v} hs_code = {car_hs_code(v, y) }')        
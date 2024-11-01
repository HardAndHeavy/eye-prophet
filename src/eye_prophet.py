import pandas as pd
from prophet import Prophet

def forecast(params):
  df = pd.json_normalize(params.get('history'))
  m = Prophet()
  m.fit(df)
  
  future = m.make_future_dataframe(periods=params.get('periods'), freq=params.get('freq'))
  return m.predict(future)

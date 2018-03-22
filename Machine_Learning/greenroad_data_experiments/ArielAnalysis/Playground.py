import numpy as np
from collections import Counter
import pandas as pd
from matplotlib.pyplot import plot

# with open('ArielQueryResults_SaftyLvlAsNum.csv') as csvfile:
    # table_reader = csv.DictReader(csvfile)
    # keys = table_reader.fieldnames
    # all_data_table = {}
    # firstTime = True
    # for row in table_reader:
    #     for key in keys:
    #         if firstTime:
    #             all_data_table[key] = []
    #         else:
    #             all_data_table[key].append(row[key])
    #     firstTime = False

# creating a panda table from CSV

panda_table = pd.read_csv('ArielQueryResults_SaftyLvlAsNum.csv', parse_dates=['Event_Time_IL_Time'])
print(panda_table.keys())
drivers_hist_sorted = list(Counter(panda_table['Driver_Name']).keys())

top_driver_table = panda_table[panda_table['Driver_Name'] == drivers_hist_sorted[0]]
top_driver_table = top_driver_table.sort_values(by='Event_Time_IL_Time')
print(top_driver_table.head(10)['Event_Time_IL_Time'])
print(top_driver_table.tail(10)['Event_Time_IL_Time'])

firstTripTripId = top_driver_table['Trip_ID'][0]
print('First trip ID: ' + str(firstTripTripId))

top_trip = top_driver_table[top_driver_table['Trip_ID'] == firstTripTripId]
# print(top_trip['Event_ID','Event_Name'].head(5))
# print(top_trip['Event_Name'].head(5))
print(top_trip['Event_Name'])
# print(top_trip.tail(5)['Event_Name'])


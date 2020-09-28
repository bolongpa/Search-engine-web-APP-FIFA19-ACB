import pandas as pd
import numpy as np
import mysql.connector
from sqlalchemy import create_engine

index = range(1, 151)
# create the database for fifa19
data = pd.read_csv('./FIFA19complete_player_dataset/data.csv')
# generate the dataframe of player_info
df_player_info = pd.DataFrame(np.nan, index=list(range(1,151)), columns=['Name', 'Age', 'Nationality', 'Jersey Number', 'Height', 'Weight'])
df_player_info['Name'] = data[:150]['Name'].to_numpy()
# strip ' '
player_name_list = list(df_player_info['Name'])
for i in range(len(player_name_list)):
    player_name_list[i] = player_name_list[i].replace(' ', '')
player_name_pdSeries = pd.Series(player_name_list)
player_name_pdSeries.index += 1
df_player_info['Name'] = player_name_pdSeries

df_player_info['Age'] = data[:150]['Age'].to_numpy()
df_player_info['Nationality'] = data[:150]['Nationality'].to_numpy()
df_player_info['Jersey Number'] = data[:150]['Jersey Number'].to_numpy()
df_player_info['Height'] = data[:150]['Height'].to_numpy()
df_player_info['Weight'] = data[:150]['Weight'].to_numpy()
# df_player_info = df_player_info.dropna()  # delete rows with NAN

# generate the dataframe of salary_info
df_salary_info = pd.DataFrame(np.nan, index=list(range(1,151)), columns=['ID', 'Value', 'Wage', 'Release Clause'])
df_salary_info['ID'] = data[:150]['ID'].to_numpy()
df_salary_info['Value'] = data[:150]['Value'].to_numpy()
df_salary_info['Wage'] = data[:150]['Wage'].to_numpy()
df_salary_info['Release Clause'] = data[:150]['Release Clause'].to_numpy()
# df_salary_info = df_salary_info.dropna()  # delete rows with NAN

# generate the dataframe of team_info
df_team_info = pd.DataFrame(np.nan, index=list(range(1,151)), columns=['ID', 'Name', 'Club', 'Position', 'Joined Date'])
df_team_info['ID'] = data[:150]['ID'].to_numpy()
df_team_info['Name'] = data[:150]['Name'].to_numpy()
# strip ' '
team_name_list = list(df_team_info['Name'])
for i in range(len(team_name_list)):
    team_name_list[i] = team_name_list[i].replace(' ', '')
team_name_pdSeries = pd.Series(team_name_list)
team_name_pdSeries.index += 1
df_team_info['Name'] = team_name_pdSeries

df_team_info['Club'] = data[:150]['Club'].to_numpy()
df_team_info['Position'] = data[:150]['Position'].to_numpy()
df_team_info['Joined Date'] = data[:150]['Joined'].to_numpy()
# df_team_info = df_team_info.dropna()  # delete rows with NAN

# connect to mysql database and insert dataframes
usr = input('Please input the user name:')
psw = input('Please input the password')
engine = create_engine('mysql+mysqlconnector://'+usr+':'+psw+'@127.0.0.1:3306', echo=False, )
pd.io.sql.to_sql(df_player_info, 'player_info', engine, schema='fifa19', if_exists='fail')
pd.io.sql.to_sql(df_salary_info, 'salary_info', engine, schema='fifa19', if_exists='fail')
pd.io.sql.to_sql(df_team_info, 'team_info', engine, schema='fifa19', if_exists='fail')

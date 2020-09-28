import pandas as pd
import numpy as np
import sqlite3
import mysql.connector
from sqlalchemy import create_engine


# Read sqlite tables into pandas DataFrames and save as csv
con = sqlite3.connect('./ACB 1994-2016 Spanish Basketball League Results/database.sqlite')
df_actor = pd.read_sql_query("SELECT * from actor", con)
#df_actor.to_csv('./ACB 1994-2016 Spanish Basketball League Results/actor.csv')
df_game = pd.read_sql_query("SELECT * from game", con)
#df_game.to_csv('./ACB 1994-2016 Spanish Basketball League Results/game.csv')
df_participant = pd.read_sql_query("SELECT * from participant WHERE is_coach is not null and first_name != 'Equipo'", con)
df_participant.to_csv('./ACB 1994-2016 Spanish Basketball League Results/participant.csv')
df_team = pd.read_sql_query("SELECT * from team", con)
#df_team.to_csv('./ACB 1994-2016 Spanish Basketball League Results/team.csv')
df_teamName = pd.read_sql_query("SELECT * from teamName", con)
#df_teamName.to_csv('./ACB 1994-2016 Spanish Basketball League Results/teamName.csv')
con.close()


# create the database for acb
actor = pd.read_csv('./ACB 1994-2016 Spanish Basketball League Results/actor.csv')
team = pd.read_csv('./ACB 1994-2016 Spanish Basketball League Results/team.csv')
participant = pd.read_csv('./ACB 1994-2016 Spanish Basketball League Results/participant.csv')
# generate the dataframe of player_info
df_player_info = pd.DataFrame(np.nan, index=list(range(1,151)),
                              columns=['acbid', 'full name', 'display_name', 'nationality', 'twitter'])
df_player_info['acbid'] = actor[:150]['acbid'].to_numpy()
df_player_info['full name'] = actor[:150]['full_name'].to_numpy()
df_player_info['display_name'] = actor[:150]['display_name'].to_numpy()
# strip ' '
player_name_list = list(df_player_info['display_name'])
for i in range(len(player_name_list)):
    player_name_list[i] = player_name_list[i].replace(' ', '')
player_name_pdSeries = pd.Series(player_name_list)
player_name_pdSeries.index += 1
df_player_info['display_name'] = player_name_pdSeries

df_player_info['nationality'] = actor[:150]['nationality'].to_numpy()
df_player_info['twitter'] = actor[:150]['twitter'].to_numpy()
# df_player_info = df_player_info.dropna()  # delete rows with NAN

# generate the dataframe of team_info
df_team_info = pd.DataFrame(np.nan, index=list(range(1,36)), columns=['id', 'acbid', 'founded year'])
df_team_info['id'] = team[:35]['id'].to_numpy()
df_team_info['acbid'] = team[:35]['acbid'].to_numpy()
df_team_info['founded year'] = team[:35]['founded_year'].to_numpy()
# df_team_info = df_team_info.dropna()  # delete rows with NAN

# generate the dataframe of participant_info
df_participant_info = pd.DataFrame(np.nan, index=list(range(1,151)),
                            columns=['game id', 'team id', 'display_name', 'first name', 'number'])
df_participant_info['game id'] = participant[:150]['game_id'].to_numpy()
df_participant_info['team id'] = participant[:150]['team_id'].to_numpy()
df_participant_info['display_name'] = participant[:150]['display_name'].to_numpy()
# strip ' '
participant_name_list = list(df_participant_info['display_name'])
for i in range(len(participant_name_list)):
    participant_name_list[i] = participant_name_list[i].replace(' ', '')
participant_name_pdSeries = pd.Series(participant_name_list)
participant_name_pdSeries.index += 1
df_participant_info['display_name'] = participant_name_pdSeries

df_participant_info['first name'] = participant[:150]['first_name'].to_numpy()
df_participant_info['number'] = participant[:150]['number'].to_numpy()
# df_game_info = df_game_info.dropna()  # delete rows with NAN


# connect to mysql database and insert dataframes
usr = input('Please input the user name:')
psw = input('Please input the password')
engine = create_engine('mysql+mysqlconnector://'+usr+':'+psw+'@127.0.0.1:3306', echo=False, )
pd.io.sql.to_sql(df_player_info, 'player_info', engine, schema='acb', if_exists='fail')
pd.io.sql.to_sql(df_team_info, 'team_info', engine, schema='acb', if_exists='fail')
pd.io.sql.to_sql(df_participant_info, 'participant_info', engine, schema='acb', if_exists='fail')

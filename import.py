import pandas as pd
from sqlalchemy import create_engine
import json
import requests
import sys


def format(word):  # remove punctuations and lower-casing
    rmchar = ['(', ')', '[', ']', '~', '=', '#', '-', '/', '\\', '$', ',', '.']  # characters to be removed
    for c in rmchar:
        word = word.replace(c, '')
    out = word.lower()
    return out


def main(databaseName, firebaseNode):
    url = 'https://inf551-project-17604.firebaseio.com/'
    # connect to database
    mysqlUsrName = input('Please input your MySQL user name: ')
    mysqlUsrPass = input('Please input your password: ')
    engine = create_engine('mysql+mysqlconnector://'+mysqlUsrName+':'+mysqlUsrPass+'@127.0.0.1:3306/'+databaseName
                           , echo=False)

    # show tables
    sql_tables = 'show tables'
    tables = list(pd.read_sql(sql_tables, con=engine).values.tolist())
    for i in range(len(tables)):
        tables[i] = tables[i][0]
    print('There are %d tables in this database: '%len(tables), tables)

    # invert index initialization
    indexNode = databaseName+'_index'
    invertIndexDic = dict()

    for j in range(len(tables)):  # convert table to json
        # read table to dataframe
        sql = 'select * from ' + tables[j]
        df = pd.read_sql(sql, con=engine)
        # get primary key of the table
        sql_pk = "SHOW KEYS FROM "+tables[j]+" WHERE Key_name = 'PRIMARY'"
        p_key_list = pd.read_sql(sql_pk, con=engine)['Column_name'].tolist()

        data_list = []
        for r in range(len(df)):
            temp_d = dict(df.loc[r])
            for k in temp_d.keys():  # formatting
                temp_d[k] = str(temp_d[k])
            data_list.append(temp_d)
            # add inverted index
            for va in temp_d.values():
                v_split = va.split(' ')  # split the value
                for v in v_split:
                    if v != '':
                        v_f = format(v)  # format v to satisfy the firebase uploading rule
                        if v_f not in invertIndexDic:
                            invertIndexDic[v_f] = []
                            index_dic = {"table":tables[j]}
                            for pk in p_key_list:
                                index_dic[pk] = temp_d[pk]
                            invertIndexDic[v_f].append(index_dic)
                        else:
                            index_dic = {"table": tables[j]}
                            for pk in p_key_list:
                                index_dic[pk] = temp_d[pk]
                            if index_dic not in invertIndexDic[v_f]:  # avoid duplication
                                invertIndexDic[v_f].append(index_dic)

        jsonObj = json.dumps(data_list)  # convert to json object

        # upload data to Firebase
        node = firebaseNode + '/' + tables[j] + '.json'
        nodeurl = url + node
        requests.put(nodeurl, data=jsonObj)
    # upload inverted index
    json_index = json.dumps(invertIndexDic)  #take(15000, invertIndexDic.items()))
    node_i = firebaseNode + '/' + indexNode + '.json'
    node_iurl = url + node_i
    requests.put(node_iurl, data=json_index)
    return 0


if __name__ == '__main__':
    arg = sys.argv
    databaseName = arg[1]
    firebaseNode = arg[2]
    main(databaseName, firebaseNode)
    print('Data loaded to Firebase.')

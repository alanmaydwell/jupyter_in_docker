"""
Some useful support functions
Intended for use in Jupyter Notebook
"""

import cx_Oracle
import pandas as pd

def run_query_df(sql, connstr, params=()):
    """Run query and return results as pandas dataframe"""
    conn = cx_Oracle.connect(connstr)
    df = pd.read_sql_query(sql, conn, params=params)#, chunksize=100)
    conn.close()  
    return df


def display_df(df):
    """Display full dataframe in Jupyter without auto truncation"""
    with pd.option_context('display.max_columns', None, 'display.max_rows', None, 'display.max_colwidth', -1):
        display(df)
        

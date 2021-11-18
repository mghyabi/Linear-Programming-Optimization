# -*- coding: utf-8 -*-
"""
Created on Sun Fri 16 01:54:17 2021

@author: mghyabi
"""

from pulp import *
import pandas as pd

# ################## PARAMETERS  ####################### #
solverPrecn = 0.01
verbose = True

# ################## IMPORT DATA ####################### #
DistanceData = pd.read_csv("DistanceData.csv", skiprows = 1,
                        names = ['Source','CoA','WpnsHq','CmbtOP'], index_col='Source')
StockData = pd.read_csv("StockData.csv", skiprows = 1,
                        names = ['Commodity','LHD','LPD','LSD'], index_col='Commodity')
DemandData = pd.read_csv("DemandData.csv", skiprows = 1,
                        names = ['Commodity','CoA','WpnsHq','CmbtOP'], index_col='Commodity')
PriorityData = pd.read_csv("PriorityData.csv", skiprows = 1,
                        names = ['Commodity','CoA','WpnsHq','CmbtOP'], index_col='Commodity')


if verbose:
    print(DistanceData)
    print(StockData)
    print(DemandData)
    print(PriorityData)
    
# ########### DEFINE INDICES AND SPECIAL SETS ########## #
Commodity = StockData.index # types of commodity
Source = DistanceData.index  # source node names
Sink = ['CoA','WpnsHq','CmbtOP'] # sink node names
transportTuple = [(i, j, k) for i in Commodity for j in Source for k in Sink]

# Create model
model = LpProblem("Transportation Problem", LpMinimize)

# ################### VARIABLES ######################## #
TRANSPORT = LpVariable.dicts("TRANSPORT", transportTuple, lowBound=0)

# ################## OBJECTIVE ######################### #
model.objective = lpSum([TRANSPORT[i,j,k] * DistanceData[k][j] * PriorityData[k][i] for i in Commodity for j in Source for k in Sink]) 

# ################## CONSTRAINTS ####################### #

if verbose:
    print("\nGenerating Constraints")

if verbose:
    print("\nStock Limits:")
for i in Commodity:
    for j in Source:
        model.constraints["stockLimit_" + str(i) + str(j)] = lpSum([TRANSPORT[i,j,k] for k in Sink]) <= StockData[j][i]
        if verbose:
            print(model.constraints["stockLimit_" + str(i) + str(j)])

if verbose:
    print("\nDemand Limits:")
for i in Commodity:
    for k in Sink:
        model.constraints["demandLimit_" + str(i) + str(k)] = lpSum([TRANSPORT[i,j,k] for j in Source]) >= DemandData[k][i]
        if verbose:
            print(model.constraints["demandLimit_" + str(i) + str(k)])


# ################## SOLVE THE MODEL ####################### #
status = model.solve()

numVariables = model.numVariables()
numConstraints = model.numConstraints()

if verbose:
    print("\nDone Loading Model; Number of Variables: " + str(numVariables) +
          "; Number of Constraints: " + str(numConstraints))


model.writeLP("Transport.lp")

# ################## PRINTING RESULTS ####################### #

print("\nDone solving. Status= " + LpStatus[status])

if status == 1:
    print("\nMinimum z: " + str(round(value(model.objective),2)))
    for i in Commodity:
        print("Transport Quantities of "+ str(i)+':')
        print("\t \tCoA\tWpnsHq\tCmbtOP")
        for j in Source:
            print('\t'+str(j)+'\t'+str(TRANSPORT[i,j,'CoA'].value())+'\t'+str(TRANSPORT[i,j,
                  'WpnsHq'].value())+'\t'+str(TRANSPORT[i,j,'CmbtOP'].value()))

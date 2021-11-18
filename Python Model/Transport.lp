\* Transportation_Problem *\
Minimize
OBJ: 1000 TRANSPORT_('Ammo',_'LHD',_'CmbtOP')
 + 1000 TRANSPORT_('Ammo',_'LHD',_'CoA')
 + 900 TRANSPORT_('Ammo',_'LHD',_'WpnsHq')
 + 1000 TRANSPORT_('Ammo',_'LPD',_'CmbtOP')
 + 1000 TRANSPORT_('Ammo',_'LPD',_'CoA')
 + 1800 TRANSPORT_('Ammo',_'LPD',_'WpnsHq')
 + 500 TRANSPORT_('Ammo',_'LSD',_'CmbtOP')
 + 500 TRANSPORT_('Ammo',_'LSD',_'CoA')
 + 450 TRANSPORT_('Ammo',_'LSD',_'WpnsHq')
 + 500 TRANSPORT_('Dry',_'LHD',_'CmbtOP')
 + 800 TRANSPORT_('Dry',_'LHD',_'CoA')
 + 400 TRANSPORT_('Dry',_'LHD',_'WpnsHq')
 + 500 TRANSPORT_('Dry',_'LPD',_'CmbtOP')
 + 800 TRANSPORT_('Dry',_'LPD',_'CoA')
 + 800 TRANSPORT_('Dry',_'LPD',_'WpnsHq')
 + 250 TRANSPORT_('Dry',_'LSD',_'CmbtOP')
 + 400 TRANSPORT_('Dry',_'LSD',_'CoA')
 + 200 TRANSPORT_('Dry',_'LSD',_'WpnsHq')
 + 200 TRANSPORT_('Fuel',_'LHD',_'CmbtOP')
 + 400 TRANSPORT_('Fuel',_'LHD',_'CoA')
 + 400 TRANSPORT_('Fuel',_'LHD',_'WpnsHq')
 + 200 TRANSPORT_('Fuel',_'LPD',_'CmbtOP')
 + 400 TRANSPORT_('Fuel',_'LPD',_'CoA')
 + 800 TRANSPORT_('Fuel',_'LPD',_'WpnsHq')
 + 100 TRANSPORT_('Fuel',_'LSD',_'CmbtOP')
 + 200 TRANSPORT_('Fuel',_'LSD',_'CoA')
 + 200 TRANSPORT_('Fuel',_'LSD',_'WpnsHq')
 + 800 TRANSPORT_('Water',_'LHD',_'CmbtOP')
 + 800 TRANSPORT_('Water',_'LHD',_'CoA')
 + 400 TRANSPORT_('Water',_'LHD',_'WpnsHq')
 + 800 TRANSPORT_('Water',_'LPD',_'CmbtOP')
 + 800 TRANSPORT_('Water',_'LPD',_'CoA')
 + 800 TRANSPORT_('Water',_'LPD',_'WpnsHq')
 + 400 TRANSPORT_('Water',_'LSD',_'CmbtOP')
 + 400 TRANSPORT_('Water',_'LSD',_'CoA')
 + 200 TRANSPORT_('Water',_'LSD',_'WpnsHq')
Subject To
demandLimit_AmmoCmbtOP: TRANSPORT_('Ammo',_'LHD',_'CmbtOP')
 + TRANSPORT_('Ammo',_'LPD',_'CmbtOP') + TRANSPORT_('Ammo',_'LSD',_'CmbtOP')
 >= 1
demandLimit_AmmoCoA: TRANSPORT_('Ammo',_'LHD',_'CoA')
 + TRANSPORT_('Ammo',_'LPD',_'CoA') + TRANSPORT_('Ammo',_'LSD',_'CoA') >= 2
demandLimit_AmmoWpnsHq: TRANSPORT_('Ammo',_'LHD',_'WpnsHq')
 + TRANSPORT_('Ammo',_'LPD',_'WpnsHq') + TRANSPORT_('Ammo',_'LSD',_'WpnsHq')
 >= 3
demandLimit_DryCmbtOP: TRANSPORT_('Dry',_'LHD',_'CmbtOP')
 + TRANSPORT_('Dry',_'LPD',_'CmbtOP') + TRANSPORT_('Dry',_'LSD',_'CmbtOP')
 >= 1
demandLimit_DryCoA: TRANSPORT_('Dry',_'LHD',_'CoA')
 + TRANSPORT_('Dry',_'LPD',_'CoA') + TRANSPORT_('Dry',_'LSD',_'CoA') >= 4
demandLimit_DryWpnsHq: TRANSPORT_('Dry',_'LHD',_'WpnsHq')
 + TRANSPORT_('Dry',_'LPD',_'WpnsHq') + TRANSPORT_('Dry',_'LSD',_'WpnsHq')
 >= 4
demandLimit_FuelCmbtOP: TRANSPORT_('Fuel',_'LHD',_'CmbtOP')
 + TRANSPORT_('Fuel',_'LPD',_'CmbtOP') + TRANSPORT_('Fuel',_'LSD',_'CmbtOP')
 >= 1
demandLimit_FuelCoA: TRANSPORT_('Fuel',_'LHD',_'CoA')
 + TRANSPORT_('Fuel',_'LPD',_'CoA') + TRANSPORT_('Fuel',_'LSD',_'CoA') >= 1
demandLimit_FuelWpnsHq: TRANSPORT_('Fuel',_'LHD',_'WpnsHq')
 + TRANSPORT_('Fuel',_'LPD',_'WpnsHq') + TRANSPORT_('Fuel',_'LSD',_'WpnsHq')
 >= 3
demandLimit_WaterCmbtOP: TRANSPORT_('Water',_'LHD',_'CmbtOP')
 + TRANSPORT_('Water',_'LPD',_'CmbtOP') + TRANSPORT_('Water',_'LSD',_'CmbtOP')
 >= 1
demandLimit_WaterCoA: TRANSPORT_('Water',_'LHD',_'CoA')
 + TRANSPORT_('Water',_'LPD',_'CoA') + TRANSPORT_('Water',_'LSD',_'CoA') >= 4
demandLimit_WaterWpnsHq: TRANSPORT_('Water',_'LHD',_'WpnsHq')
 + TRANSPORT_('Water',_'LPD',_'WpnsHq') + TRANSPORT_('Water',_'LSD',_'WpnsHq')
 >= 4
stockLimit_AmmoLHD: TRANSPORT_('Ammo',_'LHD',_'CmbtOP')
 + TRANSPORT_('Ammo',_'LHD',_'CoA') + TRANSPORT_('Ammo',_'LHD',_'WpnsHq')
 <= 1000
stockLimit_AmmoLPD: TRANSPORT_('Ammo',_'LPD',_'CmbtOP')
 + TRANSPORT_('Ammo',_'LPD',_'CoA') + TRANSPORT_('Ammo',_'LPD',_'WpnsHq') <= 0
stockLimit_AmmoLSD: TRANSPORT_('Ammo',_'LSD',_'CmbtOP')
 + TRANSPORT_('Ammo',_'LSD',_'CoA') + TRANSPORT_('Ammo',_'LSD',_'WpnsHq') <= 0
stockLimit_DryLHD: TRANSPORT_('Dry',_'LHD',_'CmbtOP')
 + TRANSPORT_('Dry',_'LHD',_'CoA') + TRANSPORT_('Dry',_'LHD',_'WpnsHq') <= 500
stockLimit_DryLPD: TRANSPORT_('Dry',_'LPD',_'CmbtOP')
 + TRANSPORT_('Dry',_'LPD',_'CoA') + TRANSPORT_('Dry',_'LPD',_'WpnsHq') <= 500
stockLimit_DryLSD: TRANSPORT_('Dry',_'LSD',_'CmbtOP')
 + TRANSPORT_('Dry',_'LSD',_'CoA') + TRANSPORT_('Dry',_'LSD',_'WpnsHq') <= 100
stockLimit_FuelLHD: TRANSPORT_('Fuel',_'LHD',_'CmbtOP')
 + TRANSPORT_('Fuel',_'LHD',_'CoA') + TRANSPORT_('Fuel',_'LHD',_'WpnsHq')
 <= 500
stockLimit_FuelLPD: TRANSPORT_('Fuel',_'LPD',_'CmbtOP')
 + TRANSPORT_('Fuel',_'LPD',_'CoA') + TRANSPORT_('Fuel',_'LPD',_'WpnsHq')
 <= 500
stockLimit_FuelLSD: TRANSPORT_('Fuel',_'LSD',_'CmbtOP')
 + TRANSPORT_('Fuel',_'LSD',_'CoA') + TRANSPORT_('Fuel',_'LSD',_'WpnsHq')
 <= 100
stockLimit_WaterLHD: TRANSPORT_('Water',_'LHD',_'CmbtOP')
 + TRANSPORT_('Water',_'LHD',_'CoA') + TRANSPORT_('Water',_'LHD',_'WpnsHq')
 <= 500
stockLimit_WaterLPD: TRANSPORT_('Water',_'LPD',_'CmbtOP')
 + TRANSPORT_('Water',_'LPD',_'CoA') + TRANSPORT_('Water',_'LPD',_'WpnsHq')
 <= 500
stockLimit_WaterLSD: TRANSPORT_('Water',_'LSD',_'CmbtOP')
 + TRANSPORT_('Water',_'LSD',_'CoA') + TRANSPORT_('Water',_'LSD',_'WpnsHq')
 <= 100
End

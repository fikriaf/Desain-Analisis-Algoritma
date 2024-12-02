#Mencari KPK dari 3 dan 4
def fpb(a,b):
	if a<b: 
		smaller=a 
	else: 
		smaller=b 
	for i in range (1,smaller+1): 
		if a%i == 0 and b%i == 0: 
			fpb = i 
	return fpb 

def kpk(a,b):
    kpk = int(a*b/fpb(a,b))
    return kpk

a = 3
b = 4

print('KPK dari ', a,' dan ', b,' adalah ', kpk(a,b))

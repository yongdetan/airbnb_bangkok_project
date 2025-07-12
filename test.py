l = [12, None, None]
q = [2, None, None]

mainRes = ",".join(f"|{str(x)}|" for x in l)
subRes  = ",".join(f"|{str(x)}|" for x in q)
print(mainRes)
print(subRes)
print(True if subRes in mainRes else False)
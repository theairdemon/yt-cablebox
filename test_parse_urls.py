import math


lines = []

with open("danny-videos.csv") as f:
  for x in f:
    newline = x[:-1].split("},{")
    # clean up extra brackets
    # newline[1] = newline[1][:-1]
    newline[0] = newline[0][1:]
    newline[2] = newline[2][:-1]
    # clean up duration
    newline[2] = str(math.floor(int(float(newline[2])) / 60)) + ":" + str(int(float(newline[2])) % 60)
    # append line
    lines.append(newline)

for i in range(0, 2):
  print(lines[i])
  # print()
  # print("====================")
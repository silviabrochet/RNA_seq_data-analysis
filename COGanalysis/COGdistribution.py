import re
import argparse

parser = argparse.ArgumentParser(description="")
parser.add_argument("COG_list", help="File containing the list of COG numbers")
parser.add_argument("COG_cat", help="File containing the COG catagories")
parser.add_argument("annotations", help="File containing the COG annotations")
parser.add_argument("-ignore_header", help="First line of annotations file is an header to ignore", action="store_true")
args = parser.parse_args()

print(args)

COG_list = args.COG_list
COG_cat = args.COG_cat
annotations = args.annotations
summary = re.sub(r'\.\w\w\w$', '_COGs_summary.txt', annotations)
header = args.ignore_header

COGS = {}
CATS = {}
TOT_COGS = 0
No_COG = 0

with open(COG_list, 'r') as infile:
    for COG in infile:
        if not COG.startswith("#"):
            COGS[COG.split("\t")[0].rstrip()] = COG.split("\t")[1].rstrip()

with open(COG_cat, 'r') as infile:
    for CAT in infile:
        if not CAT.startswith("#"):
            CATS[CAT.split("\t")[0].rstrip()] = {"Name": CAT.split("\t")[1].rstrip(), "Count": 0} 

with open(annotations, 'r') as infile:
    for gene in infile:
        if header:
            header = False
            continue
        COG_search = re.search('(COG\d\d\d\d)', gene)
        if not COG_search == None:
            COG_num = COG_search.group(1)
            COG_CAT = COGS[COG_num]
            if len(COG_CAT) > 1:
                for cat in list(COG_CAT):
                    CATS[cat]["Count"] += 1
                TOT_COGS += 1
            else:
                CATS[COG_CAT]["Count"] += 1
                TOT_COGS += 1
        else:
            No_COG += 1

with open(summary, 'w') as outfile:
    for CAT, VAL in CATS.iteritems():
        outfile.write("COG\t%s\t%s\t%d\n" %(CAT, VAL["Name"], VAL["Count"]))
    outfile.write("No COG\t\t\t%d\n" %(No_COG))
    outfile.write("Total COG\t\t\t%d\n" %(TOT_COGS))

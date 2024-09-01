# phekb, 2024.

import sys, csv, re

codes = [{"code":"35206732","system":"ICD10CM"},{"code":"35206732","system":"ICD10CM"},{"code":"44833391","system":"ICD10CM"},{"code":"44833391","system":"ICD10CM"},{"code":"4039536","system":"ICD10CM"},{"code":"4098017","system":"ICD10CM"},{"code":"4098753","system":"ICD10CM"},{"code":"4098754","system":"ICD10CM"},{"code":"4101578","system":"ICD10CM"},{"code":"4130191","system":"ICD10CM"},{"code":"4130679","system":"ICD10CM"},{"code":"4131127","system":"ICD10CM"},{"code":"4131915","system":"ICD10CM"},{"code":"4143167","system":"ICD10CM"},{"code":"4160887","system":"ICD10CM"},{"code":"4209139","system":"ICD10CM"},{"code":"4215784","system":"ICD10CM"},{"code":"4219853","system":"ICD10CM"},{"code":"4238904","system":"ICD10CM"},{"code":"4269919","system":"ICD10CM"},{"code":"4318674","system":"ICD10CM"},{"code":"441269","system":"ICD10CM"},{"code":"4219853","system":"ICD10CM"},{"code":"4209139","system":"ICD10CM"},{"code":"4039536","system":"ICD10CM"},{"code":"4318674","system":"ICD10CM"},{"code":"4143167","system":"ICD10CM"},{"code":"4269919","system":"ICD10CM"},{"code":"4215784","system":"ICD10CM"},{"code":"4238904","system":"ICD10CM"},{"code":"4131915","system":"ICD10CM"},{"code":"4131127","system":"ICD10CM"},{"code":"4130679","system":"ICD10CM"},{"code":"4130191","system":"ICD10CM"},{"code":"4098017","system":"ICD10CM"},{"code":"4098753","system":"ICD10CM"},{"code":"4098754","system":"ICD10CM"},{"code":"4101578","system":"ICD10CM"},{"code":"4160887","system":"ICD10CM"},{"code":"441269","system":"ICD10CM"},{"code":"35206732","system":"ICD10CM"},{"code":"35206732","system":"ICD10CM"},{"code":"44833391","system":"ICD10CM"},{"code":"44833391","system":"ICD10CM"},{"code":"4039536","system":"ICD10CM"},{"code":"4098017","system":"ICD10CM"},{"code":"4098753","system":"ICD10CM"},{"code":"4098754","system":"ICD10CM"},{"code":"4101578","system":"ICD10CM"},{"code":"4130191","system":"ICD10CM"},{"code":"4130679","system":"ICD10CM"},{"code":"4131127","system":"ICD10CM"},{"code":"4131915","system":"ICD10CM"},{"code":"4143167","system":"ICD10CM"},{"code":"4160887","system":"ICD10CM"},{"code":"4209139","system":"ICD10CM"},{"code":"4215784","system":"ICD10CM"},{"code":"4219853","system":"ICD10CM"},{"code":"4238904","system":"ICD10CM"},{"code":"4269919","system":"ICD10CM"},{"code":"4318674","system":"ICD10CM"},{"code":"441269","system":"ICD10CM"},{"code":"4219853","system":"ICD10CM"},{"code":"4209139","system":"ICD10CM"},{"code":"4039536","system":"ICD10CM"},{"code":"4318674","system":"ICD10CM"},{"code":"4143167","system":"ICD10CM"},{"code":"4269919","system":"ICD10CM"},{"code":"4215784","system":"ICD10CM"},{"code":"4238904","system":"ICD10CM"},{"code":"4131915","system":"ICD10CM"},{"code":"4131127","system":"ICD10CM"},{"code":"4130679","system":"ICD10CM"},{"code":"4130191","system":"ICD10CM"},{"code":"4098017","system":"ICD10CM"},{"code":"4098753","system":"ICD10CM"},{"code":"4098754","system":"ICD10CM"},{"code":"4101578","system":"ICD10CM"},{"code":"4160887","system":"ICD10CM"},{"code":"441269","system":"ICD10CM"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('autoimmune-hemolytic-anemia-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["haemolytic-autoimmune-hemolytic-anemia---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["haemolytic-autoimmune-hemolytic-anemia---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["haemolytic-autoimmune-hemolytic-anemia---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)

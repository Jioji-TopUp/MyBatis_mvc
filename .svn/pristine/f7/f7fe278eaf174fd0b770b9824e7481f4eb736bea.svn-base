from pdfminer.converter import PDFPageAggregator
from pdfminer.layout import LAParams, LTTextBoxHorizontal
from pdfminer.pdfparser import PDFParser
from pdfminer.pdfdocument import PDFDocument
from pdfminer.pdfpage import PDFPage
from pdfminer.pdfpage import PDFTextExtractionNotAllowed
from pdfminer.pdfinterp import PDFResourceManager
from pdfminer.pdfinterp import PDFPageInterpreter
import sys
import string
import time
import pymongo


fp = open(sys.argv[1],'rb')



parser = PDFParser(fp)

document = PDFDocument(parser)

if not document.is_extractable:
    raise PDFTextExtractionNotAllowed


rsrcmgr = PDFResourceManager()

laparams = LAParams()


device = PDFPageAggregator(rsrcmgr, laparams=laparams)


interpreter = PDFPageInterpreter(rsrcmgr, device)


all_data = ""
for page in PDFPage.create_pages(document):

    interpreter.process_page(page)
    layout = device.get_result()


    for x in layout:
        if hasattr(x,"get_text"):
            sss = x.get_text()
            for c in string.punctuation:
                sss = sss.replace(c, "")
            all_data+=sss;
fp.close()


temptime = time.strftime("%Y-%m-%d %X ")

conn = pymongo.MongoClient("192.168.3.59",27017)

db = conn.zykyImportData
mongo_pdf = db.mongo_pdf
new_post = {"TYPE":"PDF",'date':all_data,"TIME":temptime}
mongo_pdf.insert(new_post)
print(temptime)


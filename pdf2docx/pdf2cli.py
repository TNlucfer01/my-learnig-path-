#!/usr/bin/env python3

import sys
from pdf2docx import Converter
import os

def convert(pdf_path, docx_path=None):
    if not os.path.exists(pdf_path):
        print("Error: File not found.")
        return
    if not docx_path:
        docx_path = os.path.splitext(pdf_path)[0] + '.docx'
    cv = Converter(pdf_path)
    cv.convert(docx_path)
    cv.close()
    print(f"✅ Converted: {docx_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: pdf2docx-cli <input.pdf> [output.docx]")
    else:
        convert(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None)


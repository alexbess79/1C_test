#!/usr/bin/env python3
import os, zipfile

def build_cfe(src_dir, output_file):
    with zipfile.ZipFile(output_file, 'w') as cfe:
        for root, _, files in os.walk(src_dir):
            for file in files:
                cfe.write(os.path.join(root, file))

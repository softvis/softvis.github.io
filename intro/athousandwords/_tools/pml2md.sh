#!/bin/bash
xml tr pml2md.xslt AThousandWords.pml | sed 's/\.pdf/.png/g' | grep -v " by Farooq" > index.markdown
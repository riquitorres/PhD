#!/bin/bash

# Function to convert EPS to PDF and PNG
convert_eps() {
    local eps_file="$1"
    local pdf_file="${eps_file%.eps}.pdf"
    local png_file="${eps_file%.eps}.png"

    # Convert to PDF
    epstopdf "$eps_file" --outfile="$pdf_file"

    # Convert to PNG
    convert -density 300 "$pdf_file" "$png_file"
}

# Find all EPS files in subdirectories
find . -type f -name "*.eps" | while read -r eps_file; do
    echo "Converting $eps_file"
    convert_eps "$eps_file"
done


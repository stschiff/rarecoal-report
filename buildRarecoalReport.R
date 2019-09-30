#!/usr/bin/env Rscript

library(rmarkdown)
library(docopt)

doc <- 'Usage:
    buildRarecoalReport.R --template <template_file> --params <params_file> --fitTable <fitTable_file> --output <output_file>'

opts <- docopt(doc)

print("running with Options:")
print(opts)

reportTemplate <- "~/dev/rarecoal-report/rarecoalModelFitReport.Rmd"
if(!file.exists(reportTemplate)) {
    stop("could not find report-template. Please modify the path to <reportTemplate> in this script to point to the template rarecoalModelFitReport.Rmd")
}

render(reportTemplate,
    params = list(
        filename_template = opts$template_file,
        filename_params = opts$params_file,
        filename_fitTable = opts$fitTable_file),
    output_file = opts$output_file,
    output_dir = dirname(opts$output_file)
)

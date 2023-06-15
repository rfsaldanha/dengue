# Prepape files

files_dirs <- list(
  "parquet_aggregated" = "dengue-data/parquet_aggregated/",
  "parquet_classification" = "dengue-data/parquet_classification/",
  "parquet_improved" = "dengue-data/parquet_improved/",
  "parquets" = "dengue-data/parquets/"
)

temp_dir <- tempdir()
dir.create(paste0(tempdir(), "/dengue-zip/"))
temp_dir <- paste0(temp_dir, "/dengue-zip/")

for(i in 1:length(files_dirs)){
  file_name <- paste0(temp_dir, names(files_dirs)[[i]], ".zip")
  zip::zip(zipfile = file_name, files = files_dirs[[i]], compression_level = 1)
}


# Create release
repo_name <- "rfsaldanha/dengue"
release_tag <- format(Sys.time(), format = "%Y%m%d_%H%M%S")
piggyback::pb_release_create(repo = repo_name, tag = release_tag)

Sys.sleep(10)

# Files list to upload
files_list <- list.files(temp_dir, full.names = TRUE)

# Upload files
for(i in files_list){
  piggyback::pb_upload(file = i, repo = repo_name, tag = release_tag)
}

# Remove temp files
file.remove(files_list)
file.remove(temp_dir)

# Prepare files
temp_dir <- tempdir()
dir.create(paste0(tempdir(), "/dengue-zip/"))
temp_dir <- paste0(temp_dir, "/dengue-zip/")

# Download release files
repo_name <- "rfsaldanha/dengue"
piggyback::pb_download(dest = temp_dir, repo = repo_name, overwrite = TRUE)

# Unzip files
files_list <- list.files(temp_dir, full.names = TRUE)
for(i in files_list){
  zip::unzip(zipfile = i)
}

# Remove temp files
file.remove(files_list)
file.remove(temp_dir)




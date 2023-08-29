# Node name
node_name <- function(){
  res <- Sys.info()
  node_name <- res[[4]]
  
  return(node_name)
}

# Data dir reference, depending on node
data_dir <- function(dest){
  node_name <- node_name()
  
  if(node_name == "fatnode"){
    ref <- "/data/raphaelfs/dengue_data_files"
  } else if(node_name == "rfsaldanha") {
    ref <- "/home/raphael/projects/dengue/dengue_data_files"
  }
  #TODO: include macos location
  
  ref <- file.path(ref, dest)
  
  return(ref)
}

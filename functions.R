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
    ref <- "/data/raphaelfs/dengue_data"
  } else {
    ref <- NULL
  }
  
  if(is.null(ref)){
    ref <- file.path(dest)
  } else {
    ref <- file.path(ref, dest)
  }
  
  return(ref)
}

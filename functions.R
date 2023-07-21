# Node name
node_name <- function(){
  res <- Sys.info()
  node_name <- res[[4]]
  
  return(node_name)
}

# Data dir reference, depending on node
data_dir <- function(){
  node_name <- node_name()
  
  if(node_name %in% c("dell")){
    ref <- "data"
  } else if(node_name == "fatnode"){
    ref <- "/data/raphaelfs/dengue_data"
  }
  
  return(ref)
}

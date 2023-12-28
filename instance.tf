# using terraform modules of resource defined in module folder

module "instance" {
    source = "./modules/webserver"
  
}
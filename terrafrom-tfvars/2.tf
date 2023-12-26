 variable "username" {
   type = string
   //if default value is passed it will take default value and don't ask the user for inpu 
}

variable "age" {
   type = number
}



output "print" {
    value = "hello the username is ${var.username} and age is ${var.age}"
}
    
  

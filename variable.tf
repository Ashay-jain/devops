# variable "username" {
#   default = "kk"
#   //if default value is passed it will take default value and don't ask the user for inpu 
#   }

# variable "age" {
#   type = number
# }

# variable "dd" {
#     type = list
# }


variable "usernames" {
    type = map
    default = {
        j = 10
        z = 20
    }
}
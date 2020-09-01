variable "instance_id" {
  description = "Instance ID - Parameter Passed from ec2 Instance"
  type        = list
}

variable "availability_zone" {
  description = "availability Zone - Parameter Passed from ec2 Instance"
  type        = list
}

variable "force_detach" {
  description = "Force Detach (Allowed volumes to be destroyed with ec2)"
  type        = bool
  default     = false
}

variable "encrypted" {
  description = "Should Volume be encrypted"
  type        = bool
  default     = true
}

variable "instance_count" {
  description = "Instance Count"
  type        = number
  default     = 1
}

variable "device_name" {
  description = "Device Name (eg. /dev/xvdh)"
  type        = string
  default     = "/dev/xvdh"
}

variable "volume_size" {
  description = "Volume Size"
  type        = number
  default     = 100
}

variable "volume_type" {
  description = "Volume Type"
  type        = string
  default     = "gp2"
}

variable "volume_iops" {
  description = "Volume IOPS"
  type        = string
  default     = "100"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Volume Name"
  type        = string
  default     = "default"
}
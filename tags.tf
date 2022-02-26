module "tags" {
  depends_on  = [aws_instance.od-instance, aws_spot_instance_request.spot-instance]
  count       = length(local.ALL_TAGS)
  source      = "git::https://github.com/raghudevopsb62/terraform-tags"
  TAG_NAME    = lookup(element(local.ALL_TAGS, count.index), "name")
  TAG_VALUE   = lookup(element(local.ALL_TAGS, count.index), "value")
  RESOURCE_ID = local.ALL_TAG_IDS
}

locals {
  ALL_TAGS = [
    {
      name  = "Name"
      value = "${var.COMPONENT}-${var.ENV}"
    },
    {
      name  = "env"
      value = var.ENV
    },
    {
      name  = "component"
      value = var.COMPONENT
    },
    {
      name  = "project_name"
      value = "roboshop"
    }
  ]
}


locals {
  ALL_INSTANCE_IDS = concat(aws_instance.od-instance.*.id, aws_spot_instance_request.spot-instance.*.spot_instance_id)
  ALL_SPOT_IDS     = aws_spot_instance_request.spot-instance.*.id
  #ALL_EBS_IDS = aws_spot_instance_request.spot-instance.*.ebs_block_device
  ALL_TAG_IDS = concat(local.ALL_INSTANCE_IDS, local.ALL_SPOT_IDS)
  TAG_NAME    = "${var.COMPONENT}-${var.ENV}"
}
//
output "EBS" {
  value = lookup(flatten(aws_spot_instance_request.spot-instance.*.root_block_device), "volume_id")
}
//
//// lookup(map, key, default)

//value = "${lookup(data.aws_kms_secrets.api_key.*.plaintext[count.index], "secret_name")}"
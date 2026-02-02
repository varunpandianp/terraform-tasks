
module "instance_provisioning" {
  source = "git::ssh://git@github.com/varunpandianp/terraform-tasks.git//07-Modules-SG-Workspace/module?ref=main"
  sgname      = var.sgname
  cidr        = var.cidr
  mytag       = var.mytag
  amiid       = var.amiid
  machinetype = var.machinetype
  keyname     = var.keyname
}
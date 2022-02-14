provider "aws" {
    profile= "default"
    region= "ap-south-1"
}
module vpc {
    source= "../modules1/vpc"
    cidr_block= "10.0.0.0/16"
}
module security_group {
    source= "../modules1/security_group" 
    vpc_id = module.vpc.my_vpc_id

}
module instance {
  source= "../modules1/ec2"
  instance_type= "t2.medium"
  subnet_id= module.vpc.pub_subnet_id
  security_group_id= module.security_group.vpc_security_group_id
  depends_on= [module.security_group]
}
module alb {
    source= "../modules1/loadbalancer"
    subnet1 =module.vpc.pub_subnet_id
    subnet2 =module.vpc.pub2_subnet_id
    instance_id1= module.instance.instance_id1
    instance_id2= module.instance.instance_id2
    instance_id3= module.instance.instance_id3
    security_group_id= module.security_group.vpc_security_group_id
    vpc_id = module.vpc.my_vpc_id
    depends_on= [module.instance]
}

module rds {
    source =           "../modules1/Database"
    db_instance =      "db.t2.micro"
    rds_subnet1 =       module.vpc.pvt_subnet_id
    rds_subnet2 =       module.vpc.pvt2_subnet_id
    engine_name =       "mysql"
    en_version  =       "8.0"
    storage_type =      "gp2"
    security_group_id = module.security_group.vpc_security_group_id
    depends_on = [module.vpc, module.instance]
}
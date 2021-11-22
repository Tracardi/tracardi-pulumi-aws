import pulumi
import pulumi_aws as aws

my_ip = '195.210.25.6'
domain = 'tracardi'
instance_type = 'r6g.large.elasticsearch'  # r6g.large.search
number_od_data_nodes = 3
master_type = 'r6g.large.elasticsearch'
number_of_master_nodes=3
elastic_version = "7.10"
current_region = aws.get_region()
current_caller_identity = aws.get_caller_identity()

tracardi = aws.elasticsearch.Domain(
    domain,
    cluster_config=aws.elasticsearch.DomainClusterConfigArgs(
        instance_type=instance_type,
        instance_count=number_od_data_nodes,
        dedicated_master_enabled=True,
        dedicated_master_type=master_type,
        dedicated_master_count=number_of_master_nodes
    ),
    elasticsearch_version=elastic_version,
    tags={
        "Domain": "Tracardi",
    },
    advanced_security_options=aws.elasticsearch.DomainAdvancedSecurityOptionsArgs(
        enabled=True,
        internal_user_database_enabled=True,
        master_user_options=aws.elasticsearch.DomainAdvancedSecurityOptionsMasterUserOptionsArgs(
            master_user_name="risto",
            master_user_password="RISTO@ri100"
        )
    ),
    encrypt_at_rest=aws.elasticsearch.DomainEncryptAtRestArgs(enabled=True),
    node_to_node_encryption=aws.elasticsearch.DomainNodeToNodeEncryptionArgs(enabled=True),
    ebs_options=aws.elasticsearch.DomainEbsOptionsArgs(ebs_enabled=True, volume_size=10, volume_type="gp2"),
    access_policies=f"""{{
      "Version": "2012-10-17",
      "Statement": [
        {{
          "Effect": "Allow",
          "Action": "es:*",
          "Principal": {{
            "AWS": [
                "*"
            ]
          }},
          "Resource": "arn:aws:es:{current_region.name}:{current_caller_identity.account_id}:domain/{domain}/*",
          "Condition": {{
            "IpAddress": {{"aws:SourceIp": ["{my_ip}/32"]}}
          }}
        }}
      ]
    }}
    """
)

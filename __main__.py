import pulumi
import pulumi_aws as aws
import pulumi_eks as eks


my_ip = '195.210.25.6'
instance_type = 't3.small.elasticsearch'  # r6g.large.search
number_of_data_nodes = 3
master_type = 't3.small.elasticsearch'
number_of_master_nodes = 3
elastic_version = "7.10"
current_region = aws.get_region()
current_caller_identity = aws.get_caller_identity()
encrypt_at_rest = True

from pulumi import ResourceOptions
from pulumi_kubernetes.helm.v3 import Chart, ChartOpts, FetchOpts

config = pulumi.Config()
domain = "tracardi-es-0001"

tracardi = aws.elasticsearch.Domain(
    resource_name=domain,
    cluster_config=aws.elasticsearch.DomainClusterConfigArgs(
        instance_type=instance_type,
        instance_count=number_of_data_nodes,
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
            master_user_password="RI100x4kdyf7!^h"  # RISTO@ri100
        )
    ),
    domain_endpoint_options=aws.elasticsearch.DomainDomainEndpointOptionsArgs(
        tls_security_policy='Policy-Min-TLS-1-2-2019-07',
        enforce_https=True),
    encrypt_at_rest=aws.elasticsearch.DomainEncryptAtRestArgs(enabled=encrypt_at_rest),
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

# # Create a VPC for our cluster.
#
#
# # Create an EKS cluster with the configuration.
# cluster = eks.Cluster(
#     "tracardi-cluster",
#     instance_type="t2.medium",
#     desired_capacity=2,
#     min_size=1,
#     max_size=2,
# )
#
# # Export the cluster's kubeconfig.
# pulumi.export('kubeconfig', cluster.kubeconfig)
#
# wordpress = Chart(
#     "wpdev",
#     ChartOpts(
#         chart="wordpress",
#         version="9.6.0",
#         fetch_opts=FetchOpts(
#             repo="https://charts.bitnami.com/bitnami",
#         ),
#     ),
#     opts=ResourceOptions(provider=cluster.provider),
# )


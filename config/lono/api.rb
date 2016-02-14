template "prod-api-app.json" do
  source "app.json.erb"
  variables(
    :ami => "ami-e0c19f83",
    :availability_zone => "ap-southeast-2a",
    :instance_type => "t2.micro",
    :port => "8443",
    :high_threshold => "15",
    :high_periods => "4",
    :low_threshold => "5",
    :low_periods => "10",
    :max_size => "3",
    :min_size => "3",
    :down_adjustment => "-3",
    :up_adjustment => "3",
    :ssl_cert => "arn:aws:iam::260763030200:server-certificate/loadbalancer00"
  )
end

template "prod-api-worker.json" do
  source "app.json.erb"
  variables(
    :ami => "ami-e0c19f83",
    :availability_zone => "ap-southeast-2a",
    :instance_type => "t2.micro",
    :port => "8443",
    :high_threshold => "15",
    :high_periods => "4",
    :low_threshold => "5",
    :low_periods => "10",
    :max_size => "3",
    :min_size => "3",
    :down_adjustment => "-3",
    :up_adjustment => "3",
    :user_data_script => "ruby_script.rb.erb",
    :ssl_cert => "arn:aws:iam::260763030200:server-certificate/loadbalancer00"
  )
end

template "prod-api-redis.json" do
  source "db.json.erb"
  variables(
    :ami => "ami-e0c19f83",
    :availability_zone => "ap-southeast-2a",
    :instance_type => "t2.micro",
    :port => "8443",
    :volume_size => "20"
  )
end

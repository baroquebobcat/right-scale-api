RightScale API Gem
=======================

A client library for the RightScale API. Still under development, but it has enough written to be useful.

There aren't any tests yet and it doesn't fully cover all the object types RightScale's API supports.

RightScale's [API Docs]("http://support.rightscale.com/15-References/RightScale_API_Reference_Guide")

Usage Examples
----------------------

###Stopping a Server
    RightScaleAPI.login user, pass
    account = RightScaleAPI::Account.get id
    foo_server = account.servers.find {|s| s.nickname == 'foo'}
    foo_server.stop

### Spinning up a new server with an elastic ip associated at launch
    RightScaleAPI.login user, pass
    account = RightScaleAPI::Account.get id
    
    ip = account.create_ec2_elastic_ip :nickname => 'foo'

    foo_template = account.server_templates.find {|s| s.nickname == 'foo template'}
    foo_deployment = account.deployments.find {|d| d.nickname == 'foo deployment'}
    foo_security_group = account.ec2_security_groups.find { |s| s.aws_group_name == 'foo security group' }

    #since there is no index for ssh keys, you need to find their id through the UI and get them directly(ugh).
    foo_ssh_key =  account.get_ec2_ssh_key("1234567890")

    server = account.create_server :nickname => 'foo',
    			  :server_template => foo_template,
			  :deployment => foo_deployment,
			  :ec2_ssh_key => foo_ssh_key,
			  :ec2_security_groups => foo_security_group

    #we do this as an update, because rightscale's api doesn't let you set this on create (as of May 2010)
    server.update :associate_eip_at_launch => true, 
                  :ec2_elastic_ip => ip
    server.start

#### Create a Deployment

    account.create_deployment :nickname	   => 'foo',
    			      :description => 'foo bar baz'
#### Show all Servers
    account.servers
#### Show an individual server
    account.servers.find {|server| server.id ==}

## Contributions Welcome

Fork away.

Needs tests, filling out the object types, etc.
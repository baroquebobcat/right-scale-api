RightScale API Gem
=======================

A client library for the RightScale API.

RightScale's [API Docs]("http://support.rightscale.com/15-References/RightScale_API_Reference_Guide")

Usage Examples
----------------------

    RightScaleAPI.login user, pass

    account = RightScaleAPI::Account.get id

    foo_server = account.servers.find {|s| s.nickname == 'foo'}

    foo_server.stop
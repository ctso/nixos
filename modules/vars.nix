{
  hostname,
}:

{
  inherit hostname;

  # general
  timeZone = "America/Los_Angeles";

  # user
  defaultUser = "ctso";
  defaultUserUID = 1000;
  defaultUserGID = 1000;
  defaultUserFullName = "Chris Soyars";
  defaultUserEmail = "chris@soyars.com";
}


{ ... }:

{
  homebrew.casks = [
    {
      name = "slack";
      greedy = true;
    }
    {
      name = "zoom";
      greedy = true;
    }
  ];
}

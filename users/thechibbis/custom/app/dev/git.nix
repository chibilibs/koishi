{
  programs.git = {
    enable = true;
    userName = "Guilherme Menezes";
    userEmail = "guilhermeladins@gmail.com";
    signing = {
      key = "71DD7D123159CF74";
      signByDefault = true;  
    };
    extraConfig = {
      safe = {
        directory = [ "/etc/nixos" ];
      };
    
      branch = {
        autosetuprebase = "always";
      };
      
      github = {
        user = "thechibbis";
      };
    };
  }; 
}
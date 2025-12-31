defmodule Solution do

  def is_valid_ip(ip) do
      ip_regex = ~r/
        \b
        (
          0
          |[1-9]
          |[1-9][0-9]
          |1[0-9][0-9]
          |2[0-4][0-9]
          |25[0-5]
        )
        (
          \.
          (
            0
            |[1-9]
            |[1-9][0-9]
            |1[0-9][0-9]
            |2[0-4][0-9]
            |25[0-5]
          )
        )
        {3}
        \b
      /x
      String.match?(ip, ip_regex)
    end
end

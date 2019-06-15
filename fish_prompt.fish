function fish_prompt
  set -l name (whoami)
  set -l mood " "(__fish_prompt_print_status $status)
  set -l host " at "(set_color yellow)(prompt_hostname)(set_color normal)
  set -l time ", "(date "+%H:%M:%S")
  set -l c_wd " in "(set_color blue)(prompt_pwd)(set_color normal)

  set -l git_info (__fish_git_prompt "on %s")

  set -l statuses "$name$mood$host$time$c_wd"

  echo $statuses
  echo "% "
end

function __fish_prompt_print_status --argument-names code
  if test $code -eq 0
      echo -n -s (set_color green)":)"(set_color normal)
  else
      echo -n -s (set_color red)":("(set_color normal)
  end
end
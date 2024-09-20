function mktmp --wraps='mkdir tmp && cd tmp' --wraps='mkdir -p tmp && cd tmp' --wraps='mkdir -p ./tmp && cd ./tmp' --description 'alias mktmp mkdir -p ./tmp && cd ./tmp'
  mkdir -p ./tmp && cd ./tmp $argv
        
end

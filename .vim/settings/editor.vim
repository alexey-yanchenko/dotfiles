set tabstop=2                         " количество пробелов, которыми символ табуляции отображается в тексте
set softtabstop=2                     " количество пробелов, которыми символ табуляции отображается при добавлении
set shiftwidth=2                      " ширина отступов в пробелах, добавляемых командами >> и <<
set smarttab                          " нажатие Tab в начале строки приведет к добавлению отступа, ширина которого соответствует shiftwidth
set expandtab                         " в режиме вставки (и для команд >> и <<) заменяет символ табуляции на соответствующее количество пробелов
set cc=120                            " добавляет вертикальную линию отсечения"

"set autoindent                       " копирует отступы с текущей строки при добавлении новой
set smartindent                       " делает то же, что и autoindent плюс автоматически выставляет отступы в «нужных» местах

set hlsearch
set ignorecase
set incsearch
set smartcase

set number                            " отображать номера строк
set nowrap                            " не переносить длинные строки

set laststatus=2                      " статусная строка включена всегда

set backspace=indent,eol,start

syntax on

set t_Co=256
syntax enable
set background=dark
colorscheme railscasts
hi ColorColumn               ctermbg=8 guibg=#FFFFFF

" syntax highlight .nghaml files
au BufRead,BufNewFile *.nghaml set filetype=haml

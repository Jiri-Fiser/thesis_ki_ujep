\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kitheses}[2021/11/15 Thesis of KI UJEP]

\RequirePackage{ifthen}
\RequirePackage{iftex}
\RequirePackage[a4paper]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}

\newboolean{feminum}
\newboolean{czech}

\DeclareOption{male}{\setboolean{feminum}{false}}
\DeclareOption{female}{\setboolean{feminum}{true}}
\DeclareOption{czech}{\setboolean{czech}{true}}
\DeclareOption{english}{\setboolean{czech}{false}}
\ProcessOptions\relax

\ifthenelse{\boolean{czech}}{%
\LoadClass[12pt,english,czech]{scrbook}}{%
\LoadClass[12pt,czech,english]{scrbook}}

\geometry{margin=2cm,inner=2.5cm,headheight=1cm,footskip=1.25cm}

% nastavení stránky
\fancyhf{}
\fancyfoot[CE,CO]{\arabic{page}}
\fancyhead[LE,RO]{\leftmark}
\fancyhead[LO,RE]{}

\fancypagestyle{plain}{%
\fancyhf{} % prázdné záhlaví
\fancyfoot[C]{\thepage} % except the center
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}

%\renewcommand{\chaptermark}[1]{\markboth{\arabic{chapter}. #1}{}}

%nastavení hloubky číslování a hloubky obsahu (do sections)
\setcounter{secnumdepth}{1} 
\setcounter{tocdepth}{1}

%nastavení odstavců
\setlength{\parskip}{\medskipamount}  % malá mezera mezi odstavci
\setlength{\parindent}{0pt} % žádné odsazení prvního řádku
\onehalfspacing % řádkování 1 a půl

% nastavení českých typografických pravidel
\iftutex
\usepackage{polyglossia}
\ifthenelse{\boolean{czech}}
{\setdefaultlanguage{czech}\setotherlanguage{english}}
{\setdefaultlanguage{english}\setotherlanguage{czech}}
\else
\usepackage{babel}
\fi


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kitheses}[2021/11/19 Thesis of KI UJEP]

\RequirePackage{ifthen}
\RequirePackage{iftex}
\RequirePackage[a4paper]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}

\newboolean{feminum}
\newboolean{czech}
\newboolean{api}
\newboolean{bc}
\newboolean{is}

\setboolean{is}{false}

\DeclareOption{male}{\setboolean{feminum}{false}}
\DeclareOption{female}{\setboolean{feminum}{true}}
\DeclareOption{czech}{\setboolean{czech}{true}}
\DeclareOption{english}{\setboolean{czech}{false}}
\DeclareOption{api_bc}{\setboolean{api}{true}\setboolean{bc}{true}}
\DeclareOption{api_ing}{\setboolean{api}{true}\setboolean{bc}{false}}
\DeclareOption{edu_bc}{\setboolean{api}{false}\setboolean{bc}{true}}
\DeclareOption{edu_mgr}{\setboolean{api}{false}\setboolean{bc}{false}}
\DeclareOption{is_bc}{\setboolean{api}{true}\setboolean{bc}{true}\setboolean{is}{true}}

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

\newcommand{\univerzita}{Univerzita Jana Evangelisty Purkyně \\v Ústí nad Labem}
\newcommand{\fakulta}{Přírodovědecká fakulta}
\newcommand{\katedra}{Katedra informatiky}
\ifthenelse{\boolean{api}}{\newcommand{\program}{Aplikovaná informatika}}
     {\ifthenelse{\boolean{bc}}{\newcommand{\program}{Informatika pro vzdělávání}}
                               {\newcommand{\program}{Učitelství informatiky pro střední školy}}}
\ifthenelse{\boolean{is}}{\newcommand{\obor}{Informační systémy}}
                         {\newcommand{\obor}{}}

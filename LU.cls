\NeedsTeXFormat{LaTeX2e}[2018/12/01]
\ProvidesClass{LU}[2019/04/28 v1.1, Latvijas Universitāte]

% Bakalaura darba, maģistra darbam paredzētā _report_ klase, burti ir 12pt uz A4 papīra (5.2. iekš LU 03.02.2012, 1/38 )
\LoadClass[a4paper,12pt]{report}

% atkāpes no malām kreisā 3cm pārējās 2cm (5.2. iekš LU 03.02.2012, 1/38 )
\usepackage[top=20mm,bottom=20mm,left=30mm,right=20mm]{geometry}

% 1.5 rindstarpa (5.2. iekš LU 03.02.2012, 1/38 )
\linespread{1.5}

% matemātikas pierakstam - nezinu cik no šīm vajag, bet par ļaunu nenāks visas
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{amsfonts}

\usepackage{thmtools}
\usepackage{color}
\usepackage{nameref}
\usepackage{hyperref}
\usepackage{varioref}
\usepackage{cleveref}
\usepackage{soul}
\usepackage[toc,acronym]{glossaries}

\usepackage{booktabs}

% saišu krāsas iekš PDF (atsaucēm, saturam, saitēm), [ja nemaldos tad gaumes lieta]
\hypersetup{colorlinks=true, linkcolor=black, urlcolor=blue, citecolor=darkgray}

% XeLaTeX atbalsts tiek pieslēgts ar šādām pakotnēm:
\usepackage{fontspec}
\usepackage{xunicode}
\usepackage{xltxtra} 

% Valodu atbalsts
\usepackage{polyglossia}
\setdefaultlanguage{latvian}
\setotherlanguages{english,russian}
\usepackage{fixlatvian}

% fontu prasības (!ieteicams! - nav obligāti jāievēro)  (5.2. iekš LU 03.02.2012, 1/38 )
\setmainfont[Mapping=tex-text]{Times New Roman}
\setsansfont[Mapping=tex-text]{Arial}
\newfontfamily\russianfont{Times New Roman}

\usepackage{indentfirst}
\setlength{\parindent}{1cm} % jaunas rindkopas atkāpe (5.2. iekš LU 03.02.2012, 1/38 )
\setlength{\parskip}{3pt}

\usepackage{setspace}
\usepackage{graphicx}

% use for tables with multirow support
\usepackage{multirow}

% atkal gaumes lieta, kā tiek noformētie šie fragmenti
\theoremstyle{plain}
\newtheorem{definicija}{Definīcija}
\newtheorem{pienemums}{Pieņēmums}
\newtheorem{piemers}{Piemērs}
\newtheorem{teorema}{Teorēma}
\newtheorem{apgalvojums}[teorema]{Apgalvojums}
\newtheorem{lemma}[teorema]{Lemma}
\newtheorem{sekas}[teorema]{Sekas}
\newtheorem{piezime}[teorema]{Piezīme}
\renewcommand\proofname{Pierādījums}
\newenvironment{pieradijums}{\begin{proof}}{\end{proof}}

% satura rādītājs
\usepackage{tocloft}
\renewcommand{\cftchapdotsep}{\cftdotsep}


\let \originalnumberline \numberline
\def \numberline#1{\originalnumberline{#1.}} % saturā nodaļas ir 1.1. (punkts pēc cipara) (3. pielikums iekš LU 03.02.2012, 1/38 )

% izmantotajai bibliotēkai. Var pagulēt par BibTex (ir pat tāda lieta kā _export_bibtex_ )
\usepackage{natbib}

\usepackage{url}
\usepackage{etoolbox}
\usepackage{verbatim}

% attēlu un tabulu nosaukumiem (5. pielikums iekš LU 03.02.2012, 1/38 )
\usepackage[font=small,labelfont=it,textfont=bf]{caption} 
\captionsetup[table]{justification=raggedleft,singlelinecheck=off,labelsep = newline}

\usepackage[font=small,labelfont=normal,textfont=it]{subcaption} % apakšvirsrakstiem - nav nekur aprakstīts tāpēc konfigurācija pēc gaumes

\usepackage{xcolor}


\patchcmd{\abstract}{\null\vfil}{}{}{}



% Nodaļu nosaukumu labošana - aizdomas, ka šo var izdarīt labāk un pareizāk
\usepackage{titlesec}
\titleformat{\chapter}{\normalfont\fontsize{14}{14}\bfseries}{\thechapter.\hspace{10pt}}{0pt}{\normalfont\fontsize{14}{14}\bfseries\uppercase}
\titleformat{\section}{\normalfont\fontsize{14}{14}\bfseries}{\thesection.\hspace{10pt}}{0pt}{}
\titleformat{\subsection}{\normalfont\fontsize{14}{14}\bfseries}{\thesubsection.\hspace{10pt}}{0pt}{}
\titlespacing{\chapter}{0cm}{2em}{2em} % Nodaļu virsraksat atstarpes no augšas un apakšas


% pielikumiem
\usepackage[toc]{appendix}

% šis paredzēts, lai darbā varētu ievietot programmas koda fragmentus.
\usepackage{listings} 
\lstnewenvironment{code}[1][] % Koda pieraksta bloks \begin{code}[options] \end{code}. Labā lieta, ka šis bloks nedalās pa lapām, lai nebūtu puse vienā un puse otrā lapā.
{
    \noindent
    \minipage{\linewidth}         
    \vspace{0.5\baselineskip}
    \lstset{    
        basicstyle=\ttfamily\footnotesize,
        backgroundcolor=\color{gray!10},
        frame=single,
        captionpos=b, 
        tabsize=4,
        extendedchars=true,
        rulecolor=\color{black!30},
        escapeinside={\%*}{*)},                
        #1
    }
}
{\endminipage}



% Definēti lauki, kas katram studentam jāaizpilda pašiem 
\makeatletter
    \newcommand{\studentid}[1]{\def \@studentid {#1}}
    \newcommand{\supervisor}[1]{\def \@supervisor {#1}}
    \newcommand{\thesistype}[1]{\def \@thesistype {#1}}
    \newcommand{\subject}[1]{\def \@subject {#1}}
    \newcommand{\wordcount}[1]{\def \@wordcount {#1}}
    \newcommand{\email}[1]{\def \@email {#1}}
    \newcommand{\university}[1]{\def \@university {#1}}
    \newcommand{\faculty}[1]{\def \@faculty {#1}}
    \newcommand{\location}[1]{\def \@location {#1}}
    \supervisor{}
    \studentid{}
    \thesistype{}
    \subject{}
    \wordcount{}
    \email{}
    \university{}
    \faculty{}
    \location{}
\makeatother

% titullapas zīmēšanas funkcija \maketitle
\makeatletter
\def \maketitle {%
    \begin{titlepage}        
        \begin{center}            
            {\Large\MakeUppercase\@university}\\
            {\Large\MakeUppercase \@faculty}
        \end{center}
        ~\vfill
        \begin{center}            
            \textbf{\LARGE\MakeUppercase \@title} \\
            \ifx \@thesistype \@empty
                \relax
            \else
                \vspace{3em}
                {\Large\MakeUppercase \@thesistype} \\
            \fi
        \end{center}
        ~\vfill
        \noindent
        %\begin{minipage}{\linewidth}                                                
            \ifx @author \@empty
                \relax
            \else
                \large{Autors: \textbf{\@author}}\\
                \ifx \@studentid \@empty
                    \relax
                \else
                    \large{Studenta apliecības Nr.: \@studentid} \\
                \fi
            \fi
            \ifx \@supervisor \@empty
                \relax
            \else
                Darba vadītājs: \@supervisor \\
                \vspace{0.5in}
            \fi                        
        %\end{minipage}
        ~\vfill    
        \begin{center}
            \ifx \@location \@empty
                \relax
            \else
                {\Large\MakeUppercase \@location~\the\year}
            \fi            
        \end{center}
    \end{titlepage}
}
\makeatother

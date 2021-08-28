\author{Daniel Levy Moreno}
\RequirePackage[dvipsnames]{xcolor}
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muratcan_cv}[2020/04/15 Muratcan CV Class]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage[left=0.75in,top=0.3in,right=0.75in,bottom=0.6in]{geometry}
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}
\RequirePackage{multicol}
\RequirePackage{scrextend}

\pagestyle{empty}

% Setup

\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setcitezenship}[1]{\def\@citezenship{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}

% Helper commands
\newcommand\colorize[1]{
  \color{\@themecolor} #1
}

\newcommand\textbfColor[1]{
  \textbf{\colorize{#1}}
}

\newcommand\emphColor[1] {
  \emph{\colorize{#1}}
}

\newcommand\ruleafter[1]{#1~{\color{black!60!\@themecolor}\hrulefill}} % a trick to put the line with <before> parameter in \titleformat

% Setup for coverletter
\newcommand*{\setcompanyname}[1]{\def\@companyname{#1}}
\newcommand*{\setfirstline}[1]{\def\@firstline{#1}}
\newcommand*{\setclaimedposition}[1]{\def\@claimedposition{#1}}


\hypersetup{
  colorlinks=true,
  urlcolor=cyan,
}

% View commands
% Header

% can makebox also be used?
\newcommand\headerview{
  \begin{multicols}{2}
    \qrcode{0.1}{./images/qr/qr_code_en}{https://cv.dlevym.me/}
    \columnbreak
    \begin{flushright}
      {\name  \linebreak}
      {\small \@position \linebreak}
      {\small \@citezenship \\[0.66cm]}
      {\contact}
    \end{flushright}
  \end{multicols}
}

% profilpicture
\newsavebox{\picbox}
\newcommand{\qrcode}[3]{%
  \href{#3}{
    \savebox{\picbox}{%
      \includegraphics[scale=#1]{#2}}%
    \tikz\node [draw, %
    line width=4pt, color=white,%
    minimum width=\wd\picbox,minimum height=\ht\picbox,%
    path picture={ \node at (path picture bounding box.center)%
      {\usebox{\picbox}};}]%
    {};
  }
}

% contactsubviews 
\newcommand{\linkedinview}{\href{\@linkedinaccount}{\faLinkedinSquare\ \footnotesize linkedin}}
\newcommand{\githubview}{\href{\@githubaccount}{\faGithubSquare\ \footnotesize github}}

\newcommand{\name}{%
  {\large \color{\@themecolor} {\@firstname \ \@lastname}}
}

\newcommand{\contact}{
  {
    \small \@mobile \\[0.1cm]
    \small \@mail \\[0.1cm]
    \linkedinview \cps \githubview \\[0.1cm]
  }
}

% Coverletterview
\newcommand\coverletter[1]{
  \coverlettersubview
  \section{} \vspace{1ex} 
  \textbfColor{ \@firstline, \\[0.1cm]}
  \setlength{\parskip}{1em}
  #1
}

\newcommand\coverlettersubview{
  \begin{tabular}{>{\scshape \bfseries \color{\@themecolor}}l  >{\small }l}
    Company: & \@companyname \\
    Position: & \@claimedposition \\
  \end{tabular}
}


% colorfulpipeseperator
\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}
\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}

% Edit section styles

\titleformat{\section} {
  \large\bfseries\scshape\raggedright\color{\@themecolor}
}{}{0.2em}{\ruleafter}

\titlespacing*{\section}{-1pt}{0pt}{0.5ex}

% Textview commands
\newcommand{\experience}[2]{%
  \hspace{1em} \scshape \textbfColor{#1}
}

\newcommand{\datetext}[1]{%
  {\textit{  \footnotesize \mdseries{ \color{black!10!\@themecolor} #1 }}}
}

\newcommand{\datedexperience}[2]{%
  \begin{small}
    \hspace{1em} \scshape \textbfColor{#1}
  \end{small}
  \hfill
  \datetext{#2} \\[0.02cm]
}

\newcommand{\explanation}[1]{
  \textsc{\indent \footnotesize #1 } \\[0.2cm]
}

\newcommand{\explanationdetail}[1]{%
  \indent
  \begin{minipage}{\linewidth}
    \footnotesize #1
  \end{minipage} \\[0.05cm]
}

\newcommand{\addblocktext}[2]{%
  \section{#1} 
  \indent \explanationdetail{#2}
}

\newcommand\createskill[2]{%
  \textsc{\textbfColor{#1}} & #2 \\[0.1cm]
}

\newcommand\createtablecontent[1]{%
  \foreach \x [count=\xi] in {#1} {\ifthenelse{\xi=1}{\x}{\\ \x}}
}

\newcommand\createskills[1]{
  \explanationdetail{
    \begin{tabular}{rl}
      #1
    \end{tabular}
  }
  \vspace{-2.5mm}
}

\newcommand{\itemwithtext}[1]{
  \item \footnotesize #1
}

\newcommand\createbullets[1]{%
  \vspace{-5mm}
  \begin{addmargin}[0.2cm]{0cm}
    \renewcommand{\labelitemi}{\coloredbullet}
    \begin{itemize}
            \setlength\itemsep{0.01cm}
            \makeatletter
            \@for\thisitem:=#1\do{\itemwithtext{\thisitem}}
            \makeatother
    \end{itemize}
  \end{addmargin}
  \vspace{2.5mm}
}

\newcommand\createfootnote{
  \renewcommand{\footnotesize}{\fontsize{7pt}{11pt}\selectfont}
  \renewcommand\footnoterule{\rule{0.468\linewidth}{0.5pt}}
  \let\thefootnote\relax\footnote{
    \hspace{0.1cm} \today\ / Like this design? \href{https://github.com/danilevy1212/cv-latex}{Check out it's source code!}
  }
}

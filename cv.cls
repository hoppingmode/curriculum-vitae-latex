\ProvidesClass{cv}
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                CLASS OPTIONS
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3RD PARTY PACKAGES
%-------------------------------------------------------------------------------
% Create fixed length tables
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Text alignment
\RequirePackage{ragged2e}
% Configure page layout
\RequirePackage{geometry}
% Create headers & footers
\RequirePackage{fancyhdr}
% Allow \if-\then-\else statements
\RequirePackage{xifthen}
% Manage math fonts
\RequirePackage{unicode-math}
% Use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
% Manage colors
\RequirePackage[skins]{tcolorbox}
% Create paragraphs
\RequirePackage{parskip}
% Additional icons/symbols
\RequirePackage{pifont}
% Manage hyperlinks
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={Curriculum Vitae ~ Matt Young},
  pdfauthor={Matt Young},
  pdfsubject={CV},
  pdfkeywords={
    CV, curriculum, vitae, resume, software, engineer, technology, computer, science, developer, programmer,
    web, mobile, android, linux,
    python, java, c++, javascript, html, css, postgresql,
    react, react-native, angular, node, express, latex,
    git, github, web, services, docker, linux, bash
  }
}


%-------------------------------------------------------------------------------
%                DIRECTORY LOCATIONS
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                LAYOUT
%-------------------------------------------------------------------------------
% Page margins
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}


%-------------------------------------------------------------------------------
%                COLORS
%-------------------------------------------------------------------------------
% Grayscale
\definecolor{gray}{HTML}{616161}
\definecolor{darkgray}{HTML}{212121}
\definecolor{blackgray}{HTML}{414141}

% Text
\colorlet{lighttext}{gray}
\colorlet{text}{darkgray}
\colorlet{darktext}{darkgray}

% Awesome Theme
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-darknight}{HTML}{131A28}


%-------------------------------------------------------------------------------
%                FONTS
%-------------------------------------------------------------------------------
\setfontfamily\FA[Path=\@fontdir]{FontAwesome}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}


%-------------------------------------------------------------------------------
%                PERSONAL INFORMATION
%-------------------------------------------------------------------------------
\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\linkedin}[2]{\def\@linkedin{#1}\def\@linkedinname{#2}}


%-------------------------------------------------------------------------------
%                UTILITIES
%-------------------------------------------------------------------------------
% Align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                HEADER AND FOOTER
%-------------------------------------------------------------------------------
\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable header or footer using fancyhdr
\pagestyle{fancy}

\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{0.4mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}

\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\headernamestyle}[1]{{\fontsize{32pt}{1em}\headerfontlight\color{lighttext} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{10}{1em}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8pt}{1.5em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.8pt}{1em}\headerfont\color{text} #1}}

% Usage: \makecvheader or \makecvheader[C|L|R]
% Example: \makecvheader or \makecvheader[C]
\newcommand*{\makecvheader}[1][C]{%
  \newlength{\headertextwidth}
  \setlength{\headertextwidth}{\textwidth}%

  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headernamestyle{\@name}%
    \\[\acvHeaderAfterNameSkip]%
    \headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}%
    \headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}%

    \headersocialstyle{%
      \href{https://www.linkedin.com/in/\@linkedin}{\acvHeaderIconSep\faLinkedinSquare\acvHeaderIconSep\@linkedinname}\acvHeaderSocialSep%
      \faPhone\acvHeaderIconSep\@mobile\acvHeaderSocialSep%
      \faEnvelope\acvHeaderIconSep\@email\acvHeaderSocialSep%
      \ifthenelse{\isundefined{\@homepage}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{http://\@homepage}{\faHome\acvHeaderIconSep\@homepage}%
        }%
      \href{https://github.com/\@github}{\acvHeaderIconSep\faGithub\acvHeaderIconSep\@github}%
    }%
  \end{minipage}%
  \vspace{5mm}
}

\newcommand*{\footerstyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\color{gray} #1}}
\newcommand*{\footerfont}{\sourcesanspro}

% Usage: \makecvfooter{<left>}{<center>}{<right>}
% Example: \makecvfooter{L}{C}{R}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
}


%-------------------------------------------------------------------------------
%                SECTION
%-------------------------------------------------------------------------------
% Switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}

\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}

% Usage: \cvsection{<section-title>}
% Example: \cvsection{Education}
\newcommand{\cvsection}[1]{%
\vspace{\acvSectionTopSkip}
\sectionstyle{#1}
\phantomsection
\color{gray}\vhrulefill{0.9pt}
}


%-------------------------------------------------------------------------------
%                SUBSECTION
%-------------------------------------------------------------------------------
\newcommand*{\subsectionstyle}[1]{\vspace{100mm}{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}

% Usage: \cvsubsection{<subsection-title>}
% Example: \cvsubsection{Professional Experience}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection
}


%-------------------------------------------------------------------------------
%                PARAGRAPH
%-------------------------------------------------------------------------------
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}

\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  \vspace{2mm}
}


%-------------------------------------------------------------------------------
%                ENTRY
%-------------------------------------------------------------------------------
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}

\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{text} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{lighttext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{lighttext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
% Example: \cventry{Software Engineer}{Google}{Mountain View, CA}{2012 - PRESENT}{\begin{cvitems}...\end{cvitems}}
\newcommand*{\cventry}[5]{%
  \vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}
      {\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
      {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\
      \entrypositionstyle{#1} & \entrydatestyle{#4} \\}
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}%
}


%-------------------------------------------------------------------------------
%                SUBENTRY
%-------------------------------------------------------------------------------
% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\mdseries\color{lighttext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{7pt}{1em}\bodyfont\scshape\color{lighttext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{lighttext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\upshape\color{text} #1}}

\newenvironment{cvsubentries}{%
  \begin{center}
}{%
  \end{center}
}

% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
% Example: \cvsubentry{Software Engineer}{Google}{Mountain View, CA}{\begin{cvitems}...\end{cvitems}}
\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
      {\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}
      {}
      {\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
      {}
      {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}


%-------------------------------------------------------------------------------
%                ITEMS
%-------------------------------------------------------------------------------
\newenvironment{cvitems}{%
  \vspace{-4.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{-4.0mm}
}


%-------------------------------------------------------------------------------
%                FOOTNOTES
%-------------------------------------------------------------------------------
\newcommand*{\footnotestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{lighttext} #1}}
\renewcommand{\footnote}[1]{\vspace{5mm}{\footnotestyle{#1}}\vspace{-3mm}}


%-------------------------------------------------------------------------------
%                PROJECTS
%-------------------------------------------------------------------------------
\newenvironment{cvprojects}{%
  \vspace{\acvSectionTopSkip}
  \vspace{-2.0mm}
}{%
}

\newcommand*{\cvproject}[3]{%
    {\entrytitlestyle{#1}\\}
    \descriptionstyle{#2}
      #3
}

\newenvironment{cvprojectbulletitems}{
  \begin{dinglist}{229}
}{
  \end{dinglist}
  }

\newcommand{\cvprojectbullet}[2]{%
    \ifx#2\item
    \fontsize{9pt}{1em}\upshape\color{darkgray}{\textbf{#1:}}%
        #2
    \else
      \fontsize{9pt}{1em}\upshape\color{darkgray}{\textbf{#1:} \bodyfontlight{#2}}
    \fi
}



%-------------------------------------------------------------------------------
%                SKILLS
%-------------------------------------------------------------------------------
\newcommand*{\skillexperiencestyle}[1]{{\fontsize{11pt}{1em}\bodyfont\bfseries\color{text} #1}}
\newcommand*{\skilltypestyle}[1]{{\fontsize{8pt}{2em}\bodyfont\bfseries\color{text} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{8pt}{2em}\bodyfontlight\color{text} #1}}

\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth *    \real{0.9}}}
}{%
    \end{tabular*}
  \end{center}
}

% Usage: \cvskillexperience{<capacity>}
% Example: \cvskillexperience{Professional}
\newcommand*{\cvskillexperience}[1]{\skillexperiencestyle{#1} \\}

% Usage: \cvskill{<type>}{<skillset>}
% Example: \cvskill{Programming}{C, C++, Java, Python, JavaScript, HTML, CSS}
\newcommand*{\cvskill}[2]{\skilltypestyle{#1} & \skillsetstyle{#2} \\}

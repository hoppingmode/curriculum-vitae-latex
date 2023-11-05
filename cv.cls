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
% \RequirePackage{etoolbox}
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
%                FOOTNOTES
%-------------------------------------------------------------------------------
\newcommand*{\footnotestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{lighttext} #1}}
\renewcommand{\footnote}[1]{\vspace{5mm}{\footnotestyle{#1}}\vspace{-3mm}}



\ProvidesClass{cv}
\NeedsTeXFormat{LaTeX2e}


% =======================================================
% CLASS OPTIONS
% =======================================================
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


% =======================================================
% 3RD PARTY PACKAGES
% =======================================================
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
% Load font ligatures
\RequirePackage{fontspec}
% Automatically create line breaks
\RequirePackage{needspace}
% Manage hyperlinks
\RequirePackage[pdfusetitle,hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={Curriculum Vitae ~ Matt Young},
  pdfauthor={Matt Young},
  pdfsubject={Software Engineer CV},
  pdfkeywords={
    Full, Stack, Software, Engineer, Curriculum, Vitae, CV,
    REST, API, GraphQL, Microservices, Docker, Docker Compose,
    React, Angular, nodejs, HTML, TypeScript, Javascript, SASS, Java,
    expressjs, Spring, Spring Boot, Docker, Microservices,
    C\#, C++, Python, PostgreSQL, Latex,
    Git, GitHub, Linux, Bash,
    Web, Mobile
  }
}


% =======================================================
% LAYOUT
% =======================================================
% Page margins
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}


% =======================================================
% COLORS
% =======================================================
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    The CSW poster template    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Federico Sichetti, Lorenzo Gerini

% cswposter.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cswposter}[CSW Poster Session]

\LoadClass{article}
\pagestyle{empty}

% Define geometry and text encodings
\RequirePackage[a0paper, portrait, margin=5cm]{geometry}
\geometry{bottom=10cm, top=3cm}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{nopageno}
\RequirePackage{hyphenat}

% Boxes
\RequirePackage{xcolor}
\RequirePackage[poster]{tcolorbox}
\tcbuselibrary{skins}

% Get fonts
\RequirePackage{anyfontsize}
\RequirePackage{sansmathfonts}
\RequirePackage[T1]{fontenc}
\RequirePackage[rm]{roboto}
\RequirePackage[sfdefault]{FiraSans}

% Add TikZ for drawing
\RequirePackage{tikz}
\usetikzlibrary{shapes,backgrounds,arrows.meta}

% Bibliography
\RequirePackage[backend=biber]{biblatex}
\RequirePackage{csquotes}
\defbibheading{bibliography}[]{}
\nocite{*}
\newcommand{\refsize}{\fontsize{28}{20}\selectfont}
\AtEveryBibitem{\refsize}

% Define font sizes
\renewcommand{\tiny}{\fontsize{10}{15}\selectfont}
\renewcommand{\scriptsize}{\fontsize{15}{20}\selectfont}   
\renewcommand{\footnotesize}{\fontsize{20}{25}\selectfont}
\renewcommand{\small}{\fontsize{25}{30}\selectfont}
\renewcommand{\normalsize}{\fontsize{30}{35}\selectfont}
\renewcommand{\large}{\fontsize{35}{40}\selectfont}
\renewcommand{\Large}{\fontsize{40}{45}\selectfont}
\renewcommand{\LARGE}{\fontsize{50}{60}\selectfont}
\renewcommand{\huge}{\fontsize{60}{70}\selectfont}
\renewcommand{\Huge}{\fontsize{65}{80}\selectfont}

\setlength\smallskipamount{6pt plus 2pt minus 2pt}
\setlength\medskipamount{12pt plus 4pt minus 4pt}
\setlength\bigskipamount{24pt plus 8pt minus 8pt}

\definecolor{color1}{HTML}{FF595E}%{CA054D}
\definecolor{color2}{HTML}{8AC926}%{A4D4B4}
\definecolor{color3}{HTML}{FFCA3A}%{3B1C32}

% Environment
\tcbset{poster/rows=6}
\tcbset{poster/columns=2}
\newenvironment{cswposter}{%
    \maketitle
    \begin{tcbposter}[
        poster = {
            %showframe,
            height = .8\textheight,
            spacing = 1cm,
        },
        boxes = {
            enhanced,
            valign=center,
        	colback=white,
        	coltext=black,
        	coltitle=white,
        	frame style={
                bottom color=color2,
                top color=color1
            },
        	boxrule=.5ex,
        	arc=20pt,
        	sharp corners=uphill,
        	left=1em,
        	right=1em,
        	top=1em,
        	bottom=1em,
        	halign title=center,
        	fonttitle=\large\bfseries\robotoslab
        }
    ]
}{\end{tcbposter}}



% Title format
\makeatletter
\def\@maketitle{
    \begin{tikzpicture}[remember picture, overlay]
        % Rectangle dimensions
        \def\width{0.76\textwidth}
        \def\height{10cm}
        \def\radius{20pt}
        
        % Position of the top-right corner
        \coordinate (top-right) at ([xshift=-0.065\textwidth, yshift=-5cm]current page.north east);
        
        % Calculate the positions of the other corners
        \coordinate (top-left) at ([xshift=-\width]top-right);
        \coordinate (bottom-left) at ([yshift=-\height]top-left);
        \coordinate (bottom-right) at ([yshift=-\height]top-right);
        
        % Draw the custom rectangle with specific corners rounded
        \fill[color1] 
            (top-right) 
            -- ([xshift=-\width]top-right) 
            arc [start angle=90, end angle=180, radius=\radius] 
            -- ([xshift=-\width-\radius, yshift=-\height]top-right) 
            -- ([xshift=-\radius, yshift=-\height]top-right) 
            arc [start angle=270, end angle=360, radius=\radius]
            -- cycle; % Close the path to fill the rectangle
            
    \end{tikzpicture}

    %\vskip 2em
    
    \begin{minipage}{.2\textwidth}
        \includegraphics[width=\textwidth]{assets/cswlogo.png}
    \end{minipage}

    % Add a negative vspace to raise the minipage
    \vspace*{-6.5cm}

    \hfill
    \begin{minipage}[t][5cm][b]{.75\textwidth}
        \begin{flushleft}
            {\Huge\bfseries\robotoslab\color{white}{\@title}}
        \end{flushleft}
        \vskip 1em
        \vfill
        {\Large\textsf{\color{white}{\@author}}}
        \vskip 1.5em
        \raggedleft
        \textsc{PhD student poster session - Computer Science Workshop 2026}
    \end{minipage}
    \vskip 5em
}

\makeatother



% Decorations
\RequirePackage{atbegshi}
\AtBeginShipout{
    \AtBeginShipoutUpperLeft{
        \tikz[remember picture, overlay] {

			% Bottom of the page
			\node[rectangle,
				fill = color2,
				anchor = south west,
				minimum width = \paperwidth, 
				minimum height = 6cm
			] (botbar) at (current page.south west) {};

			% Logos
            \node[anchor=west, inner sep=0pt]
			      at ([xshift=3cm, yshift=3cm]current page.south west)
			      {\includegraphics[height=3cm]{assets/docs-white.png}};
			\node[anchor=east, inner sep=0pt]
                at ([xshift=-5cm, yshift=3cm]current page.south east)
                {\includegraphics[height=3cm]{assets/dibrislogo.png}};
		}
    }
}

\endinput

#let data = yaml("resume.yaml")

// Brand Colors
#let primary-color = rgb("#e63973") // Pink header bar
#let text-color = rgb("#1a1a1a")

#set page(
  paper: "a4",
  margin: (top: 0cm, bottom: 1.5cm, left: 1.8cm, right: 1.8cm)
)
#set text(
  font: "Liberation Sans",
  size: 9.5pt,
  fill: text-color
)
#set par(justify: true, leading: 0.55em)

// --- PINK HEADER BANNER ---
#block(
  fill: primary-color,
  width: 100% + 3.6cm,
  inset: (x: 1.8cm, y: 1.8cm),
  outset: (x: 1.8cm, top: 0cm),
)[
  #text(18pt, weight: "bold", fill: white)[#data.name] \
  #v(2pt)
  #text(11pt, weight: "medium", fill: white.lighten(20%))[#data.title] \
  #v(4pt)
  #text(8.5pt, fill: white)[
    #data.contact.location | #data.contact.phone | #data.contact.email \
    GitHub: #data.contact.github | CV: #data.contact.cv_url
  ]
]

#v(0.8em)

// --- SUMMARY ---
#text(data.summary)

#v(0.8em)

// --- TECHNICAL SKILLS ---
#text(12pt, weight: "bold", fill: primary-color)[Skills]
#v(-4pt)
#line(length: 100%, stroke: 0.5pt + primary-color)
#v(2pt)

- *Languages:* #data.skills.languages.join(", ")
- *Systems & Toolchain:* #data.skills.systems.join(", ")
- *AI & Data:* #data.skills.ai_data.join(", ")
- *Design & Architecture:* #data.skills.design.join(", ")

#v(0.8em)

// --- WORK HISTORY ---
#text(12pt, weight: "bold", fill: primary-color)[Work History]
#v(-4pt)
#line(length: 100%, stroke: 0.5pt + primary-color)
#v(2pt)

#for job in data.experience [
  #grid(
    columns: (1fr, auto),
    [*#job.role*], [#text(gray)[#job.period]]
  )
  #text(style: "italic")[#job.company]
  #v(2pt)
  #for item in job.highlights [
    - #item
  ]
]

#v(0.8em)

// --- PROJECTS / ACCOMPLISHMENTS ---
#text(12pt, weight: "bold", fill: primary-color)[Accomplishments & Projects]
#v(-4pt)
#line(length: 100%, stroke: 0.5pt + primary-color)
#v(2pt)

#for proj in data.projects [
  #grid(
    columns: (1fr, auto),
    [
      *#proj.name* — #proj.tech 
      #if "url" in proj [ (#proj.url) ]
      #if "status" in proj [ _(#proj.status)_ ]
    ],
    []
  )
  #v(1pt)
  #proj.description
  #v(4pt)
]

#v(0.8em)

// --- EDUCATION ---
#text(12pt, weight: "bold", fill: primary-color)[Education]
#v(-4pt)
#line(length: 100%, stroke: 0.5pt + primary-color)
#v(2pt)

#for edu in data.education [
  #grid(
    columns: (1fr, auto),
    [*#edu.degree*], [#text(gray)[#edu.period]]
  )
  #edu.institution, #edu.location
]

#v(0.8em)

// --- LANGUAGES ---
#text(12pt, weight: "bold", fill: primary-color)[Languages]
#v(-4pt)
#line(length: 100%, stroke: 0.5pt + primary-color)
#v(2pt)

#grid(
  columns: (1fr, 1fr, 1fr),
  ..data.languages.map(lang => [
    *#lang.name:* #lang.level
  ])
)


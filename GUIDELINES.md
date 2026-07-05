<div align="center">

<h1>CV → Resume Conversion Guide</h1>

<p><strong><em>How to translate an academic CV into an industry resume<br>that survives ATS and lands interviews at big tech.</em></strong></p>

</div>

______________________________________________________________________

## :x: The Core Problem

Academic CVs and industry resumes serve fundamentally different audiences.

| | Academic CV | Industry Resume |
|---|---|---|
| **Reader** | Faculty committee | ATS parser → recruiter → hiring manager |
| **Goal** | Demonstrate research depth | Demonstrate engineering impact |
| **Length** | As long as needed | 1 page |
| **Focus** | Venue, novelty, contribution | Problem → system → result |
| **Tone** | "We propose…" | "Built / Designed / Deployed…" |

______________________________________________________________________

## :warning: ATS Survival First

Big tech companies (Google, Meta, Amazon, Apple, Microsoft, Zoox, etc.) route every resume through an Applicant Tracking System **before** a human sees it. Many academic resumes fail here invisibly.

**Common ATS failure points in academic LaTeX CVs:**

- Custom fonts (`XeLaTeX`, `fontspec`) → garbled or empty output
- Multi-column layouts → columns merged or dropped
- Fancy glyphs and Unicode symbols → replaced with `?` or skipped
- Tables for contact info or publication lists → content silently lost
- Colored `hyperref` boxes → sometimes flagged as formatting errors

**Safe choices:** `pdflatex`, single-column layout, standard fonts, minimal special characters.
Use `jakes-format/` if you are unsure — it is specifically designed to pass these filters.

______________________________________________________________________

## :building_construction: Recommended Resume Structure

### (1) Header + 1-Line Summary

Lead with a tight positioning statement packed with domain keywords.

```
Robotics researcher specializing in real-time 3D perception, large-scale SLAM,
and production-grade mapping systems (MIT, KAIST).
```

Keywords to include: `SLAM`, `mapping`, `perception`, `autonomy`, `LiDAR`, `real-time`, `large-scale`, `sensor fusion`.

### (2) Experience — The Most Important Section

Each bullet must follow: **[What problem] + [What you built] + [Impact / scale]**

| | Example |
|---|---|
| ❌ Bad | "Worked on SLAM system" |
| ❌ Bad | "Published 10+ papers on LiDAR odometry" |
| ✅ Good | "Built a large-scale LiDAR-inertial SLAM system enabling real-time mapping in airport-scale environments" |
| ✅ Good | "Developed a degeneracy-aware odometry pipeline reducing localization failures in geometrically sparse environments (corridors, open spaces)" |

**Power words for robotics / AV roles:**
`real-time` · `large-scale` · `robust` · `deployed` · `production` · `system` · `pipeline` · `scalable` · `low-latency`

### (3) Projects — Show, Don't Just Tell

Open-source projects with GitHub stars are concrete proof of engineering ability and community adoption.
Lead with the GitHub badge, then one line describing the system and its real-world relevance.

```
KISS-Matcher [★ 643]  —  Point Cloud Registration  |  IEEE ICRA 2025
Real-time, robust 3D registration pipeline; backbone for multi-session LiDAR SLAM systems.
```

### (4) Publications — Signal, Not List

For industry, publications are a credibility signal, not the main event.

**Aggressive (big tech):**
```
10+ first-author papers at IEEE ICRA, RSS, IEEE RA-L, NeurIPS, ICCV, IJRR
```

**Conservative:** List 2–3 most impactful with a brief system description. Do not list all papers — recruiters do not read them.

______________________________________________________________________

## :pencil: Paper → Bullet Conversion Formula

Use the **XYZ formula** for every bullet:

> **Accomplished [X] as measured by [Y], by doing [Z].**

| ❌ Bad | ✅ Good (XYZ) |
|---|---|
| "Worked on the SLAM team" | "Reduced localization failure rate by 40% in corridor environments, by implementing degeneracy-aware weighting in the LiDAR-inertial odometry pipeline" |
| "We propose a novel degeneracy-aware LiDAR-inertial odometry method" | "Maintained stable localization in geometrically sparse environments (30% lower drift), by detecting and compensating for sensor degeneracy at runtime" |
| "Our method achieves state-of-the-art on benchmark X" | "Achieved SOTA accuracy on benchmark X with 10× speedup over prior ICP-based methods, by redesigning the correspondence search pipeline" |
| "Experiments demonstrate the effectiveness of our approach" | "Validated on 3+ robot platforms and adopted by 640+ teams (GitHub stars), by open-sourcing a production-ready C++ implementation" |

**Rules:**
- **Delete:** `novel`, `we propose`, `we present`, `we show`, `experiments demonstrate`
- **Replace with:** `reduced`, `improved`, `achieved`, `built`, `designed`, `deployed`, `developed`, `engineered`
- **Quantify everything.** If you cannot measure directly, estimate scope: `~90% reduction`, `3+ platforms`, `city-scale`, `1000+ hours of data`

**Reference:** [FAANG Resume Guide](https://www.sweresume.app/articles/faang-resume-guide/) — covers section ordering, XYZ formula, and ATS tips for big tech applications.

______________________________________________________________________

## :mag: Big Tech ATS Keywords — Robotics / AV Focus

**Must include (if applicable):**
```
real-time  ·  large-scale  ·  robust  ·  production  ·  deployed  ·  system  ·  pipeline
```

**Include if applicable:**
```
distributed  ·  scalable  ·  optimization  ·  low-latency  ·  sensor fusion  ·  autonomous  ·  perception
```

______________________________________________________________________

## :robot: For SLAM Researchers Specifically

SLAM research translates extremely well to AV industry — if framed correctly.

| Academic framing | Industry framing |
|---|---|
| "Point cloud registration" | "3D sensor data alignment pipeline for real-time map building" |
| "Ground segmentation" | "Real-time drivable surface detection for AV perception stack" |
| "Dynamic object removal" | "Static map maintenance system for long-term autonomous operation" |
| "Multi-session SLAM" | "Incremental, large-scale 3D mapping across multiple robot deployments" |
| "Degeneracy-aware odometry" | "Fault-tolerant localization robust to sensor-degenerate environments" |

Your open-source repos (ERASOR, Patchwork++, KISS-Matcher, etc.) already have hundreds of stars — lead with them. They signal that your code is production-quality and widely adopted, which is exactly what big tech hiring managers want to see.

______________________________________________________________________

## :x: Common Mistakes

1. **Listing papers instead of systems** — recruiters do not read citations
2. **"We propose / we present"** — academic tone; replace with first-person active verbs
3. **Math-heavy descriptions** — no one in the industry hiring loop cares about the SL(4) manifold (even if your paper is about it); describe what the *system does*
4. **No numbers** — if you cannot quantify, describe scale: `city-scale`, `airport-scale`, `1000+ hours of data`
5. **Contribution unclear** — every bullet must answer: *"so what does this mean for the robot or product?"*
6. **Multi-column LaTeX CV submitted directly** — run it through an ATS simulator first, or just use `jakes-format/`
7. **Listing TA roles in Experience** — Teaching Assistant duties (grading, office hours, course prep) are invisible to industry hiring managers. They do not signal engineering or research impact. If you want to show mentorship, frame it as a bullet under your main research role: *"Mentored 5+ graduate researchers, contributing to 4+ published papers."*

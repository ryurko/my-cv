# Author: Ron Yurko
# Purpose: This file initializes the datasets that will be used for my CV and
# constantly updated later on.

# ------------------------------------------------------------------------------

library(tidyverse)
library(here)

# ------------------------------------------------------------------------------
# EDUCATION
# Create the education csv file:

tibble(degree = c("BS", "MS", "PhD"),
       program = c("Statistics", "Statistics", "Statistics & Data Science"),
       start_year = c(2012, 2017, 2017),
       end_year = c(2015, 2018, NA),
       school = rep("Carnegie Mellon University", 3),
       city = rep("Pittsburgh, PA", 3),
       notes = c("University Honors, GPA: 3.97/4.00", NA,
                 "Advisors: Kathryn Roeder and Max G'Sell")) %>%
  arrange(desc(start_year), desc(degree)) %>%
  write_csv(here("data", "education.csv"))

# ------------------------------------------------------------------------------
# PUBLICATIONS AND PREPRINTS
# Create the publications csv file (create an identifier for each paper so it
# is easy to transfer the pre-prints to publications (being optimistic here...)):

# All of the publications:
tibble(paper_id = c("nflwar19", "goingdeep20", "nextgenscrapy20",
                    "defenseclustering20", "adapt20", "chancepunting19",
                    "hmagma20", "trap20"),
       title = c("nflWAR: a reproducible method for offensive player evaluation in football",
                 "Going Deep: models for continuous-time within-play valuation of game outcomes in american football with tracking data",
                 "Extracting NFL tracking data from images to evaluate quarterbacks and pass defenses",
                 "Unsupervised methods for identifying pass coverage among defensive backs with NFL player tracking data",
                 "A selective inference approach for false discovery rate control using multiomics covariates yields insights into disease risk",
                 "Reducing concussions in the NFL: a data-driven approach",
                 "H‐MAGMA, inheriting a shaky statistical foundation, yields excess false positives",
                 "TRAP: A predictive framework for the assessment of performance in trail running"),
       authors = c("R. Yurko, S. Ventura, M. Horowitz",
                   "R. Yurko, F. Matano, L. Richardson, N. Granered, T. Pospisil, K. Pelechrinis, S. Ventura",
                   "S. Mallepalle, R. Yurko, K. Pelechrinis, S. Ventura",
                   "R. Dutta, R. Yurko, S. Ventura",
                   "R. Yurko, M. G'Sell, K. Roeder, B. Devlin",
                   "K. Pelechrinis, R. Yurko, S. Ventura",
                   "R. Yurko, K. Roeder, B. Devlin, M. G'Sell",
                   "R. Fogliato, N. Oliveira, R. Yurko"),
       journal = c("Journal of Quantitative Analysis in Sports",
                   "Journal of Quantitative Analysis in Sports",
                   "Journal of Quantitative Analysis in Sports",
                   "Journal of Quantitative Analysis in Sports",
                   "Proceedings of the National Academy of Sciences",
                   "CHANCE",
                   "Annals of Human Genetics",
                   "Journal of Quantitative Analysis in Sports"),
       status = "Published",
       pub_year = c(2019, 2020, 2020, 2020, 2020, 2019, 2020, 2020),
       url = c("https://doi.org/10.1515/jqas-2018-0010",
               "https://doi.org/10.1515/jqas-2019-0056",
               "https://doi.org/10.1515/jqas-2019-0052",
               "https://doi.org/10.1515/jqas-2020-0017",
               "https://doi.org/10.1073/pnas.1918862117",
               "https://doi.org/10.1080/09332480.2019.1695442",
               "https://doi.org/10.1111/ahg.12412",
               "https://doi.org/10.1515/jqas-2020-0013"),
       website = c("De Gruyter", "De Gruyter", "De Gruyter", "De Gruyter",
                   "PNAS", "Taylor & Francis", "Wiley", "De Gruyter")) %>%
  write_csv(here("data", "publications.csv"))

# Now the pre-prints: CURRENTLY DO NOT HAVE ANY PREPRINTS
# tibble(paper_id = c("goingdeep19", "nextgenscrapy19", "defenseclustering19", "adapt19"),
#        title = c("Going Deep: models for continuous-time within-play valuation of game outcomes in american football with tracking data",
#                  "A naive bayes approach for NFL passing evaluation using tracking data extracted from images",
#                  "Unsupervised methods for identifying pass coverage among defensive backs with NFL player tracking data",
#                  "Application of selective inference to multi-omics data yields insights into the etiologies of human diseases"),
#        authors = c("R. Yurko, F. Matano, L. Richardson, N. Granered, T. Pospisil, K. Pelechrinis, S. Ventura",
#                    "S. Mallepalle, R. Yurko, K. Pelechrinis, S. Ventura",
#                    "R. Dutta, R. Yurko, S. Ventura",
#                    "R. Yurko, M. G'Sell, K. Roeder, B. Devlin"),
#        journal = c("Journal of Quantitative Analysis in Sports",
#                    "Journal of Quantitative Analysis in Sports",
#                    "Journal of Quantitative Analysis in Sports",
#                    NA),
#        status = c(rep("Under review", 4)),
#        pub_year = rep(NA, 4),
#        url = c("https://arxiv.org/abs/1906.01760", "https://arxiv.org/abs/1906.03339",
#                "https://arxiv.org/abs/1906.11373", "https://www.biorxiv.org/content/10.1101/806471v1"),
#        website = c("ArXiv", "ArXiv", "ArXiv", "bioRxiv")) %>%
#   write_csv(here("data", "preprints.csv"))

# ------------------------------------------------------------------------------
# Miscellaneous articles

# Create the inital version of the various other articles
tibble(paper_id = c("adareport19", "bdb21"),
       title = c("Detecting data analysis patterns in text and graphs to characterize student workflows",
                 "Evaluating defender ability to limit YAC"),
       authors = c("R. Yurko", "R. Yurko and K. Pelechrinis"),
       journal = c("Advanced Data Analysis report",
                   "NFL Big Data Bowl 2021 (Honorable Mention)"),
       status = c("Published", "Published"),
       pub_year = c(2019, 2021),
       more_info = c("Advisor: Rebecca Nugent",
                     "Kaggle: https://www.kaggle.com/ryurko21/evaluating-defender-ability-to-limit-yac")) %>%
  write_csv(here("data", "misc_articles.csv"))

# ------------------------------------------------------------------------------
# PRSESENTATIONS
# Single file to store all presentation types

# First create the presentations file, start with invited ids:
tibble(paper_id = c("issi20", "ucsas20", "jsm20_1",
                    "nessis19_1", "nessis17", "pittsports17",
                    "cmsac17", "ritsac18", "user18", "uscots19",
                    # contributed:
                    "jsm20_2", "upstat17", "glasc17", "cs17", "sdss18", "cs18", "cassis18",
                    # posters
                    "mom15", "duc15", "pittasa18", "ashg19",
                    "nessis19_2", "cmsac19",
                    # electronic posters
                    "ashg20", "sdss20",
                    "ecots18_1", "ecots18_2"),
       # Invited talk titles
       title = c("Adaptive approaches for augmenting genetic association studies with multi-omics covariates",
                 "Going Deep: models for continuous-time within-play valuation of game outcomes in american football with tracking data",
                 "Going Deep: models for continuous-time within-play valuation of game outcomes in american football with tracking data",
                 "Going Deep: models for continuous-time within-play valuation of game outcomes in american football with tracking data",
                 "nflWAR: a reproducible method for offensive player evaluation in football",
                 "nflWAR: a reproducible method for offensive player evaluation in football",
                 "nflWAR: a reproducible method for offensive player evaluation in football",
                 "nflWAR: a reproducible method for offensive player evaluation in football",
                 "Exploring NFL data with nflscrapR",
                 "Many Students, One Dataset: Using ISLE to Teach Reproducibility and the Impact of Data Analysis Decisions on Conclusions",
                 # contributed
                 "A selective inference approach for FDR control using multi-omics covariates yields insights into disease risk",
                 "nflscrapR: an R package for easy access to NFL data and a new model for expected points and win probability",
                 "NFL player evaluation using expected points added with nflscrapR",
                 "Variable selection for consistent clustering",
                 "Variable selection for consistent clustering",
                 "A case study in reproducibility: detecting data analysis patterns in text and graphs to characterize student workflows",
                 "Multilevel models to measure player, team, and stadium effects on NFL injury risk",
                 # conference posters
                 "Classifying Kepler objects of interest",
                 "Improving predictions of ensemble methods using distributions of estimated probabilities",
                 "Variable selection for consistent clustering",
                 "Application of post-selection inference to multi-omics data yields insights into the etiologies of human diseases",
                 "TRAP: a predictive framework for the assessment of performance in trail running",
                 "TRAP: a predictive framework for the assessment of performance in trail running",
                 # electronic posters
                 "Augmenting gene-level tests based on two-sided summary statistics with multiomics covariates",
                 "A selective inference approach for FDR control using multi-omics covariates yields insights into disease risk",
                 "Identifying misconceptions of introductory data science using a think-aloud protocol",
                 "Using text analysis to characterize student learning in an introductory statistics & data science course"),
       author_notes = c("Presented by Kathryn Roeder", "Keynote Speaker", "Presented by Lee Richardson",
                        NA, NA, NA,
                        NA, NA, NA, "Joint work with R. Nugent, P. Burckhardt, F. Kovacs",
                        # Contributed
                        NA, NA, NA, NA, NA, NA, "Joint work with Zachary Binney",
                        # posters
                        "Joint work with Eric Alpert", NA, NA, NA,
                        "Presented by Natalia L. Oliveira",
                        "Presented by R. Fogliato",
                        # eposters
                        NA, NA, "Joint work with S. Hyun, P. Burckhardt, P. Elliott, C. Evans, K. Lin, A. Luby, C. P. Makris, J. Orellana, A. Reinhart, J. Wieczorek, G. Weinberg, R. Nugent",
                        NA),
       conference = c("International Seminar on Selective Inference",
                      "UConn Sports Analytics Symposium",
                      "Joint Statistical Meetings",
                      rep("New England Symposium on Statistics in Sports", 2),
                      "Computational Sports Informatics Colloquium",
                      "Carnegie Mellon Sports Analytics Conference",
                      "RIT Sports Analytics Conference",
                      "Pittsburgh useR Group", "USCOTS",
                      # Contributed talks
                      "Joint Statistical Meetings",
                      "UP-STAT",
                      "Great Lakes Analytics in Sports Conference",
                      "Classification Society Annual Meeting",
                      "Symposium on Data Science & Statistics",
                      "Classification Society Annual Meeting",
                      "Cascadia Symposium on Statistics in Sports",
                      # Posters
                      "Meeting of the Minds",
                      "Dietrich Undergraduate Colloquium",
                      "Pittsburgh ASA Chapter Spring Banquet",
                      "Annual Meeting of the American Society of Human Genetics",
                      "New England Symposium on Statistics in Sports",
                      "Carnegie Mellon Sports Analytics Conference",
                      # e-Posters
                      "Annual Meeting of the American Society of Human Genetics",
                      "Symposium on Data Science & Statistics",
                      "eCOTS", "eCOTS"),
       presentation_type = c(rep("invited_talk", 10),
                             rep("contributed", 7),
                             rep("poster", 6),
                             rep("eposter", 4)),
       year = c(2020, 2020, 2020, 2019, 2017, 2017,
                2017, 2018, 2018, 2019,
                # contributed:
                2020, 2017, 2017, 2017, 2018, 2018, 2018,
                # posters
                2015, 2015, 2018, 2019, 2019, 2019,
                # electronic posters
                2020, 2020, 2018, 2018),
       more_info = c(rep(NA, 10),
                     # Contributed
                     NA,
                     "Second Place, Best Young Researchers’ Award in Category C: Application",
                     rep(NA, 5),
                     # Posters
                     "First Place, Statistics Poster Competition",
                     rep(NA, 3),
                     "Best Student Poster Prize",
                     "Best Poster Award",
                     # eposters
                     rep(NA, 4))) %>%
  write_csv(here("data", "presentations.csv"))

# ------------------------------------------------------------------------------
# SOFTWARE - for now only R packages but will store the type so later on the julia
# versions can be easily included as well (could automate this part with a function
# to grab package information but for now just make the dataframe like a publication)

tibble(software_id = c("r_nflscrapr_17", "r_nflwar_18", "r_fcscrapr_18",
                       "r_adaptMT_19", "r_snpcombiner_20"),
       title = c("nflscrapR: Compiling the NFL Play-by-Play API for easy use in R",
                 "nflWAR: An R package to compute WAR for offensive players using nflscrapR",
                 "fcscrapR: R package to scrape soccer commentary and statistics from ESPN",
                 "adaptMT: Modifications including wrapper functions for XGBoost implementation with EM algorithm cross-validation tuning",
                 "snpcombineR: R package to combine SNP-level test statistics at various region levels"),
       authors = c("M. Horowitz, R. Yurko, S. Ventura", rep("R. Yurko", 4)),
       pub_year = c(2017, rep(2018, 2), 2019, 2020),
       url = c("https://github.com/maksimhorowitz/nflscrapR",
               "https://github.com/ryurko/nflWAR",
               "https://github.com/ryurko/fcscrapR",
               "https://github.com/ryurko/adaptMT",
               "https://github.com/ryurko/snpcombineR"),
       website = c(rep("GitHub", 5))) %>%
  write_csv(here("data", "software.csv"))


# ------------------------------------------------------------------------------
# TEACHING EXPERIENCE - four different types: course_instructor, course_ta, workshop_instructor, course_grader
# (will also record the location - later on will need to divide instructor courses based
# on this location presumably)

# Each class/workshop will have an unique id that is the same across semesters,
# that way the CV.Rmd file will group_by using this id to create an appropriate
# label for when the course was taught:
tibble(teaching_id = c("cmu_stats_315", "cmu_stats_462", "cmu_stats_350",
                       "cmu_stats_225", "cmu_stats_226",
                       rep("cmu_stats_201", 3),
                       rep("cmu_stuco_sabermetrics", 2),
                       "cmu_baseball_workshop_18", "cmu_football_workshop",
                       "cmu_football_workshop",
                       "cmusac_camp", "wharton_moneyball",
                       "cmsac_instructor"),
       title = c("Statistical Graphics and Visualization",
                 "Data Mining",
                 "Statistical Computing",
                 "Introduction to Probability Theory",
                 "Introduction to Statistical Inference",
                 rep("Statistical Reasoning and Practice", 3),
                 rep("Introduction to Sabermetrics and Exploring Baseball Data with R", 2),
                 "Carnegie Mellon Baseball Analytics Workshop",
                 "Carnegie Mellon Football Analytics Workshop",
                 "Carnegie Mellon Football Analytics Workshop",
                 "Summer Undergraduate Research Experience in Statistics",
                 "Wharton Moneyball Academy and Training Camp",
                 "Summer Undergraduate Research Experience in Statistics"),
       year = c(2018, 2018, 2017, 2015, 2015, 2013, 2014, 2014,
                2015, 2015, 2018, 2018, 2019, 2019, 2019, 2020),
       location = c(rep("Carnegie Mellon University", 14),
                    "Wharton School of the University of Pennsylvania",
                    "Carnegie Mellon University"),
       semester = c("Summer", "Spring", "Fall", "Fall", "Spring", "Fall",
                    "Spring", "Fall", "Spring", "Fall", "Spring", "Fall",
                    "Fall", "Summer", "Summer", "Summer"),
       notes = c(rep(NA, 8), rep("Created course materials in student-taught course program", 2),
                 "Created workshop materials and co-instructor of live coding demo",
                 "Created workshop materials and instructor of live coding demo",
                 "Created workshop materials and instructor of live coding demo",
                 "Created datasets and program materials, advised student projects",
                 "Assisted in development of course materials and course instructor for week-long introductory statistics course for high-school students",
                 "Assistant director and lead instructor of program, created course curriculum / materials, and advised student projects (http://www.stat.cmu.edu/cmsac/)"),
       role = c(rep("course_ta", 3), rep("course_grader", 2), rep("course_ta", 3),
                rep("course_instructor", 2),
                rep("workshop_instructor", 3), "course_ta",
                "workshop_instructor", "course_instructor")) %>%
  write_csv(here("data", "teaching.csv"))

# ------------------------------------------------------------------------------
# RESEARCH EXPERIENCE

tibble(type = c("ra", "ra", "other", "other"),
       role_title = c("Research Assistant", "Undergraduate Research Assistant",
                 "Undergraduate Research Course", "Independent Research"),
       start_year = c(2018, 2015, 2015, 2014),
       end_year = c(NA, 2015, 2015, 2014),
       advisors = c("K. Roeder, M. G'Sell, B. Devlin",
                    "S. Ventura, R. Nugent",
                    "R. Nugent, P. Freeman",
                    "Andrew C. Thomas"),
       project_title = c("Applications of selective inference in statistical genetics",
                 "PREDS: Prediction with Ensembles using Distribution Summaries",
                 "Classifying Kepler Objects of Interest",
                 "The Science of Fooling Batters: An Objective Analysis of Pitch Sequencing")) %>%
  arrange(desc(start_year)) %>%
  write_csv(here("data", "research_experience.csv"))

# ------------------------------------------------------------------------------
# INDUSTRY EXPERIENCE

tibble(type = c("full", "intern", "intern", "intern"),
       department = c("Analytics & Portfolio Management",
                      "Analytics & Portfolio Management",
                      "Baseball Operations",
                      "Equity Analysis"),
       role = c("Quantitative Analytics Associate",
                "Risk Management Intern",
                "Data and Analytics Intern",
                "Intern"),
       company = c("PNC Financial Services",
                   "PNC Financial Services",
                   "Pittsburgh Pirates",
                   "Schenley Park Capital Management"),
       start_year = c(2016, 2015, 2014, 2013),
       end_year = c(2017, 2015, 2014, 2013),
       location = rep("Pittsburgh, PA", 4)) %>%
  arrange(desc(type), desc(start_year)) %>%
  write_csv(here("data", "industry.csv"))

# ------------------------------------------------------------------------------
# FELLOWSHIPS AND FUNDING - to store fellowships and grants

tibble(type = c("fellowship"),
       title = c("Carnegie Mellon Presidential Fellowship"),
       start_year = c(2018),
       end_year = c(2019)) %>%
  write_csv(here("data", "fellowship_funding.csv"))

# ------------------------------------------------------------------------------
# HONORS AND AWARDS

tibble(type = c("honor", "honor", "honor", "award", "award",
                "award", "award", "award"),
       title = c("Andrew Carnegie Society Scholar",
                 "Phi Kappa Phi Honor Society",
                 "Honors courses",
                 "Second Place, Best Young Researchers' Award in Category C: Application",
                 "First Place, Statistics Poster Competition",
                 "Best Student Poster Prize",
                 "Honorable Mention",
                 "Best Poster Award"),
       year = c(2015, 2015, 2014, 2017, 2015, 2019, 2021, 2019),
       extra_info = c(NA, NA, "Mathematical Statistics Honors, Undergraduate Research Course",
                      NA, NA, NA, NA, NA),
       from = c("Carnegie Mellon University",
                NA, "Department of Statistics & Data Science, Carnegie Mellon University",
                "UP-STAT", "Meeting of the Minds", "New England Symposium on Statistics in Sports",
                "NFL Big Data Bowl 2021", "Carnegie Mellon Sports Analytics Conference")) %>%
  write_csv(here("data", "honors_awards.csv"))

# ------------------------------------------------------------------------------
# PROFESSIONAL SERVICE - either organize, journal_review, dept_service, univ_service for now

tibble(type = c("organize", "organize", "organize", "organize",
                "journal_review", "journal_review",
                "journal_review", "journal_review", "journal_review",
                "dept_service", "dept_service", "dept_service",
                "dept_service", "dept_service", "dept_service",
                "univ_service", "univ_service"),
       service_for = c("Carnegie Mellon Sports Analytics Conference",
                       "CMSAC Reproducible Research Competition",
                       "Carnegie Mellon Baseball Analytics Workshop",
                       "Carnegie Mellon Football Analytics Workshop",
                       # Journals
                       "Big Data", "Journal of Quantitative Analysis in Sports",
                       "GENETICS", "PLOS Computational Biology", "Journal of Sports Analytics",
                       # Dept service
                       "Student Advisory Committee",
                       "Women in Statistics Matched Pairs Mentorship Program",
                       "Statistics in Sports Reading and Research Group",
                       "Statistical Graphics Poster Presentations",
                       "Meeting of the Minds",
                       "StatGen Reading Group",
                       # University service
                       "Carnegie Mellon Sports Analytics Club",
                       "Carnegie Mellon Sports Analytics Club"),
       service_title = c("Co-Organizer", "Co-Organizer","Organizer", "Organizer",
                         # Journals
                         rep(NA, 5),
                         # Dept
                         "Cohort representative", "Mentor",
                         "Organizer", rep("Judge", 2),
                         "Organizer",
                         # Univ
                         "Graduate Student Advisor",
                         "Co-Founder, Vice President, Editor, and Writer"),
       start_year = c(2017, 2018, 2018, 2018,
                      # Journals
                      rep(NA, 5),
                      # Dept
                      2017, 2018, 2017,
                      2018, 2019, 2019,
                      # Univ
                      2017, 2013),
       end_year = c(NA, NA, 2018, 2019,
                    # Journals
                    rep(NA, 5),
                    # Dept
                    NA, 2019, NA,
                    NA, 2019, NA,
                    # Univ
                    NA, 2016),
       service_info = c("200+ attendees from academia, industry, and professional sports. Responsibilities included maintaining and assessing current research in field, website/event/speaker/press management, marketing materials, budgeting",
                        "Conference competition to promote reproducible research. Responsibilities included creating competition format, promoting, and organizing evaluation of submissions with reviewer feedback",
                        "50+ attendees from academia, industry, and professional sports. Responsibilities included creating workshop material, website/event/press management, and coordinating Q&A session with professional baseball team",
                        "80+ attendees from academia, industry, and professional sports. Responsibilities included creating workshop material, website/event/press management, coordinating Q&A session with NFL Director of Data and Analytics",
                        rep(NA, 13))) %>%
  write_csv(here("data", "professional_service.csv"))

# ------------------------------------------------------------------------------
# WORKSHOPS ATTENDED - various workshops I've participated in

tibble(workshop_name = c("Introduction to Bayesian Inference with Stan"),
       location = c("University of Pittsburgh, Pittsburgh PA"),
       year = c(2019)) %>%
  write_csv(here("data", "workshops_attended.csv"))

# ------------------------------------------------------------------------------
# PROFESSIONAL SOCIETIES

tibble(society = c("American Society of Human Genetics",
                   "American Statistical Association",
                   "Classification Society",
                   "Society of American Baseball Research")) %>%
  write_csv(here("data", "professional_societies.csv"))

# ------------------------------------------------------------------------------
# COMPUTING SKILLS

tibble(languages = c("R", "SAS", "C++", "Julia", "Python", "SQL", "HTML", "Clojure", "Java"),
       level = c("Expert", "Proficient", rep("Intermediate", 4), rep("Beginner", 3))) %>%
  write_csv(here("data", "computing_skills.csv"))

# ------------------------------------------------------------------------------
# ACTIVITIES - for now three different groups: team_sports, volunteer, runs

tibble(type = c("team_sports", "team_sports", "team_sports", "volunteering", "runs",
                "runs", "runs"),
       start_year = c(2013, 2017, 2013, 2019, 2016, 2017, 2017),
       end_year = c(NA, NA, 2013, 2019, NA, NA, NA),
       activity = c("Carnegie Mellon Intramural Sports",
                    "Graduate Student Assembly Summer Sports",
                    "Carnegie Mellon University Club Baseball Team",
                    "Campaign Against Cancer",
                    "Pittsburgh Penguins 6.6K Run & Family Walk",
                    "Pirates Home Run 5K 10K",
                    "The Great Race"),
       activity_info = c("Captain: flag-football (2018 co-rec champions)",
                         "Co-captain: softball",
                         NA, NA,
                         "https://www.mariolemieux.org/our-events/6-6k-run-and-family-walk/",
                         "https://www.mlb.com/pirates/community/race",
                         "http://www.rungreatrace.com/")) %>%
  write_csv(here("data", "activities.csv"))






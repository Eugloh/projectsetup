# examples here
# R/02_class-projects_author.R:#' @examples
# line 52 
#' @examples
#' #############################################################################
#' # SETUP
#' old_home <- Sys.getenv("HOME")
#' old_ppath <- Sys.getenv("PROJECTSETUP_FOLDER_PATH")
#' temp_dir <- tempfile("dir")
#' dir.create(temp_dir)
#' Sys.unsetenv("PROJECTSETUP_FOLDER_PATH")
#' Sys.setenv(HOME = temp_dir)
#' setup_projects(path = temp_dir)
#' new_author("chuck", "jonesman", id = 33)
#' new_author("Hattie", "Hatsman", id = 45)
#' #############################################################################
#'
#' jones <- projects_author("33: Jones")
#'
#' jones
#'
#' as.integer(jones) # 33
#'
#' jones == 33       # TRUE
#' jones == 10       # FALSE
#' jones != 33       # FALSE
#'
#' jones %in% c(20:40)     # TRUE
#' match(jones, c(31:40))  # 3
#'
#' # Comparing a projects_author object to a character vector results in the
#' # character strings being validated against the authors() table. Then, the id
#' # numbers are compared.
#' jones == c("jOnES", "hat")   # TRUE FALSE
#'
#' #############################################################################
#' # Cleanup (or just restart R)
#' Sys.setenv(HOME = old_home, PROJECTSETUP_FOLDER_PATH = old_ppath)


# R/03_class-projects_stage.R:#' @examples
# line 54
#' @examples
#' stage <- projects_stage("4: manuscript")
#'
#' as.integer(stage) # 4
#'
#' stage == 4       # TRUE
#' stage != 4       # FALSE
#' stage <  6       # TRUE
#'
#' stage %in% c(3:6)  # TRUE
#' match(stage, 0:4)  # 5
#'
#' stage %in% c("design", "manusc", "idea")  # TRUE
#'
#' more_stages <- projects_stage(c("0: idea", "4: manuscript", "1: design"))
#'
#' match("MAnuscRIPT", more_stages)      # 2


# R/04_new.R:#' @examples
# line 179
#' @examples
#' #############################################################################
#' # SETUP
#' old_home <- Sys.getenv("HOME")
#' old_ppath <- Sys.getenv("PROJECTSETUP_FOLDER_PATH")
#' temp_dir <- tempfile("dir")
#' dir.create(temp_dir)
#' Sys.unsetenv("PROJECTSETUP_FOLDER_PATH")
#' Sys.setenv(HOME = temp_dir)
#' setup_projects(path = temp_dir)
#' #############################################################################
#'
#' # Creating affiliations
#' new_affiliation(department_name = "Math Dept.",
#'                 institution_name = "Springfield College",
#'                 address = "123 College St, Springfield, AB")
#' new_affiliation(department_name = "Art Department",
#'                 institution_name = "Springfield College",
#'                 address = "321 University Boulevard, Springfield, AB",
#'                 id = 42)
#'
#' # Editing an affiliation
#' edit_affiliation("Math Dept", department_name = "Mathematics Department")
#'
#' # Creating authors
#' new_author(
#'   given_names = "Rosetta",
#'   last_name = "Stone",
#'   affiliations = c(42, "Math"),
#'   degree = "PhD",
#'   email = "slab@rock.net",
#'   phone = "867-555-5309",
#'   id = 8888
#' )
#' new_author(
#'   given_names = "Spiro",
#'   last_name = "Agnew",
#'   degree = "LLB",
#'   affiliations = "Art D", id = 13
#' )
#' new_author(last_name = "Plato", id = 303)
#'
#' # Editing an author, showcasing the removal of a text element (last_name)
#' edit_author(author = 303, given_names = "Plato", last_name = NA)
#'
#' # Editing an author, showcasing the addition and removal of affiliations
#' edit_author("Spiro", affiliations = ~ -"Art D" + Math)
#'
#' # Creating a project
#' new_project(
#'   title = "Understanding the Construction of the United States",
#'   short_title = "USA",
#'   authors = c(13, "Stone"),
#'   stage = 4,
#'   deadline = "2055-02-28",
#'   deadline_type = "submission",
#'   parent_directory = "famous_studies/philosophers/rocks",
#'   corresp_auth = "Stone",
#'   current_owner = "agnew",
#'   make_directories = TRUE,
#'   status = "waiting on IRB"
#' )
#'
#' # Editing a project, showcasing the addition and removal of authors
#' edit_project(
#'   "Understanding",
#'   short_title = "usa1",
#'   authors = ~ + "303" - 13 - Stone
#' )
#'
#'
#' # Creating a new idea
#' new_idea(title = "Boiling the Ocean")
#'
#' # Creating some tasks
#' new_task(project = 2,
#'          task = "put the horse before the cart",
#'          lead = "spiro",
#'          timing = NaN)
#'
#' new_task(project = 1,
#'          task = "learn something",
#'          effort = pi,
#'          lead = "Stone",
#'          status = "foobar",
#'          timing = Inf)
#'
#' new_task(project = 1,
#'          task = "take a break",
#'          TID = 600.66,
#'          effort = -100,
#'          status = "throw it all away",
#'          lead = "303")
#'
#' new_task(project = 1,
#'          task = "tie your shoes",
#'          TID = 2,
#'          lead = 303)
#'
#' new_task(project = 1,
#'          task = "put out the fire",
#'          TID = .5,
#'          lead = "stone")
#'
#' # Editing a task
#' edit_task(project = "understanding",
#'           TID = 3,
#'           new_TID = 2,
#'           lead = "agnew",
#'           done = 1,
#'           status = "make dinner")
#'
#' # finish is a shortcut for setting done = 1 on the specified task.
#' finish("construction", 4)
#'
#' # Wrapped in if (interactive()) because it requires interactive console input
#' # and fails automated package checking and testing.
#' if (interactive()) {
#'   delete_project("usa1")
#'   delete_author(303)
#'   delete_task(2, 1)
#'   delete_affiliation("Math")
#' }
#'
#' #############################################################################
#' # CLEANUP
#' Sys.setenv(HOME = old_home, PROJECTSETUP_FOLDER_PATH = old_ppath)


# R/05_edit.R:#' @examples
# line 889
#' @examples
#' #############################################################################
#' # SETUP
#' old_home <- Sys.getenv("HOME")
#' old_ppath <- Sys.getenv("PROJECTSETUP_FOLDER_PATH")
#' temp_dir <- tempfile("dir")
#' dir.create(temp_dir)
#' Sys.unsetenv("PROJECTSETUP_FOLDER_PATH")
#' Sys.setenv(HOME = temp_dir)
#' setup_projects(path = temp_dir)
#' new_affiliation(department_name = "Math Dept.",
#'                 institution_name = "Springfield College",
#'                 address = "123 College St, Springfield, AB")
#' new_affiliation(department_name = "Art Department",
#'                 institution_name = "Springfield College",
#'                 address = "321 University Boulevard, Springfield, AB",
#'                 id = 42)
#' new_affiliation(department_name = "Central Intelligence Agency",
#'                 institution_name = "United States Government",
#'                 address = "888 Classified Dr, Washington DC")
#' new_affiliation(department_name = "Pyrotechnics",
#'                 institution_name = "ACME")
#' new_author(given_names = "Rosetta", last_name = "Stone",
#'            affiliations = c(42, "Math"), degree = "PhD",
#'            email = "slab@rock.net", phone = "867-555-5309", id = 8888)
#' new_author(given_names = "Spiro", last_name = "Agnew", degree = "LLB",
#'            affiliations = "Art D", id = 13)
#' new_author(given_names = "Plato", id = 303)
#' new_author(given_names = "Condoleezza", last_name = "Rice", degree = "PhD",
#'            affiliations = c(1, 42, "Agency", "ACME"), phone = "555-555-5555",
#'            email = "condoleeza@ri.ce")
#' new_author(given_names = "Jane", last_name = "Goodall", degree = "PhD",
#'            affiliations = 3, id = 5)
#' new_project(title = "Understanding the Construction of the United States",
#'             short_title = "USA",
#'             authors = c(13, "Stone", "zz", "303", "Jane Goodall"),
#'             stage = 4, deadline = "2055-02-28", deadline_type = "submission",
#'             parent_directory = "famous_studied/philosophers/rocks",
#'             corresp_auth = "Stone", current_owner = "agnew",
#'             make_directories = TRUE,
#'             status = "waiting on IRB")
#' #############################################################################
#'
#' # Rice's affiliations before reordering:
#' authors("rice", affiliations = TRUE)
#'
#' # Reordering (with unnamed arguments)
#' reorder_affiliations(author = "RICE", "ACME", 42, after = 1)
#'
#' # Rice's affiliations after reordering:
#' authors("rice", affiliations = TRUE)
#'
#' # Project 1 header before reordering authors:
#' header(1)
#'
#' # Reordering (with named arguments)
#' reorder_authors(project = 1, "Rosetta" = 99, `303` = 2, "5" = 1)
#'
#' # Project 1 header after reordering authors:
#' header(1)
#'
#' #############################################################################
#' # CLEANUP
#' Sys.setenv(HOME = old_home, PROJECTSETUP_FOLDER_PATH = old_ppath)

# R/06_email_authors.R:#' @examples
# line 25
#' @examples
#' # Wrapped in if (interactive()) because this function is interactive by nature.
#' if (interactive()) {
#'
#'   # If you have a projects() project open, just run it:
#'   email_authors()
#'
#'   # Otherwise, specify a project:
#'
#'   ###########################################################################
#'   # Setup
#'   old_home <- Sys.getenv("HOME")
#'   old_ppath <- Sys.getenv("PROJECTSETUP_FOLDER_PATH")
#'   temp_dir <- tempfile("dir")
#'   dir.create(temp_dir)
#'   Sys.unsetenv("PROJECTSETUP_FOLDER_PATH")
#'   Sys.setenv(HOME = temp_dir)
#'   setup_projects(path = temp_dir)
#'   new_author("Rhonda", "Rondale", email = "ronda.rondale@co.uk")
#'   new_author("Betty", "Betts", email = "betty@co.uk")
#'   new_project("Inventing the Ring of Power", authors = c("Betty", "Ron"))
#'   ###########################################################################
#'
#'   email_authors("Ring of Power")
#'
#'   ###########################################################################
#'   # Cleanup (or just restart R)
#'   Sys.setenv(HOME = old_home, PROJECTSETUP_FOLDER_PATH = old_ppath)
#' }



# R/07_file_management.R:#' @examples
# line 74
#' @examples
#' #############################################################################
# SETUP
#' old_home <- Sys.getenv("HOME")
#' old_ppath <- Sys.getenv("PROJECTSETUP_FOLDER_PATH")
#' temp_dir <- tempfile("dir")
#' dir.create(temp_dir)
#' Sys.unsetenv("PROJECTSETUP_FOLDER_PATH")
#' Sys.setenv(HOME = temp_dir)
#' setup_projects(path = temp_dir)
#' #############################################################################
#' 
#' # setting up a simple project directory tree
#' new_project_group("kidney/clinical")
#' new_project_group("kidney/genomics")
#' new_project_group("prostate/clinical")
#' new_project_group("prostate/genomics")
#' #'
#' #' # Wrapped in if (interactive()) because it requires interactive console input
#' #' # and fails automated package checking and testing.
#' if (interactive()){
#'   new_project(title = "Sample Authorless Project", parent_directory = "kidney")
#' 
#'   # Moving the project folder, then moving it again.
#'   move_project(project = 1, "kidney/genomics")
#'   move_project(project = "Sample Authorless Project", "prostate/clinical")
#' 
#'   # Copying the project
#'   copy_project(project_to_copy = 1, "kidney/clinical")
#' 
#'   # Renaming the folder of the copy of the project
#'   rename_folder(project = 2, "copy")
#' 
#'   # Archiving the copy of the project
#'   archive_project(2)
#' 
#'   # Moving and renaming the entire projects folder
#'   temp_dir2 <- tempfile("dir")
#'   dir.create(temp_dir2)
#'   move_projects_folder(temp_dir2)
#'   projects_folder()
#'   rename_projects_folder("foobar")
#'   projects_folder()
#' 
#'   # Opens the project in same session
#'   open_project("Sample")
#' 
#'   # Opens the project in a new session
#'   open_project(1, new_session = TRUE)
#' }
#' #############################################################################
#' # CLEANUP
#' Sys.setenv(HOME = old_home, PROJECTSETUP_FOLDER_PATH = old_ppath)


# R/08_getters.R:#' @examples
# line 20
#' @examples
#' projects_folder()


# R/08_getters.R:#' @examples
# line 218(+les 2 lignes du 20 enlevées)
#' @examples
#' #############################################################################
#' # SETUP
#' old_home <- Sys.getenv("HOME")
#' old_ppath <- Sys.getenv("PROJECTSETUP_FOLDER_PATH")
#' temp_dir <- tempfile("dir")
#' dir.create(temp_dir)
#' Sys.unsetenv("PROJECTSETUP_FOLDER_PATH")
#' Sys.setenv(HOME = temp_dir)
#' setup_projects(path = temp_dir)
#' new_affiliation(department_name = "Math Dept.",
#'                 institution_name = "Springfield College",
#'                 address = "123 College St, Springfield, AB")
#' new_affiliation(department_name = "Art Department",
#'                 institution_name = "Springfield College",
#'                 address = "321 University Boulevard, Springfield, AB",
#'                 id = 42)
#' new_affiliation(department_name = "Central Intelligence Agency",
#'                 institution_name = "United States Government",
#'                 address = "888 Classified Dr, Washington DC")
#' new_affiliation(department_name = "Pyrotechnics",
#'                 institution_name = "ACME")
#' new_author(given_names = "Spiro", last_name = "Agnew", degree = "LLB",
#'            affiliations = "Art D", id = 13)
#' new_author(given_names = "Plato", id = 303)
#' new_author(given_names = "Condoleezza", last_name = "Rice",
#'            affiliations = c(1, 42, "Agency", "ACME"))
#' new_project(title = "Test project 1", current_owner = "Plato", stage = 1)
#' new_project(title = "Test project 2", current_owner = "eezza", stage = 2)
#' new_project(title = "Test project 3", current_owner = "Plato", stage = 3)
#' new_project(title = "Fun project 4",  current_owner = "Rice", stage = 4)
#' new_project(title = "Fun project 5",  current_owner = "Rice", stage = 5)
#' new_project(title = "Fun project 6",  current_owner = "Rice", stage = 6)
#' new_project(title = "Good idea",  current_owner = "Rice", stage = 0)
#' new_task(2, "take a break", lead = "eezza", done = 1)
#' new_task(2, "go home", TID = 1, lead = 303, timing = 1337)
#' new_task(1, "tie up loose ends", status = "untying a knot", effort = Inf)
#' new_task(3, "cook dinner", lead = "plato")
#' #############################################################################
#'
#' # View entire affiliations table
#' affiliations()
#'
#' # View authors table joined to affiliations table
#' # Notice that multiple rows are created for each affiliation-author combination
#' authors(affiliations = TRUE)
#'
#' # View only active projects with "Fun" in their title.
#' projects("Fun")
#'
#' # View all projects with "Rice" as the current_owner
#' projects(all_stages = TRUE) %>% dplyr::filter(current_owner == "Rice")
#'
#' # View manuscripts
#' manuscripts()
#'
#' # View ideas
#' ideas()
#'
#' # View tasks
#' tasks()
#'
#' # View only Project 1's tasks
#' tasks(1)
#'
#' # View only Plato's tasks
#' tasks(lead = "plato")
#'
#' # View only Plato's tasks in project 1
#' tasks(1, "plato")
#'
#' # Wrapped in if (interactive()) because it requires interactive console input
#' # and fails automated testing.
#' if (interactive()) {
#'   # Archive Fun project 5
#'   archive_project("Fun project 5")
#'
#'   # Default behavior is to not include archived projects in projects() table
#'   projects("Fun")
#'   projects("Fun", archived = TRUE)
#' }
#'
#' #############################################################################
#' # CLEANUP
#' # (or, the user can just restart R)
#' Sys.setenv(HOME = old_home, PROJECTSETUP_FOLDER_PATH = old_ppath)


# R/09_header.R:#' @examples
# line 31
#' @examples
#' #############################################################################
#' # SETUP
#' old_home <- Sys.getenv("HOME")
#' old_ppath <- Sys.getenv("PROJECTSETUP_FOLDER_PATH")
#' temp_dir <- tempfile("dir")
#' dir.create(temp_dir)
#' Sys.unsetenv("PROJECTSETUP_FOLDER_PATH")
#' Sys.setenv(HOME = temp_dir)
#' setup_projects(path = temp_dir)
#' new_affiliation(department_name = "Math Dept.",
#'                 institution_name = "Springfield College",
#'                 address = "123 College St, Springfield, AB")
#' new_affiliation(department_name = "Art Department",
#'                 institution_name = "Springfield College",
#'                 address = "321 University Boulevard, Springfield, AB",
#'                 id = 42)
#' new_affiliation(department_name = "Central Intelligence Agency",
#'                 institution_name = "United States Government",
#'                 address = "888 Classified Dr, Washington DC")
#' new_affiliation(department_name = "Pyrotechnics",
#'                 institution_name = "ACME")
#' new_author(given_names = "Rosetta", last_name = "Stone",
#'            affiliations = c(42, "Math"), degree = "PhD",
#'            email = "slab@rock.net", phone = "867-555-5309", id = 8888)
#' new_author(given_names = "Spiro", last_name = "Agnew", degree = "LLB",
#'            affiliations = "Art D", id = 13)
#' new_author(given_names = "Plato", id = 303)
#' new_project(title = "Test Project 1", authors = c(13, "303", "Stone"),
#'             corresp_auth = "Stone")
#' #############################################################################
#'
#' header(1)
#'
#' #############################################################################
#' # CLEANUP
#' Sys.setenv(HOME = old_home, PROJECTSETUP_FOLDER_PATH = old_ppath)

# R/13_setup.R:#' @examples
# line 67
#' @examples
#' #############################################################################
#' # Setup
#' # Any existing "projects" folder is left totally untouched,
#' # and the user's home directory and .Renviron file are also left untouched.
#' old_home  <- Sys.getenv("HOME")
#' old_ppath <- Sys.getenv("PROJECTSETUP_FOLDER_PATH")
#' temp_dir <- tempfile("dir")
#' dir.create(temp_dir)
#' Sys.setenv(HOME = temp_dir)
#' Sys.unsetenv("PROJECTSETUP_FOLDER_PATH")
#' #############################################################################
#'
#' # Creating the projects folder
#' setup_projects(path = temp_dir)
#'
#' # Viewing the projects folder path:
#' path1 <- projects_folder()
#'
#' # Viewing the contents of the projects folder:
#' list.files(path1, full.names = TRUE, recursive = TRUE,  all.files = TRUE)
#'
#' # Create an arbitrary subfolder in temp_dir:
#' subfolder_path <- file.path(temp_dir, "test")
#' dir.create(subfolder_path)
#'
#'
#' # Wrapped in if (interactive()) because it requires user input
#' if (interactive()) {
#'   # The function won't let the user abandon the old projects folder...
#'   setup_projects(path = subfolder_path)
#'
#'   # ...unless overwrite = TRUE
#'   setup_projects(path = file.path(temp_dir, "test"), overwrite = TRUE)
#'
#'   # Even then, only the stored location of the projects folder is overwritten.
#'   # The old projects folder still exists:
#'   list.files(path1, full.names = TRUE, recursive = TRUE,  all.files = TRUE)
#'
#'   # Giving the "projects" folder a different name:
#'   setup_projects(path = temp_dir, folder_name = "studies", overwrite = TRUE)
#' }
#'
#' #############################################################################
#' # Cleanup
#' # (or, the user can just restart R)
#' Sys.setenv(HOME = old_home, PROJECTSETUP_FOLDER_PATH = old_ppath)
#' #############################################################################

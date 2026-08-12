// =========================
// HAMBURGER MENU
// =========================

const menuBtn = document.getElementById("menuBtn");
const navLinks = document.getElementById("navLinks");


if (menuBtn && navLinks) {

    menuBtn.addEventListener("click", function () {

        navLinks.classList.toggle("show");


        if (navLinks.classList.contains("show")) {

            menuBtn.innerHTML = "✕";

        } else {

            menuBtn.innerHTML = "☰";

        }

    });

}



// =========================
// PROJECT FILTER
// =========================

const filterButtons = document.querySelectorAll(".filter");

const projectCards = document.querySelectorAll(".project-card");

const noProjects = document.getElementById("noProjects");



filterButtons.forEach(function (button) {

    button.addEventListener("click", function () {


        // Remove active class from all buttons

        filterButtons.forEach(function (btn) {

            btn.classList.remove("active");

        });


        // Add active class to clicked button

        button.classList.add("active");


        // Get selected category

        const selectedFilter =
            button.getAttribute("data-filter");


        // Count visible projects

        let projectsFound = 0;



        // Check every project

        projectCards.forEach(function (card) {


            const categories =
                card.getAttribute("data-category");


            // Check if project belongs to category

            if (
                selectedFilter === "all" ||
                (
                    categories &&
                    categories
                        .split(" ")
                        .includes(selectedFilter)
                )
            ) {


                // Show project

                card.style.display = "block";

                projectsFound++;


            } else {


                // Hide project

                card.style.display = "none";


            }

        });



        // =========================
        // NO PROJECT FOUND
        // =========================

        if (noProjects) {


            if (projectsFound === 0) {

                noProjects.style.display = "block";

            } else {

                noProjects.style.display = "none";

            }


        }


    });

});
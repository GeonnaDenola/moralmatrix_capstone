<?php require __DIR__ . '/config.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Moral Matrix</title>
  <link rel="stylesheet" href="css/home.css" />
  <link rel="stylesheet" href="css/shared-header.css" />
  <link rel="icon" type="image/png" href="logo2.png" />
</head>
<body>
  <?php include __DIR__ . '/includes/home_header.php'; ?>

  <section class="hero" aria-label="Welcome section">
    <div class="hero-overlay" aria-hidden="true"></div>
    <div class="container hero-content">
      <p class="hero-kicker">Center for Character Development Unit</p>
      <h1>Guiding Moral Leadership Across Mabalacat City College</h1>
      <p class="hero-lead">
        We equip MCC students with the values, resources, and mentorship they need to grow as
        compassionate, community-centered leaders.
      </p>
      <div class="hero-actions">
        <a class="btn" href="https://mcc.edu.ph/" rel="noopener">Visit MCC Page</a>
        <a class="btn-secondary" href="handbook.php">Read Student Handbook</a>
      </div>
    </div>
    <div class="hero-scroll-hint" aria-hidden="true">
      <span>Scroll</span>
    </div>
  </section>

  <main id="main">

    <section class="section services" id="services">
      <div class="container">
        <header class="section-header">
          <span class="kicker">Services</span>
          <h2>How We Empower MCC Students</h2>
          <p>
            From immersive formation programs to responsive guidance and leadership journeys, our
            team ensures every student feels supported, confident, and purpose-driven.
          </p>
        </header>

        <div class="cards">

  <article class="card">
    <figure class="card-media">
      <img
        src="assets/cert/valuees.jpg"
        alt="Character and Values Formation"
        loading="lazy"
      />
    </figure>

    <div class="card-body">
      <h3>Character & Values Formation</h3>
      <p>
        Engaging retreats, workshops, and reflection circles nurture integrity,
        discipline, and compassion, shaping well-rounded students prepared
        to meet life's challenges.
      </p>
    </div>
  </article>

  <article class="card">
    <figure class="card-media">
      <img
        src="assets/cert/guidance.jpg"
        alt="Student Guidance and Support"
        loading="lazy"
      />
    </figure>

    <div class="card-body">
      <h3>Student Guidance & Support</h3>
      <p>
        Compassionate counselors guide students through personal, academic,
        and social decisions, helping them overcome obstacles and stay aligned
        with MCC's values.
      </p>
    </div>
  </article>

  <article class="card">
    <figure class="card-media">
      <img
        src="assets/cert/leadership.jpg"
        alt="Leadership and Community Involvement"
        loading="lazy"
      />
    </figure>

    <div class="card-body">
      <h3>Leadership & Community Involvement</h3>
      <p>
        Students are empowered to serve through outreach projects, mentorship,
        and campus collaborations that cultivate empathy, teamwork,
        and civic responsibility.
      </p>
    </div>
  </article>

</div>
      </div>
    </section>


    <section class="section about" id="about">
      <div class="container about-grid">
        <div class="about-media" aria-hidden="true">
          <div class="media-card">
            <img
              src="https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?auto=format&fit=crop&w=900&q=80"
              alt=""
              loading="lazy"
            />
            <div class="media-overlay">
              <p>Shaping principled graduates ready to serve our communities.</p>
            </div>
          </div>
        </div>
        <div class="about-content">
          <span class="kicker">About Us</span>
          <h2>Cultivating Character, Compassion, and Community in Every Student</h2>
          <p>
            The Mabalacat City College Center for Character Development Unit (CCDU) is dedicated to
            nurturing the moral integrity, discipline, and holistic growth of every learner. Guided
            by the institution's core values, the unit promotes responsible citizenship, ethical
            decision-making, and a deep sense of social responsibility.
          </p>
          <ul class="checklist">
            <li>Faithful partnership with academic leaders and student organizations</li>
            <li>Programs designed for both personal reflection and collaborative action</li>
            <li>Inclusive support that celebrates diverse backgrounds and voices</li>
          </ul>
        </div>
      </div>
    </section>


  </main>

  <footer class="site-footer">
    <div class="container">
      <p>&copy; <span id="year"></span> Moral Matrix</p>
    </div>
  </footer>

  <script>
    (function () {
      const yearEl = document.getElementById('year');
      if (yearEl) {
        yearEl.textContent = new Date().getFullYear();
      }
    })();

    (function () {
      const backToTop = document.getElementById('backToTop');
      if (!backToTop) return;

      const toggleVisibility = () => {
        if (window.scrollY > 360) {
          backToTop.classList.add('is-visible');
        } else {
          backToTop.classList.remove('is-visible');
        }
      };

      backToTop.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
      });

      window.addEventListener('scroll', toggleVisibility, { passive: true });
      toggleVisibility();
    })();
  </script>
</body>
</html>

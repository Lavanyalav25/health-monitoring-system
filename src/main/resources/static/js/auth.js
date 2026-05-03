/**
 * HealthGuard Global Utilities
 */

function notify(message, type = 'success') {
    let container = document.getElementById('toast-container');
    if (!container) {
        container = document.createElement('div');
        container.id = 'toast-container';
        document.body.appendChild(container);
    }

    const toast = document.createElement('div');
    toast.className = `custom-toast border-start border-4 border-${type}`;
    toast.innerHTML = `
        <div class="d-flex align-items-center gap-2">
            <i class="fa-solid ${type === 'success' ? 'fa-circle-check text-success' : 'fa-triangle-exclamation text-danger'}"></i>
            <span>${message}</span>
        </div>
    `;
    
    container.appendChild(toast);
    setTimeout(() => {
        toast.style.opacity = '0';
        toast.style.transform = 'translateY(20px)';
        toast.style.transition = 'all 0.5s ease';
        setTimeout(() => toast.remove(), 500);
    }, 4000);
}

async function login(email, password) {
    try {
        const response = await fetch('/api/user/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, password })
        });

        if (response.ok) {
            const user = await response.json();
            localStorage.setItem('user', JSON.stringify(user));
            window.location.href = 'dashboard.html';
        } else {
            const error = await response.text();
            notify(error || 'Invalid email or password', 'danger');
        }
    } catch (err) {
        notify('Network error. Check server.', 'danger');
    }
}

async function signup(name, email, password) {
    try {
        const response = await fetch('/api/user/signup', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ name, email, password })
        });

        if (response.ok) {
            notify('Account created! Logging in...', 'success');
            setTimeout(() => window.location.href = 'login.html', 1500);
        } else {
            const error = await response.text();
            notify(error || 'Sign up failed.', 'danger');
        }
    } catch (err) {
        notify('Network error.', 'danger');
    }
}

function logout() {
    localStorage.removeItem('user');
    window.location.href = 'index.html';
}

function checkAuth() {
    const userStr = localStorage.getItem('user');
    if (!userStr || userStr === "undefined") {
        window.location.href = 'login.html';
        return null;
    }
    return JSON.parse(userStr);
}

function getHeaderHTML(activePage) {
    const userStr = localStorage.getItem('user');
    const user = userStr ? JSON.parse(userStr) : null;
    
    // If user is logged in, show a simplified "Platform Header"
    if (user) {
        return `
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid px-4">
                <a class="navbar-brand fw-bold d-flex align-items-center text-primary" href="index.html">
                    <i class="fa-solid fa-heart-pulse me-2"></i> HealthGuard <span class="badge bg-primary-light text-primary ms-2 small fw-normal" style="font-size: 10px">PLATFORM</span>
                </a>
                <div class="ms-auto d-flex align-items-center gap-3">
                    <div class="d-none d-md-block text-end me-2">
                        <small class="text-muted d-block" style="font-size: 10px">LOGGED IN AS</small>
                        <span class="fw-bold small">${user.name}</span>
                    </div>
                    <a href="profile.html" class="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center shadow-sm" style="width: 40px; height: 40px; text-decoration: none; font-weight: 700;">
                        ${user.name.charAt(0).toUpperCase()}
                    </a>
                </div>
            </div>
        </nav>
        `;
    }

    // Default Public Header
    return `
    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold d-flex align-items-center" href="index.html">
                <i class="fa-solid fa-heart-pulse me-2"></i> HealthGuard
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navContent">
                <span class="navbar-toggler-icon text-dark"></span>
            </button>
            <div class="collapse navbar-collapse" id="navContent">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link px-3 text-dark" href="index.html#features">Features</a></li>
                    <li class="nav-item"><a class="nav-link px-3 text-dark" href="index.html#how-it-works">How it Works</a></li>
                </ul>
                <div class="d-flex gap-2">
                    <a href="login.html" class="btn btn-link text-dark text-decoration-none fw-600">Log In</a>
                    <a href="signup.html" class="btn btn-primary px-4 shadow-sm">Get Started</a>
                </div>
            </div>
        </div>
    </nav>
    `;
}

function getFooterHTML() {
    return `
    <footer class="footer mt-auto py-5 bg-white border-top">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4">
                    <h5 class="fw-bold text-primary mb-3">HealthGuard</h5>
                    <p class="text-muted small">The next generation health monitoring platform for high-performance individuals and medical record keeping.</p>
                </div>
                <div class="col-lg-2 ms-auto">
                    <h6 class="fw-bold mb-3">Platform</h6>
                    <ul class="list-unstyled small text-muted">
                        <li class="mb-2"><a href="dashboard.html" class="text-decoration-none text-reset">Overview</a></li>
                        <li class="mb-2"><a href="add_health_data.html" class="text-decoration-none text-reset">Add Vitals</a></li>
                        <li class="mb-2"><a href="records.html" class="text-decoration-none text-reset">History</a></li>
                    </ul>
                </div>
                <div class="col-lg-2">
                    <h6 class="fw-bold mb-3">Company</h6>
                    <ul class="list-unstyled small text-muted">
                        <li class="mb-2"><a href="#" class="text-decoration-none text-reset">About Us</a></li>
                        <li class="mb-2"><a href="#" class="text-decoration-none text-reset">Privacy</a></li>
                        <li class="mb-2"><a href="#" class="text-decoration-none text-reset">Legal</a></li>
                    </ul>
                </div>
            </div>
            <hr class="my-4 opacity-5">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-center gap-3">
                <p class="text-muted small mb-0">© 2026 HealthGuard System. Professional Engineering Project.</p>
                <div class="d-flex gap-3 fs-5 text-muted">
                    <i class="fa-brands fa-github"></i>
                    <i class="fa-brands fa-linkedin"></i>
                    <i class="fa-brands fa-twitter"></i>
                </div>
            </div>
        </div>
    </footer>
    `;
}

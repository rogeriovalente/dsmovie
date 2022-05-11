import { ReactComponent as GithubIcon } from "assets/img/github.svg";

function Navbar() {
  return (
    <header>
      <nav className="container">
        <div className="dsmovie-nav-content">
          <h1>DSMovie</h1>
          <a href="https://github.com/rogeriovalente/dsmovie">
            <div>
              <GithubIcon />
              <p> /devsuperior</p>
            </div>
          </a>
        </div>
      </nav>
    </header>
  );
}

export default Navbar;

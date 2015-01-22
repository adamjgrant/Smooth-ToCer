# Smooth ToCer

Dynamically generate a linked Table of Contents (ToC) from h1-6 HTML tags

## Example

Say we have the following markup

    <section class="content">
      <h1>News</h1>
      <p>Today's breaking news</p>

      <h2>United States</h2> 
      <p>The latest news in the United States</p>

      <h2>World</h2> 
      </p>The latest news of the world</p>
    </section>

Smooth ToCer makes it look like this with one line of JS.

    <section class="toc">
      <ul>
        <li>
          <a href="#news">News</a>
          <ul>
            <li>
              <a href="#united-states">United States</a>
            </li>
            <li>
              <a href="#world">World</a>
            </li>
          </ul>
        </li>
      </ul>
    </section>

    <section class="content">
      <h1 id="news">News</h1>
      <p>Today's breaking news</p>

      <h2 id="united-states">United States</h2> 
      <p>The latest news in the United States</p>

      <h2 id="world">World</h2> 
      </p>The latest news of the world</p>
    </section>

## How to use

Here's an example with jQuery (which is optional, by the way)

    smoothtocer($('.toc'), $('.content'));

`smoothtocer` takes just two arguments, the content to be indexed and the container 
that will hold the ToC.

jQuery is being used above only to select the elements to pass into `smoothtocer()`.

## Making exemptions

To add a heading that should not be added to the ToC, simply add the class `.toc-exempt`


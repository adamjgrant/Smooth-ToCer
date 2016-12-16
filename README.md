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

`smoothtocer` takes just two arguments, the container 
that will hold the ToC and the content to be indexed.

jQuery is being used above only to select the elements to pass into `smoothtocer()`.

## Making exemptions

To add a heading that should not be added to the ToC, simply add the class `.toc-exempt`

## Troubleshooting

### Must be a strict h1-6 structure

At this time, the ToCer does not work with content whose first heading is not an `<h1>` or
content that skips levels. So the below will not work for two reasons.

    <h2>News</h2>

    <h4>United States</h4>
    
This is intentional. To separate concerns of HTML and CSS (structure vs style) Heading numbers should not be set to reflect the font-size desired but the logical hierarchy and sequencing of the page's content.

I recommend setting a parent scope in your css like

    .content-to-be-indexed
    
And setting the desired styling of the `<hn>` elements below it.

import { html, css, LitElement } from 'lit'
import { customElement, property, query } from 'lit/decorators.js'

@customElement('form-element')
export class FormElement extends LitElement {
  @property()
  name: string = '';

  render() {
    return html`
      <div>My name is ${this.name}</div>
      <form>
        <label for="name">Name</label>
        <input type="text" id="name" name="name" />
        <button type="submit">Submit</button>
      </form>
    `
  }

}

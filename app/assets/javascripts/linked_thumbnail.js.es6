export default class LinkedThumbnail {
  constructor(title, id, type, initialPath) {
    this.title = title;
    this.id = id;
    this.type = type;
    this.toHtml = this.toHtml.bind(this);
    this.thumbnail = this.thumbnail.bind(this);
    this.initialPath = initialPath;
  }

  toHtml() {
   return [
      `${this.recordLink('thumbnail', this.thumbnail())}`,
      `${this.recordLink(this.title, this.title)}`,
    ].join(' ');
  }

  recordLink(alt, data) {
    return `<a href="/catalog/${this.id}/${this.initialPath}" alt="${alt}">${data}</a>`;
  }

  thumbnail() {
    return `<div><img src="/thumbnails/${this.id}/${this.type}" /></div>`;
  }
}

export default class LinkedThumbnail {
  constructor(title, id, type, coordinates, locations) {
    this.title = title;
    this.id = id;
    this.type = type;
    this.coordinates = coordinates;
    this.locations = locations;
    this.linked_thumbnail = this.linked_thumbnail.bind(this);
    this.thumbnail = this.thumbnail.bind(this);
  }

  linkedThumbnail() {
    [
      `${this.recordLink('thumbnail', this.thumbnail)}`,
      `${this.recordLink(this.title, this.title)}`,
    ].join(' ');
  }

  recordLink(alt, data) {
    return `<a href="/catalog/${this.id}" alt="${alt}">${data}</a>`;
  }

  thumbnail() {
    return `<div><img src="/thumbnails/${this.id}/${this.type}" /></div>`;
  }
}

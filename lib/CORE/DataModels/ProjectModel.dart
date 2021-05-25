class Project {
  const Project({
    this.id,
    this.title,
    this.slug,
    this.scrollLength,
    this.banner,
    this.shortDescription,
    this.longDescription,
    this.githubLink,
    this.playstoreLink,
    this.preview,
    this.yearAndTech});

  final int id;
  final String title;
  final String slug;
  final double scrollLength;
  final String banner;
  final String shortDescription;
  final String longDescription;
  final String githubLink;
  final String playstoreLink;
  final String preview;
  final List<String> yearAndTech;
}

// To parse this JSON data, do
//
//     final newsResponseModel = newsResponseModelFromJson(jsonString);

import 'dart:convert';

List<NewsResponseModel> newsResponseModelFromJson(String str) =>
    List<NewsResponseModel>.from(
        json.decode(str).map((x) => NewsResponseModel.fromJson(x)));

String newsResponseModelToJson(List<NewsResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsResponseModel {
  NewsResponseModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.acf,
    this.yoastHead,
    this.yoastHeadJson,
    this.links,
  });

  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  Meta? meta;
  List<int>? categories;
  List<int>? tags;
  List<dynamic>? acf;
  String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  Links? links;

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      NewsResponseModel(
        id: json["id"],
        date: json["date"],
        dateGmt: json["date_gmt"],
        guid: Guid.fromJson(json["guid"]),
        modified: json["modified"],
        modifiedGmt: json["modified_gmt"],
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        sticky: json["sticky"],
        template: json["template"],
        format: json["format"],
        meta: Meta.fromJson(json["meta"]),
        categories: List<int>.from(json["categories"].map((x) => x)),
        tags: List<int>.from(json["tags"].map((x) => x)),
        acf: List<dynamic>.from(json["acf"].map((x) => x)),
        yoastHead: json["yoast_head"],
        yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "date_gmt": dateGmt,
        "guid": guid!.toJson(),
        "modified": modified,
        "modified_gmt": modifiedGmt,
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title!.toJson(),
        "content": content!.toJson(),
        "excerpt": excerpt!.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": meta!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "acf": List<dynamic>.from(acf!.map((x) => x)),
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson!.toJson(),
        "_links": links!.toJson(),
      };
}

class Meta {
  Meta({
    this.inline_featured_image,
  }

  );

  bool? inline_featured_image;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        inline_featured_image: json["inline_featured_image"],
       
      );

  Map<String, dynamic> toJson() => {
        "inline_featured_image": inline_featured_image,
        
      };
}
class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  Guid({
    this.rendered,
  });

  String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<AuthorElement>? author;
  List<AuthorElement>? replies;
  List<VersionHistory>? versionHistory;
  List<AuthorElement>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<AuthorElement>.from(
            json["author"].map((x) => AuthorElement.fromJson(x))),
        replies: List<AuthorElement>.from(
            json["replies"].map((x) => AuthorElement.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        wpFeaturedmedia: json["wp:featuredmedia"] == null
            ? null
            : List<AuthorElement>.from(
                json["wp:featuredmedia"].map((x) => AuthorElement.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
        "wp:featuredmedia": wpFeaturedmedia == null
            ? null
            : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies!.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class AuthorElement {
  AuthorElement({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory AuthorElement.fromJson(Map<String, dynamic> json) => AuthorElement(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  String? name;
  String? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  String? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };
}

class YoastHeadJson {
  YoastHeadJson({
    this.title,
    this.description,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogDescription,
    this.ogUrl,
    this.ogSiteName,
    this.articlePublishedTime,
    this.articleModifiedTime,
    this.ogImage,
    this.twitterCard,
    this.twitterMisc,
    this.schema,
  });

  String? title;
  String? description;
  Robots? robots;
  String? canonical;
  String? ogLocale;
  String? ogType;
  String? ogTitle;
  String? ogDescription;
  String? ogUrl;
  String? ogSiteName;
  DateTime? articlePublishedTime;
  DateTime? articleModifiedTime;
  List<OgImage>? ogImage;
  String? twitterCard;
  TwitterMisc? twitterMisc;
  Schema? schema;

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        description: json["description"],
        robots: Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"],
        ogType: json["og_type"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"],
        articlePublishedTime: DateTime.parse(json["article_published_time"]),
        articleModifiedTime: DateTime.parse(json["article_modified_time"]),
        ogImage: json["og_image"] == null
            ? null
            : List<OgImage>.from(
                json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: json["twitter_card"],
        twitterMisc: TwitterMisc.fromJson(json["twitter_misc"]),
        schema: Schema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "robots": robots!.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "article_published_time": articlePublishedTime!.toIso8601String(),
        "article_modified_time": articleModifiedTime!.toIso8601String(),
        "og_image": ogImage == null
            ? null
            : List<dynamic>.from(ogImage!.map((x) => x.toJson())),
        "twitter_card": twitterCard,
        "twitter_misc": twitterMisc!.toJson(),
        "schema": schema!.toJson(),
      };
}

class OgImage {
  OgImage({
    this.width,
    this.height,
    this.url,
    this.type,
  });

  int? width;
  int? height;
  String? url;
  String? type;

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "type": type,
      };
}

class Robots {
  Robots({
    this.index,
    this.follow,
    this.maxSnippet,
    this.maxImagePreview,
    this.maxVideoPreview,
  });

  String? index;
  String? follow;
  String? maxSnippet;
  String? maxImagePreview;
  String? maxVideoPreview;

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"],
        follow: json["follow"],
        maxSnippet: json["max-snippet"],
        maxImagePreview: json["max-image-preview"],
        maxVideoPreview: json["max-video-preview"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
      };
}

class Schema {
  Schema({
    this.context,
    this.graph,
  });

  String? context;
  List<Graph>? graph;

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": List<dynamic>.from(graph!.map((x) => x.toJson())),
      };
}

class Graph {
  Graph({
    this.type,
    this.id,
    this.name,
    this.url,
    this.sameAs,
    this.logo,
    this.image,
    this.description,
    this.publisher,
    this.potentialAction,
    this.inLanguage,
    this.contentUrl,
    this.width,
    this.height,
    this.caption,
    this.isPartOf,
    this.primaryImageOfPage,
    this.datePublished,
    this.dateModified,
    this.breadcrumb,
    this.itemListElement,
    this.author,
    this.headline,
    this.mainEntityOfPage,
    this.wordCount,
    this.commentCount,
    this.thumbnailUrl,
    this.keywords,
    this.articleSection,
  });

  String? type;
  String? id;
  String? name;
  String? url;
  List<dynamic>? sameAs;
  Image? logo;
  Image? image;
  String? description;
  BreadcrumbClass? publisher;
  List<PotentialAction>? potentialAction;
  InLanguage? inLanguage;
  String? contentUrl;
  int? width;
  int? height;
  String? caption;
  BreadcrumbClass? isPartOf;
  BreadcrumbClass? primaryImageOfPage;
  DateTime? datePublished;
  DateTime? dateModified;
  BreadcrumbClass? breadcrumb;
  List<ItemListElement>? itemListElement;
  BreadcrumbClass? author;
  String? headline;
  BreadcrumbClass? mainEntityOfPage;
  int? wordCount;
  int? commentCount;
  String? thumbnailUrl;
  List<String>? keywords;
  List<String>? articleSection;

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["@type"],
        id: json["@id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
        sameAs: json["sameAs"] == null
            ? null
            : List<dynamic>.from(json["sameAs"].map((x) => x)),
        logo: json["logo"] == null ? null : Image.fromJson(json["logo"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        description: json["description"] == null ? null : json["description"],
        publisher: json["publisher"] == null
            ? null
            : BreadcrumbClass.fromJson(json["publisher"]),
        potentialAction: json["potentialAction"] == null
            ? null
            : List<PotentialAction>.from(json["potentialAction"]
                .map((x) => PotentialAction.fromJson(x))),
        inLanguage: json["inLanguage"] == null
            ? null
            : inLanguageValues.map[json["inLanguage"]],
        contentUrl: json["contentUrl"] == null ? null : json["contentUrl"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        caption: json["caption"] == null ? null : json["caption"],
        isPartOf: json["isPartOf"] == null
            ? null
            : BreadcrumbClass.fromJson(json["isPartOf"]),
        primaryImageOfPage: json["primaryImageOfPage"] == null
            ? null
            : BreadcrumbClass.fromJson(json["primaryImageOfPage"]),
        datePublished: json["datePublished"] == null
            ? null
            : DateTime.parse(json["datePublished"]),
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
        breadcrumb: json["breadcrumb"] == null
            ? null
            : BreadcrumbClass.fromJson(json["breadcrumb"]),
        itemListElement: json["itemListElement"] == null
            ? null
            : List<ItemListElement>.from(json["itemListElement"]
                .map((x) => ItemListElement.fromJson(x))),
        author: json["author"] == null
            ? null
            : BreadcrumbClass.fromJson(json["author"]),
        headline: json["headline"] == null ? null : json["headline"],
        mainEntityOfPage: json["mainEntityOfPage"] == null
            ? null
            : BreadcrumbClass.fromJson(json["mainEntityOfPage"]),
        wordCount: json["wordCount"] == null ? null : json["wordCount"],
        commentCount:
            json["commentCount"] == null ? null : json["commentCount"],
        thumbnailUrl:
            json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
        keywords: json["keywords"] == null
            ? null
            : List<String>.from(json["keywords"].map((x) => x)),
        articleSection: json["articleSection"] == null
            ? null
            : List<String>.from(json["articleSection"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
        "sameAs":
            sameAs == null ? null : List<dynamic>.from(sameAs!.map((x) => x)),
        "logo": logo == null ? null : logo!.toJson(),
        "image": image == null ? null : image!.toJson(),
        "description": description == null ? null : description,
        "publisher": publisher == null ? null : publisher!.toJson(),
        "potentialAction": potentialAction == null
            ? null
            : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
        "inLanguage":
            inLanguage == null ? null : inLanguageValues.reverse![inLanguage],
        "contentUrl": contentUrl == null ? null : contentUrl,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "caption": caption == null ? null : caption,
        "isPartOf": isPartOf == null ? null : isPartOf!.toJson(),
        "primaryImageOfPage":
            primaryImageOfPage == null ? null : primaryImageOfPage!.toJson(),
        "datePublished":
            datePublished == null ? null : datePublished!.toIso8601String(),
        "dateModified":
            dateModified == null ? null : dateModified!.toIso8601String(),
        "breadcrumb": breadcrumb == null ? null : breadcrumb!.toJson(),
        "itemListElement": itemListElement == null
            ? null
            : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
        "author": author == null ? null : author!.toJson(),
        "headline": headline == null ? null : headline,
        "mainEntityOfPage":
            mainEntityOfPage == null ? null : mainEntityOfPage!.toJson(),
        "wordCount": wordCount == null ? null : wordCount,
        "commentCount": commentCount == null ? null : commentCount,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
        "keywords": keywords == null
            ? null
            : List<dynamic>.from(keywords!.map((x) => x)),
        "articleSection": articleSection == null
            ? null
            : List<dynamic>.from(articleSection!.map((x) => x)),
      };
}

class BreadcrumbClass {
  BreadcrumbClass({
    this.id,
  });

  String? id;

  factory BreadcrumbClass.fromJson(Map<String, dynamic> json) =>
      BreadcrumbClass(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

class Image {
  Image({
    this.id,
    this.type,
    this.inLanguage,
    this.url,
    this.contentUrl,
    this.caption,
    this.width,
    this.height,
  });

  String? id;
  String? type;
  InLanguage? inLanguage;
  String? url;
  String? contentUrl;
  String? caption;
  int? width;
  int? height;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["@id"],
        type: json["@type"] == null ? null : json["@type"],
        inLanguage: json["inLanguage"] == null
            ? null
            : inLanguageValues.map[json["inLanguage"]],
        url: json["url"] == null ? null : json["url"],
        contentUrl: json["contentUrl"] == null ? null : json["contentUrl"],
        caption: json["caption"] == null ? null : json["caption"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type == null ? null : type,
        "inLanguage":
            inLanguage == null ? null : inLanguageValues.reverse![inLanguage],
        "url": url == null ? null : url,
        "contentUrl": contentUrl == null ? null : contentUrl,
        "caption": caption == null ? null : caption,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}

enum InLanguage { EN_US }

final inLanguageValues = EnumValues({"en-US": InLanguage.EN_US});

class ItemListElement {
  ItemListElement({
    this.type,
    this.position,
    this.name,
    this.item,
  });

  String? type;
  int? position;
  String? name;
  String? item;

  factory ItemListElement.fromJson(Map<String, dynamic> json) =>
      ItemListElement(
        type: json["@type"],
        position: json["position"],
        name: json["name"],
        item: json["item"] == null ? null : json["item"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item == null ? null : item,
      };
}

class PotentialAction {
  PotentialAction({
    this.type,
    this.target,
    this.queryInput,
  });

  String? type;
  dynamic target;
  String? queryInput;

  factory PotentialAction.fromJson(Map<String, dynamic> json) =>
      PotentialAction(
        type: json["@type"],
        target: json["target"],
        queryInput: json["query-input"] == null ? null : json["query-input"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "target": target,
        "query-input": queryInput == null ? null : queryInput,
      };
}

class TargetClass {
  TargetClass({
    this.type,
    this.urlTemplate,
  });

  String? type;
  String? urlTemplate;

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: json["@type"],
        urlTemplate: json["urlTemplate"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
      };
}

class TwitterMisc {
  TwitterMisc({
    this.writtenBy,
    this.estReadingTime,
  });

  String? writtenBy;
  String? estReadingTime;

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        writtenBy: json["Written by"],
        estReadingTime: json["Est. reading time"],
      );

  Map<String, dynamic> toJson() => {
        "Written by": writtenBy,
        "Est. reading time": estReadingTime,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

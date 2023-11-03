import 'package:clean_code_app/core/resources/media_resources.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  const PageContent.first()
      : this(
          image: MediaResources.casualReading,
          title: 'Brand new curriculum',
          description:
              'lorem ipsum bla e tali che loro fossero qundo anche essi saranno',
        );

  const PageContent.second()
      : this(
          image: MediaResources.casualLife,
          title: 'Brand a fun atmosphere',
          description:
              'e quando loro ed essi saranno, sapranno di essere senza ricordarsi di esser stati',
        );

  const PageContent.third()
      : this(
          image: MediaResources.casualMeditationScience,
          title: 'Brand new curriculum',
          description:
              'ed é nel loro ricordarsi di non esser stati che troveranno che loro furono',
        );

  final String image;
  final String title;
  final String description;

  @override
  List<Object?> get props => [image, title, description];
}

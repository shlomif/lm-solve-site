package MyManageNews;

use strict;
use warnings;

use parent 'Exporter';

our @EXPORT_OK = (qw(get_news_manager));

use HTML::Latemp::News v0.2.1 ();

my @news_items = (
    (
        map {
            +{
                %$_,
                'author'   => "Shlomi Fish",
                'category' => "LM-Solve",
                'text'     => "Hello"
            }
        } (
            0
            ? (
                {
                    'title'       => "Updated Comparison and Monotone Updates",
                    'id'          => "changes-2009-05-19",
                    'description' => q{3 new systems have been added to the
            comparison, the comparison was updated in general, and Monotone
            now has more up-to-date information.
            },
                    date => "2009-05-19",
                },
                )
            : ()
        )
    )
);

sub gen_news_manager
{
    my $date = scalar( gmtime(1563197532) );
    return HTML::Latemp::News->new(
        'news_items'      => \@news_items,
        pubDate           => $date,
        lastBuildDate     => $date,
        'title'           => "Better SCM News",
        'link'            => "http://better-scm.berlios.de/",
        'language'        => "en-US",
        'copyright'       => "Copyright by Shlomi Fish, (c) 2005",
        'webmaster'       => "Shlomi Fish <shlomif\@shlomifish.org>",
        'managing_editor' => "Shlomi Fish <shlomif\@shlomifish.org>",
        'description'     =>
"News of the Better SCM Site - a site for Version Control and Source Configuration Management news and advocacy",
    );
}

# A singleton.
my $news_manager;

sub get_news_manager
{
    if ( !defined($news_manager) )
    {
        $news_manager = gen_news_manager();
    }
    return $news_manager;
}

1;

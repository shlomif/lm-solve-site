package MyNavData;

use strict;
use warnings;

use MyManageNews qw/ get_news_manager /;

my $hosts = {
    'lmsolve' => {
        'base_url' => "http://www.shlomifish.org/lm-solve",
    },
};

my $news_manager = get_news_manager();

my $tree_contents = {
    'host' => "lmsolve",
    'text' => "Logic Mazes Solver",
    'subs' => [
        {
            'text' => "Home",
            'url'  => "",
        },
        {
            'text' => "Download",
            'url'  => "download.html",
        },
        {
            'text' => "Links",
            'url'  => "links.html",
        },
    ],
};

sub get_params
{
    return (
        'hosts'         => $hosts,
        'tree_contents' => $tree_contents,
    );
}

sub get_hosts
{
    return $hosts;
}

1;

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321996C8C
	for <lists+dm-devel@lfdr.de>; Wed, 21 Aug 2019 00:55:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F5DC1951CC6;
	Tue, 20 Aug 2019 22:55:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AA1B5C205;
	Tue, 20 Aug 2019 22:55:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EBA22551B;
	Tue, 20 Aug 2019 22:55:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7KMt906012902 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Aug 2019 18:55:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46F851D9; Tue, 20 Aug 2019 22:55:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBD7E194BE;
	Tue, 20 Aug 2019 22:55:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7KMt5IN016759; 
	Tue, 20 Aug 2019 17:55:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7KMt4A5016758;
	Tue, 20 Aug 2019 17:55:04 -0500
Date: Tue, 20 Aug 2019 17:55:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190820225504.GN25414@octiron.msp.redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-11-git-send-email-bmarzins@redhat.com>
	<1f9360e75494c4597d80a08677a34441159b3af4.camel@suse.com>
	<20190816212837.GK25414@octiron.msp.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816212837.GK25414@octiron.msp.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>, Hannes Reinecke <hare@suse.com>
Subject: Re: [dm-devel] [PATCH 10/16] libmultipath: make pgpolicyfn take a
 paths vector
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Tue, 20 Aug 2019 22:55:49 +0000 (UTC)

On Fri, Aug 16, 2019 at 04:28:37PM -0500, Benjamin Marzinski wrote:
> On Wed, Aug 14, 2019 at 10:05:45PM +0000, Martin Wilck wrote:

> > OK: This is future material. But if we take this patch and its
> > successors, be'd have it cast in stone that "marginal/normal" is the
> > main distinction, taking precedence over everything else, and I'm not
> > convinced that that's the way to go.
> > 
> > We could obtain the semantics of your current patch set by assigning a
> > negative prio bias to marginal paths, and changing the grouping
> > algorithms (except group_by_prio) such that they take the marginal
> > property into account (e.g. group_by_node_name would pretend that all
> > marginal paths have a common "node name" and lump them together). This
> > would allow us to keep our current simple mpp->pg vector and represent
> > the marginal paths simply by one (the last) PG in this vector. 
> > 
> > The benefit would be that this model would be more flexible for more
> > sophisticated priority models in the future.
> 
> I'll take a look at doing this in a way that would make it easier to
> fine tune this in the future.

So, I've looked at this, and I'd like to make the case that these
patches don't put multipath into an inflexible method of dealing with
path groups. In my mind, there are three issues with path grouping that
my patches deal with

1. How the paths are grouped together
2. How the pathgroups are ordered
3. How the best pathgroup is chosen

I'd argue that the only issue where my patches really adds some
significant code is on 1. I think that my choice of groups for 1 is
correct, and I have a suggestion for making issue 3 go away.

In regards to the first issue, how the paths are grouped together, my
patch basically follows two rules:

1. Marginal paths shouldn't be grouped with non-marginal paths.

Obviously, if you want the marginal paths to stay in the same group as
they would normally be in, then you don't want marginal path detection
at all. Further, I don't see a scenario where we would like the marginal
paths to be grouped with non-marginal paths that they wouldn't normally
be grouped with.

2. Marginal paths should be grouped with other marginal paths using the
same rules as for non-marginal paths.

There are often very good reasons why paths are grouped the way they
are.  For instance, if the marginal path is passive (I'm not even sure
that we should keep paths in the marginal state if they are PATH_GHOST,
but we currently do), we really don't want to put it in a pathgroup with
active paths. There probably are cases where it is safe to put all, or
some, of the marginal paths together, but it's not easy to know when
that is, and I don't think there is much benefit from doing the work to
figure it out, and it is always safe to group them like you would if
they were non-marginal paths.

I don't see a better way to set up the groups than what my patch does,
so I'm not particularly worried about all the code involved in making
sure that the groups look like this.

As for the second issue, how the pathgroups are ordered, I don't think
my code locks us in at all.  The functions that order the pathgroups are
path_group_prio_update() and sort_pathgroups().  If you wanted to make
multipath just change the priority of marginal pathgroups, you would
just need to set that priority in path_group_prio_update(), and if you
only wanted to use the priority for sorting them, you would just change
sort_pathgroups() to only sort by priority. If you wanted to change
pgp->marginal from something binary to something that reflected how
marginal a path was, and you want to have that to change how a path was
sorted vs other paths with different marginal and priority values, you
could do all of that by simply changing the values set in
path_group_prio_update() and how those values are sorted in
sort_pathgroups(). I don't think my code does anything to make this less
flexible.

As for the third issue, how the best pathgroup is chosen, this is also a
case where changing things just involves changing how things are done in
one function, select_path_group(), to match what's done in
sort_pathgroups(). But since the pathgroups are already in order from
the best one to use to the worst, the multipath userspace tools could
just work how the kernel works, and pick the first usable pathgroup.
This won't always give the same answer that multipath currently does,
since the current code looks at the number of enabled paths. But the
only times when it will be different is when there are multiple
pathgroups with the same priority, and the first one has some failed
paths.  Since we rarely have multiple pathgroups with the same priorty
except when using the failover policy (group_by_serial and
group_by_node_name being rarely used), and you will always have one path
per pathgroup with failover, in practice this will almost never occur.

Oh, I did notice a bug in my select_path_group() code. I should be
calling path_group_prio_update() before checking if the pathgroup
is marginal or not. I'll fix that.

So, I'm not against making this all work with priorities if there is a
reason to do so, but doing that will just involve changes in 3
straightforward functions, or 2 if we decide to simplify
select_path_group() so it just uses the order from sort_pathgroups() as
a guide.

If you feel strongly about doing this with priorities, I can add a patch
that changes this. But if it gets us the same results, then I don't see
much benefit. We can always change it laster if we want to change how
the groups actually end up.

-Ben

> -Ben
> 
> > Regards,
> > Martin
> > 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

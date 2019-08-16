Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BD61890A4B
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 23:31:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EAFA6308FBAC;
	Fri, 16 Aug 2019 21:31:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5ADA19C6A;
	Fri, 16 Aug 2019 21:31:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 822E624F30;
	Fri, 16 Aug 2019 21:31:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GLSgHv011525 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 17:28:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 615748F6EE; Fri, 16 Aug 2019 21:28:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 060EC5D9DC;
	Fri, 16 Aug 2019 21:28:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7GLScHw009656; 
	Fri, 16 Aug 2019 16:28:38 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7GLScx0009655;
	Fri, 16 Aug 2019 16:28:38 -0500
Date: Fri, 16 Aug 2019 16:28:37 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190816212837.GK25414@octiron.msp.redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-11-git-send-email-bmarzins@redhat.com>
	<1f9360e75494c4597d80a08677a34441159b3af4.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f9360e75494c4597d80a08677a34441159b3af4.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 16 Aug 2019 21:31:14 +0000 (UTC)

On Wed, Aug 14, 2019 at 10:05:45PM +0000, Martin Wilck wrote:
> On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> > To enable future changes, mp->pgpolicyfn() now takes a vector of
> > paths instead of always using mp->paths.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/pgpolicies.c | 38 +++++++++++++++++++----------------
> > ---
> >  libmultipath/pgpolicies.h | 10 +++++-----
> >  libmultipath/structs.h    |  2 +-
> >  3 files changed, 25 insertions(+), 25 deletions(-)
> > 
> 
> The following applies to this patch and its successors (11-13, 15).
> 
> This is technically correct, beautiful code, but I'm not sure if this
> is where we want to go. Do we really need that strict separation
> between "normal" and "marginal" path groups?
> 
> As I already noted in my reply to 14/16, I'd favor an approach where
> we would factor in the "marginality" of a path when calculating the
> priority and the grouping. For example, when working with ALUA and
> group_by_prio, rather than lumping all marginal paths together, we may
> want to group like this:
> 
>  - active/optimized, healthy
>  - active/non-optimized, healthy
>  - active/optimized, marginal
>  - active/non-optimized, marginal
>  - standby
>  - other
> 
> The priorities of these groups would be up to discussion. Today I'm not
> even sure if "marginal" property should take precedence over
> "optimized" property, or vice-versa. It might actually depend on the
> situation and the degree of "shakiness" ...

Possibly, if we include some way measuring the degree of shakiness. In
my experience, by far the most common reason that a path is declared
marginal is because something has gone wrong where the path_checker is
saying the the path is good, but virtually no I/O to the path is
succeeding. In this case you just want to keep that path from
continually being brought back and then failing. That's why marking the
path as down was a pretty decent idea. In fact, one of my worries with
the marginal pathgroups code is that it makes it impossible for you to
ever trigger your no_path_retry limit in this case, which some customers
may still want. If your only path is on that fails virtually all IO,
then it's the same having no paths.

All this is to say that I agree that with our current marginal paths
algorithms, you can make a case that you could detect a path that you
might not want to use if there are better options, but which doesn't
deserve to be the absolute last resort. On the other hand, I'm not
convinced that we'd run into this case enough for it to be worth adding
too much complexity to the code. Instead, I'm still more worried about
the opposite issue, where you would rather have the multipath device
timeout and throw an error, rather than continue to try to use a
marginal path.

> OK: This is future material. But if we take this patch and its
> successors, be'd have it cast in stone that "marginal/normal" is the
> main distinction, taking precedence over everything else, and I'm not
> convinced that that's the way to go.
> 
> We could obtain the semantics of your current patch set by assigning a
> negative prio bias to marginal paths, and changing the grouping
> algorithms (except group_by_prio) such that they take the marginal
> property into account (e.g. group_by_node_name would pretend that all
> marginal paths have a common "node name" and lump them together). This
> would allow us to keep our current simple mpp->pg vector and represent
> the marginal paths simply by one (the last) PG in this vector. 
> 
> The benefit would be that this model would be more flexible for more
> sophisticated priority models in the future.

I'll take a look at doing this in a way that would make it easier to
fine tune this in the future.

-Ben

> Regards,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFEF909EA
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 23:02:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9BBD307D847;
	Fri, 16 Aug 2019 21:02:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4F255D9DC;
	Fri, 16 Aug 2019 21:02:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BBAF18005B9;
	Fri, 16 Aug 2019 21:02:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GL26w9010326 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 17:02:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 049A11001B14; Fri, 16 Aug 2019 21:02:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C431001B08;
	Fri, 16 Aug 2019 21:02:00 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7GL1xLs009273; 
	Fri, 16 Aug 2019 16:01:59 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7GL1wGW009272;
	Fri, 16 Aug 2019 16:01:58 -0500
Date: Fri, 16 Aug 2019 16:01:58 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190816210158.GI25414@octiron.msp.redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-4-git-send-email-bmarzins@redhat.com>
	<7840aab31dd06de729f124af98da3498e0256556.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7840aab31dd06de729f124af98da3498e0256556.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 03/16] tests: add path grouping policy unit
	tests.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 16 Aug 2019 21:02:16 +0000 (UTC)

On Wed, Aug 14, 2019 at 09:22:17PM +0000, Martin Wilck wrote:
> On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> > In preparation for changing the path grouping code, add some unit
> > tests
> > to verify that it works correctly. The only test that currently fails
> > (and so it being skipped) is using MULTIBUS when mp->paths is empty.
> > All
> > the other path grouping policies free mp->paths, even if it is empty.
> > one_group() should as well. This will be fixed when the path grouping
> > code is updated.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  tests/Makefile   |   2 +-
> >  tests/pgpolicy.c | 708
> > +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 709 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/pgpolicy.c
> > 
> > +
> > +static void test_group_by_node_name_3_groups4(void **state)
> > +{
> > +	char *node_name[] = {"a","b","c","a"};
> > +	int prio[] = {3,1,3,1};
> > +	int group0[] = {2};
> > +	int group1[] = {0,3};
> > +	int group2[] = {1};
> > +	int *groups[] = {group0, group1, group2};
> > +	int group_size[] = {1,2,1};
> > +
> > +	set_priority(p4, prio, 4);
> > +	set_tgt_node_name(p4, node_name, 4);
> > +	assert_int_equal(group_by_node_name(&mp4), 0);
> > +	verify_pathgroups(&mp4, p4, groups, group_size, 3);
> > +}
> 
> Nothing wrong with your code, but this is one example where I would say
> our prio group ordering is counter-intuitive. Does it really make sense
> to order the group of two paths with prio {3, 1} *after* the group with
> just one prio 3 path?

That's kind of tricky, because with the round-robin path selector, just
having one fast path in the group might be the correct answer, while
with the dynamic path selectors, it seems like having both paths would
be better. My person issue with out path grouping is that I don't think
that what group_by_prio is what many devices want.  For many devices,
the paths are going to be grouped by something static, like what
controller the paths go to.  In that case, all the overhead of remaking
that pathgroups whenever the priority changes is a bunch of wasted
overhead. Also, it can cause situations where is multipathd notices
a priority change at the wrong moment, it will temporarily make garbage
pathgroups, with some paths using their old priority, and some using
their new priority (which multipathd hasn't noticed yet).

-Ben

> 
> Regards,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

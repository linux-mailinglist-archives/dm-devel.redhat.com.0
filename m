Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C2410B248E
	for <lists+dm-devel@lfdr.de>; Fri, 13 Sep 2019 19:19:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA71EA26660;
	Fri, 13 Sep 2019 17:19:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB99F5C207;
	Fri, 13 Sep 2019 17:19:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 482F02551B;
	Fri, 13 Sep 2019 17:19:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DHHZBp013014 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 13:17:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 668EC5D9CD; Fri, 13 Sep 2019 17:17:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 207365D9C3;
	Fri, 13 Sep 2019 17:17:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8DHHVOk020399; 
	Fri, 13 Sep 2019 12:17:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8DHHV0h020398;
	Fri, 13 Sep 2019 12:17:31 -0500
Date: Fri, 13 Sep 2019 12:17:31 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190913171730.GV25414@octiron.msp.redhat.com>
References: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
	<1568155161-9343-5-git-send-email-bmarzins@redhat.com>
	<a7b7b31b82369a51e9490c1a6fd7ce770be3bfbe.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7b7b31b82369a51e9490c1a6fd7ce770be3bfbe.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] libmultipath: fix mpcontext
	initialization
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Fri, 13 Sep 2019 17:19:37 +0000 (UTC)

On Fri, Sep 13, 2019 at 08:28:59AM +0000, Martin Wilck wrote:
> On Tue, 2019-09-10 at 17:39 -0500, Benjamin Marzinski wrote:
> > If a path is discovered before there is a multipath device for it to
> > belong to, the checker will not have its mpcontext initialized, even
> > if
> > that path later belongs to a multipath device. A checker's mpcontext
> > is
> > only set when the checker is selected, and is set to NULL if there is
> > no
> > multipath device associated with the path. This only impacts the emc
> > checker. However, it makes the emc checker unable to determine if a
> > passive path is connected to an inactive snapshot or not.
> > 
> > This can be solved by adding a new checker class function, mp_init().
> > This is called when the checker is first initialized, and whenever
> > the
> > checker is called, if the checker's mpcontext hasn't been
> > initialized.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/checkers.c              | 29
> > ++++++++++++++++++++++++++--
> >  libmultipath/checkers.h              |  1 +
> >  libmultipath/checkers/cciss_tur.c    |  5 +++++
> >  libmultipath/checkers/directio.c     |  5 +++++
> >  libmultipath/checkers/emc_clariion.c |  7 +++++++
> >  libmultipath/checkers/hp_sw.c        |  5 +++++
> >  libmultipath/checkers/rdac.c         |  5 +++++
> >  libmultipath/checkers/readsector0.c  |  5 +++++
> >  libmultipath/checkers/tur.c          |  5 +++++
> >  libmultipath/discovery.c             |  2 ++
> >  10 files changed, 67 insertions(+), 2 deletions(-)
> > 
> 
> I see the problem and agree the solution is correct. But I'd prefer if
> the mp_init() method was optional and, if not defined in the
> libcheckX.so, would simply be set to NULL. So you wouldn't need to
> define empty methods for all checkers except emc. 

Sure.

-Ben

> checker_mp_init() checks for mp_init() being non-NULL anyway.
> 
> Thanks,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B84B248B
	for <lists+dm-devel@lfdr.de>; Fri, 13 Sep 2019 19:19:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBCEE18C4260;
	Fri, 13 Sep 2019 17:19:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2024D19C78;
	Fri, 13 Sep 2019 17:19:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 360E92551C;
	Fri, 13 Sep 2019 17:19:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DHHBrk012982 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 13:17:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CEC104506; Fri, 13 Sep 2019 17:17:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8C4A19C78;
	Fri, 13 Sep 2019 17:17:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8DHH8So020393; 
	Fri, 13 Sep 2019 12:17:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8DHH79T020392;
	Fri, 13 Sep 2019 12:17:07 -0500
Date: Fri, 13 Sep 2019 12:17:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190913171706.GU25414@octiron.msp.redhat.com>
References: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
	<1568155161-9343-4-git-send-email-bmarzins@redhat.com>
	<cfec1a7ebbe1e62699d26b9978a8643a798c05dd.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfec1a7ebbe1e62699d26b9978a8643a798c05dd.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] mpathpersist: fix leaks
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Fri, 13 Sep 2019 17:19:14 +0000 (UTC)

On Fri, Sep 13, 2019 at 07:56:13AM +0000, Martin Wilck wrote:
> On Tue, 2019-09-10 at 17:39 -0500, Benjamin Marzinski wrote:
> > If handle_args() fails while looping through the argument list, it
> > needs
> > to free batch_fn, if it has been set. Also handle_args() needs to
> > make
> > sure to free the file descriptor after it has been opened.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  mpathpersist/main.c | 31 ++++++++++++++++++++-----------
> >  1 file changed, 20 insertions(+), 11 deletions(-)
> > 
> 
> 
> Looking at this code again, I wonder why we don't "goto out" in this
> code in the "else if (prin_flag)" case:
> 
> 		if (0 == num_prin_sa)
> 		{
> 			fprintf (stderr,
> 					" No service action given for Persistent Reserve IN\n");
> 			ret = MPATH_PR_SYNTAX_ERROR;
> 		}
> 		else if (num_prin_sa > 1)
> 		{
> 			fprintf (stderr, " Too many service actions given; choose "
> 					"one only\n");
> 			ret = MPATH_PR_SYNTAX_ERROR;
> 		}
> 
> At least in the first case, prin_sa would be -1, and trying to continue
> looks unhealthy. In the second case, the error message might be treated
> as a warning and the second prin action would override the first. I
> personally would think that it would be better to assume the user made
> a mistake, and do nothing, in this case as well.

I agree. I'll respin the patches with this included.

-Ben

> Anyway, that's not your patch's fault. So:
> 
> Reviewed-by: Martin Wilck <mwilck@suse.com>
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

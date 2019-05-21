Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 022EC2454C
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 03:03:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0E243082133;
	Tue, 21 May 2019 01:03:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 191F17A43C;
	Tue, 21 May 2019 01:03:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9ECF91806B14;
	Tue, 21 May 2019 01:02:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4L12i2f018288 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 21:02:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3AACA1001F41; Tue, 21 May 2019 01:02:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C236F1001E63;
	Tue, 21 May 2019 01:02:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4L12ede015340; 
	Mon, 20 May 2019 20:02:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4L12cJj015339;
	Mon, 20 May 2019 20:02:39 -0500
Date: Mon, 20 May 2019 20:02:38 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.de>
Message-ID: <20190521010238.GI3090@octiron.msp.redhat.com>
References: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
	<1558109650-21179-2-git-send-email-bmarzins@redhat.com>
	<a7b173c7139bd43fa950a85e39104b68f04ee101.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7b173c7139bd43fa950a85e39104b68f04ee101.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] libmultipath: handle clock_gettime
 failures in tur checker
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 21 May 2019 01:03:15 +0000 (UTC)

On Fri, May 17, 2019 at 11:55:48PM +0200, Martin Wilck wrote:
> On Fri, 2019-05-17 at 11:14 -0500, Benjamin Marzinski wrote:
> > If clock_gettime() fails, and multipathd can't figure out when it
> > should
> > time out, it should just default to assuming that it has already
> > timed
> > out. Found by coverity.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/checkers/tur.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> I know coverity picks on this, but I don't like the result. It's
> superfluous IMO, and uglifies the code. 
> 
> Other than passing an invalid address (unlikely because basically every
> caller uses memory from the stack), the only possible reason for
> failure in clock_gettime is "EINVAL - The clk_id specified is not
> supported on this system".
> 
> We have this code in pthread_cond_init_mono():
> 
> 	res = pthread_condattr_setclock(&attr, CLOCK_MONOTONIC);
> 	assert(res == 0);
> 
> this is called when initializing config_cond. So multipathd at least
> won't even start if CLOCK_MONOTONIC is unsupported.
> 
> If that's not enough, I don't mind putting such a check in
> mpath_lib_init() and refuse to start on systems without
> CLOCK_MONOTONIC, then stop bothering with the return value of
> clock_gettime() in the rest of the code.
> 
> Regards,
> Martin

I'm fine with dropping this one. We just have so many other checks for
the return on this call that I thought that there was possibly some
important error condition that the man page didn't mention.

I'll repost the set without it.

-Ben

> 
> 
> > diff --git a/libmultipath/checkers/tur.c
> > b/libmultipath/checkers/tur.c
> > index 6b08dbbb..717353ef 100644
> > --- a/libmultipath/checkers/tur.c
> > +++ b/libmultipath/checkers/tur.c
> > @@ -290,7 +290,12 @@ static void *tur_thread(void *ctx)
> >  
> >  static void tur_timeout(struct timespec *tsp)
> >  {
> > -	clock_gettime(CLOCK_MONOTONIC, tsp);
> > +	if (clock_gettime(CLOCK_MONOTONIC, tsp) != 0) {
> > +		/* can't get time. clear tsp to not wait */
> > +		tsp->tv_sec = 0;
> > +		tsp->tv_nsec = 0;
> > +		return;
> > +	}
> >  	tsp->tv_nsec += 1000 * 1000; /* 1 millisecond */
> >  	normalize_timespec(tsp);
> >  }
> > @@ -300,8 +305,12 @@ static void tur_set_async_timeout(struct checker
> > *c)
> >  	struct tur_checker_context *ct = c->context;
> >  	struct timespec now;
> >  
> > -	clock_gettime(CLOCK_MONOTONIC, &now);
> > -	ct->time = now.tv_sec + c->timeout;
> > +	if (clock_gettime(CLOCK_MONOTONIC, &now) != 0)
> > +		/* can't get time. clear time to always timeout on
> > +		 * next path check */
> > +		ct->time = 0;
> > +	else
> > +		ct->time = now.tv_sec + c->timeout;
> >  }
> >  
> >  static int tur_check_async_timeout(struct checker *c)
> > @@ -309,7 +318,9 @@ static int tur_check_async_timeout(struct checker
> > *c)
> >  	struct tur_checker_context *ct = c->context;
> >  	struct timespec now;
> >  
> > -	clock_gettime(CLOCK_MONOTONIC, &now);
> > +	if (clock_gettime(CLOCK_MONOTONIC, &now) != 0)
> > +		/* can't get time. assume we've timed out */
> > +		return 1;
> >  	return (now.tv_sec > ct->time);
> >  }
> >  
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

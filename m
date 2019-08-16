Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01890995
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 22:47:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94B01307D84D;
	Fri, 16 Aug 2019 20:47:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF6895C1D6;
	Fri, 16 Aug 2019 20:47:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4ECF124F30;
	Fri, 16 Aug 2019 20:47:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GKldZf010036 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 16:47:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 634764139; Fri, 16 Aug 2019 20:47:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8A317BBA;
	Fri, 16 Aug 2019 20:47:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7GKlZ0K009060; 
	Fri, 16 Aug 2019 15:47:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7GKlZJI009059;
	Fri, 16 Aug 2019 15:47:35 -0500
Date: Fri, 16 Aug 2019 15:47:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190816204734.GG25414@octiron.msp.redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-15-git-send-email-bmarzins@redhat.com>
	<af2c96e14df9aad64dbeded65e6e0c02c9ff45cf.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af2c96e14df9aad64dbeded65e6e0c02c9ff45cf.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 14/16] libmutipath: deprecate delay_*_checks
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 16 Aug 2019 20:47:54 +0000 (UTC)

On Wed, Aug 14, 2019 at 09:20:46PM +0000, Martin Wilck wrote:
> On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> > The delay_checks shaky paths detection method works the same way as
> > the
> > san_path_err method, but not as well, with less configurability, and
> > with the code spread all over check_path(). The only real difference
> > is
> > that marks the path as marginal for a certain number of path checks
> > instead of for a specific time. This patch deprecates the
> > delay_checks
> > method and maps it to the the san_path_err method.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/configure.c   | 17 +----------
> >  libmultipath/propsel.c     | 62 +++++++++++++++++++++++++++++-------
> 
> I suppose that quite a few users are working with "delay_*_checks" in
> production. If we remove the option, we should at least clearly
> document how to map existing delay_*_checks parameters to san_path_err*
> parameters.

Didn't I? My patch does include changes to the man page that tells how
it gets remapped.
 
> IIUC, to (roughly) imitate the settings
> 
>   delay_watch_checks = C
>   delay_wait_checks = W
> 
> I need to set
> 
>   san_path_err_threshold = 2
>   san_path_err_forget_rate = C
>   san_path_err_recovery_time = W
> 
> Correct? Or can it be done better?

Well, the code uses

san_path_err_threshold = 1 (since checks for a number of errors greater
			    than this threshold)
san_path_err_forget_rate = C
san_path_err_recovery_time = W * polling_interval


> (It's not exactly the same, as delay_watch_checks starts counting when
> a path is reinstated after a failure, while san_path_err_threshold
> counts good->bad transitions, and the threshold would be reached if a
> path fails more often than every C ticks _on average_).

> If the above is fine, we might as well map these settings in the code
> directly. IOW, instead of ignoring "delay_*_checks" altogether, we
> should ignore it only if either san_path_* or marginal_path_*
> parameters are set; Otherwise, we could simply map the delay_*_checks
> parameters as shown above.

Err.. This patch does do the remapping in code (in propsel.c) just as
you suggest..  right?

I'm confused here.
-Ben

> That would be a bit more user friendly in terms of backwards
> compatibility.
> 
> Regards
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

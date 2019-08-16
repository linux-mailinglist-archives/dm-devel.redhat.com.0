Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A552C909B7
	for <lists+dm-devel@lfdr.de>; Fri, 16 Aug 2019 22:54:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0554630833B0;
	Fri, 16 Aug 2019 20:54:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11FE15C1D6;
	Fri, 16 Aug 2019 20:54:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B20E61800202;
	Fri, 16 Aug 2019 20:54:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GKsJGJ010144 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 16:54:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34FE617CE2; Fri, 16 Aug 2019 20:54:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A4F8461F;
	Fri, 16 Aug 2019 20:54:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x7GKsEo5009075; 
	Fri, 16 Aug 2019 15:54:14 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x7GKsE6W009074;
	Fri, 16 Aug 2019 15:54:14 -0500
Date: Fri, 16 Aug 2019 15:54:13 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190816205413.GH25414@octiron.msp.redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-17-git-send-email-bmarzins@redhat.com>
	<d563722667ec1caba7a072b6df632844e64ea690.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d563722667ec1caba7a072b6df632844e64ea690.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 16/16] multipath: update man pages
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 16 Aug 2019 20:54:29 +0000 (UTC)

On Wed, Aug 14, 2019 at 09:21:32PM +0000, Martin Wilck wrote:
> On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> > Add documentation for the marginal_pathgroups option and the
> > (un)setmarginal commands.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  multipath/multipath.conf.5 | 34 ++++++++++++++++++++++++++++++----
> >  multipathd/multipathd.8    | 19 +++++++++++++++++++
> >  2 files changed, 49 insertions(+), 4 deletions(-)
> > 
> > --- a/multipathd/multipathd.8
> > +++ b/multipathd/multipathd.8
> > @@ -277,6 +277,25 @@ Remove the persistent reservation key associated
> > with $map from the
> >  \fIreservation_key\fR is set to \fBfile\fR in
> > \fI/etc/multipath.conf\fR.
> >  .
> >  .TP
> > +.B path $path setmarginal
> > +move $path to a marginal pathgroup. The path will remain in the
> > marginal
> > +path group until \fIunsetmarginal\fR is called. This command will
> > only
> > +work if \fImarginal_pathgroups\fR is enabled and there is no Shaky
> > paths
> > +detection method configured (see the multipath.conf man page for
> > details).
> 
> This is counter-intuitive. It's unclear to me why we need these
> commands at all. By nature of "shaky" paths, it doesn't make a lot of
> sense to make these settings (only) manually. I'd like it better if the
> cli commands somehow hooked into the different "shaky" algorithms. E.g.
> for the san_path_err_ algorithm, setting a path to marginal would mean
> artificially setting its failure count to a value above the configured
> threshold. That way, the manual settings could work togehter with the
> automatic detection methods, and could be used for overriding them
> in special cases.

I get that it's weird, but like I mentioned in PATCH 00/16,  The manual
control is for Broadcom's Fiber Channel Transport Daemon, since it
doesn't use the multipathd marginal path detectors, and thus will not
automatically reinstate marginal paths when all other paths have failed.

The way it works right now, the daemon is supposed to have control over
a path's marginal state, without users setting up a different marginal
path algorithm.  I do agree that it would make sense to have a
discussion about automatically restoring paths that have been externally
marked as marginal.

-Ben

> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

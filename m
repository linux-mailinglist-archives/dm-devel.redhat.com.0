Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AB93EC24E2
	for <lists+dm-devel@lfdr.de>; Mon, 30 Sep 2019 18:12:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57ADC3004E5B;
	Mon, 30 Sep 2019 16:12:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C258A60C5E;
	Mon, 30 Sep 2019 16:12:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC10C4EE68;
	Mon, 30 Sep 2019 16:12:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8UGC7Xa022285 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Sep 2019 12:12:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B6A15D6D0; Mon, 30 Sep 2019 16:12:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD4205D713;
	Mon, 30 Sep 2019 16:12:04 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8UGC3o1023836; 
	Mon, 30 Sep 2019 11:12:03 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8UGC2Ah023835;
	Mon, 30 Sep 2019 11:12:02 -0500
Date: Mon, 30 Sep 2019 11:12:02 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190930161202.GB25414@octiron.msp.redhat.com>
References: <1569266956-6339-1-git-send-email-bmarzins@redhat.com>
	<6af607515513ef1a39869aed35c15774046a1bda.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6af607515513ef1a39869aed35c15774046a1bda.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] multipathd: warn when configuration has been
	changed.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 30 Sep 2019 16:12:46 +0000 (UTC)

On Fri, Sep 27, 2019 at 03:59:05PM +0000, Martin Wilck wrote:
> On Mon, 2019-09-23 at 14:29 -0500, Benjamin Marzinski wrote:
> > It would be helpful if multipathd could log a message when
> > multipath.conf or files in the config_dir have been written to, both
> > so
> > that it can be used to send a notification to users, and to help with
> > determining after the fact if multipathd was running with an older
> > config, when the logs of multipathd's behaviour don't match with the
> > current multipath.conf.
> > 
> > To do this, the multipathd uxlsnr thread now sets up inotify watches
> > on
> > both /etc/multipath.conf and the config_dir to watch if the files are
> > deleted or closed after being opened for writing.  In order to keep
> > uxlsnr from polling repeatedly if the multipath.conf or the
> > config_dir
> > aren't present, it will only set up the watches once per reconfigure.
> > However, since multipath.conf is far more likely to be replaced by a
> > text editor than modified in place, if it gets removed, multipathd
> > will
> > immediately try to restart the watch on it (which will succeed if the
> > file was simply replaced by a new copy).  This does mean that if
> > multipath.conf or the config_dir are actually removed and then later
> > re-added, multipathd won't log any more messages for changes until
> > the
> > next reconfigure. But that seems like a fair trade-off to avoid
> > repeatedly polling for files that aren't likely to appear.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > ---
> >  libmultipath/config.h |   1 +
> >  multipathd/main.c     |   1 +
> >  multipathd/uxlsnr.c   | 134
> > ++++++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 130 insertions(+), 6 deletions(-)
> > 
> 
> So, next, after we get a notification, we wait a few seconds and call
> reconfigure() automatically? Well I guess before we do that we should
> implement a dry-run with a syntax check...

I'm not sure if multipathd should autoreconfigure.  Since multipath maps
can end up changing there, I think it still makes sense that it should
only happen when specifically requested by the user. But it would be
nice to see if a reconfigure should have happened in the logs, and users
are free to set up their own policies triggered off the message.
 
> I found one minor issue, see below. Otherwise, ACK.
> 
> Thanks,
> Martin
> 
> > +void handle_inotify(int fd, int  *wds)
> > +{
> > +	char buff[1024]
> > +		__attribute__ ((aligned(__alignof__(struct
> > inotify_event))));
> > +	const struct inotify_event *event;
> > +	ssize_t len;
> > +	char *ptr;
> > +	int i, got_notify = 0;
> > +
> > +	for (;;) {
> > +		len = read(fd, buff, sizeof(buff));
> > +		if (len <= 0) {
> > +			if (len < 0 && errno != EAGAIN) {
> > +				condlog(3, "error reading from
> > inotify_fd");
> > +				for (i = 0; i < 2; i++) {
> > +					if (wds[i] != -1) {
> > +						inotify_rm_watch(fd,
> > wds[0]);
> 
> Should this be wds[i] instead?

Oops. Thanks for catching that. I'll resend the patch

-Ben

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

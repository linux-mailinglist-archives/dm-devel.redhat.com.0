Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 69E6E213EA7
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 19:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593798071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VTd2yEOQ/IEPKVafQqZkM9KFkE5mxz4iVFNPREf9Pwg=;
	b=Yh0wZpYWOidaAWdIYLjOS9EVI1pWsLJee5TK9UcJJHE7HhIjPrVzaTwAdg6IbAyxEB000W
	j0B1ZENvSecx41QAnnOjNTBI+lte+D8UOELSt7ALD9Wa26JI5ZxMtnFDTkhHkHwupsNdoL
	x8ghr+tcbgrm60+9qNg62id0HWEIaCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-4s-kX6R3PsS0sSY52ut2iQ-1; Fri, 03 Jul 2020 13:41:07 -0400
X-MC-Unique: 4s-kX6R3PsS0sSY52ut2iQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 655AB2D5A;
	Fri,  3 Jul 2020 17:40:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 087B47BD5D;
	Fri,  3 Jul 2020 17:40:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F43B1809547;
	Fri,  3 Jul 2020 17:40:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063HeWEI003416 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 13:40:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2E471992F; Fri,  3 Jul 2020 17:40:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D4C519D7E;
	Fri,  3 Jul 2020 17:40:29 +0000 (UTC)
Date: Fri, 3 Jul 2020 12:39:09 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200703163909.GA7187@redhat.com>
References: <20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
	<5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
	<20200702031449.GB29962@octiron.msp.redhat.com>
	<8158d509bca2cae483d553defdd1eb378c16d813.camel@suse.com>
	<20200702151829.GA11089@octiron.msp.redhat.com>
	<cd568c7aabaa102db8ef6ba8ceb87b96d62f632c.camel@suse.com>
	<20200702194128.GG11089@octiron.msp.redhat.com>
	<be1e8d96543bc86a6a194bb9c708fba91878d9c9.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <be1e8d96543bc86a6a194bb9c708fba91878d9c9.camel@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jul 03 2020 at 11:12am -0400,
Martin Wilck <Martin.Wilck@suse.com> wrote:

> On Thu, 2020-07-02 at 14:41 -0500, Benjamin Marzinski wrote:
> > On Thu, Jul 02, 2020 at 04:45:21PM +0000, Martin Wilck wrote:
> > > 
> > > What's wrong with deferred remove? After all, the user explicitly
> > > asked
> > > for a flush. As long as some other process has the device open, it
> > > won't be removed. That's why I like the O_EXCL idea, which will
> > > allow
> > > small programs like blkid to access the device, but will cause all
> > > attempts to mount or add stacked devices to fail until the device
> > > is
> > > actually removed. I see no reason no to do this, as it's a race
> > > anyway
> > > if some other process opens the device when we're supposed to flush
> > > it
> > > and the opencount already dropped to 0. By using O_EXCL, we just
> > > increase multipathd's chances to win the race and do what the user
> > > asked for.
> > 
> > I'm not actually a fan of deferred remove in general. It leaves the
> > device in this weird state were it is there but no longer openable. 
> 
> Ok, I didn't expect that ;-)
> 
> AFAICS, devices in DEFERRED REMOVE state are actually still openable. I
> just tested this once more on a 5.3 kernel.
> 
> As long as the device is opened by some process and thus not removed,
> it can be opened by other processes, and is not deleted until the last
> opener closes it. It's even possible to create new device mapper layers
> like kpartx partitions on top of a DM device in DEFERRED REMOVE state.
> 
> > I
> > wish I had originally dealt with deferred removes by having
> > multipathd
> > occasionally try to flush devices with no paths, or possibly listen
> > for
> > notifications that the device has been closed, and flush then.
> > 
> > My specific objections here are that not all things that open a
> > device
> > for longer than an instant do so with O_EXCL.  So it's very possible
> > that you run "multipath -F", it returns having removed a number of
> > unused devices.  But some of the devices it didn't remove were opened
> > without O_EXCL, and they will stick around for a while, and then
> > suddenly disappear.  Even if they don't say around for that long,
> > this
> > is a can still effect scripts or other programs that are expecting to
> > check the device state immediately after calling multipath -F, and
> > having it not change a second or so later. So far multipath -f/-F
> > will
> > not return until it has removed all the removeable devices (and
> > waited
> > for them to be removed from udev). I think it should stay this way.
> 
> I see. That's a valid point. IMHO it'd be better if the kernel didn't
> allow any new access to devices in "deferred remove" state, and
> possibly sent a REMOVE uevent and hide the device immediately after the
> deferred remove ioctl. 
> 
> That would also be closer to how "lazy umount" (umount -l) behaves.
> But I'm certainly overlooking some subtle semantic issues. 
> 
> @Mike, Zdenek: perhaps you can explain why "deferred remove" behaves
> like this?

"deferred remove" was introduced with commits:

2c140a246dc dm: allow remove to be deferred
acfe0ad74d2 dm: allocate a special workqueue for deferred device removal

The feature was developed to cater to the docker "devicemapper" graph
driver [1][2] that uses DM thin provisioning in the backend (Red Hat's
openshift once used a docker that used thinp in production for thinp's
snapshot capabilities. overlayfs is now used instead because it allows
page cache sharing which results in the ability to support vastly more
containers that all are layered on snapshots of the same "device").

Anyway, back to deferred remove: docker's Go-lang based implementation
and storage graph driver interface were clumsily written to require this
lazy removal of used resources.  As such, we had to adapt and the result
was "deferred device" remove that really could be used by any DM device.

Docker couldn't have later opens fail due to a pending removal -- it'd
break their app.  So if you want it to do what you'd have imagined it to
be; we'll need to introduce a new flag that alters the behavior (maybe
as a module param off of DM core's dm-mod.ko).  Patches welcome -- but
you'll need a pretty good reason (not read back far enough but maybe
you have one?).

Thanks,
Mike

 
[1] https://docs.docker.com/storage/storagedriver/device-mapper-driver/
[2] https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html/managing_containers/managing_storage_with_docker_formatted_containers

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


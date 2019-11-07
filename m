Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A810FF38F4
	for <lists+dm-devel@lfdr.de>; Thu,  7 Nov 2019 20:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573156243;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ATOfv7RGg/9b8J1pbFdMY+yRATPcBuEcej9rCkfDhg8=;
	b=K4BLm026055OvHTBGFDoC+0uyjSdAQ9uBzSs/4mGz5QbPsucVdPla9B+DwohxDJGalIyBE
	QCmVqs1szj7iOLhomkvqyAYtS+3O/nDwDNkbqLrf7IV3fahHtfHAORsLaQ8+iL84Tniu78
	WKNj9Py9jNv9nwRIhIPJnRB1oXsC2HM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-U5JP3lvCOaW1BX7JlMfKQw-1; Thu, 07 Nov 2019 14:50:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A7A51005509;
	Thu,  7 Nov 2019 19:50:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 324395DA76;
	Thu,  7 Nov 2019 19:50:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB18418089C8;
	Thu,  7 Nov 2019 19:50:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7Jo75Y015228 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 14:50:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8E4B65DA7E; Thu,  7 Nov 2019 19:50:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09DE25DA76;
	Thu,  7 Nov 2019 19:50:01 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id xA7Jo1Hq020748; Thu, 7 Nov 2019 14:50:01 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id xA7Jo1r9020699; Thu, 7 Nov 2019 14:50:01 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 7 Nov 2019 14:50:01 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Maged Mokhtar <mmokhtar@petasan.org>
In-Reply-To: <cba8f93a-3477-9c87-0bff-fe7e6962d606@petasan.org>
Message-ID: <alpine.LRH.2.02.1911071448290.20334@file01.intranet.prod.int.rdu2.redhat.com>
References: <fa95f1f0-67d6-d02e-6999-ba1f90d70fe2@petasan.org>
	<8388b99a-a531-981e-9e36-8aeb3dffd18e@petasan.org>
	<20191106150831.GA27888@redhat.com>
	<5370f009-c324-1530-4400-adf1b59f0bbd@petasan.org>
	<20191107190958.GA2821@redhat.com>
	<cba8f93a-3477-9c87-0bff-fe7e6962d606@petasan.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] dm-writecache: change config parameters using
	messages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: U5JP3lvCOaW1BX7JlMfKQw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable



On Thu, 7 Nov 2019, Maged Mokhtar wrote:

>=20
>=20
> On 07/11/2019 21:09, Mike Snitzer wrote:
> > On Thu, Nov 07 2019 at  1:55pm -0500,
> > Maged Mokhtar <mmokhtar@petasan.org> wrote:
> >=20
> > >=20
> > >=20
> > > On 06/11/2019 17:08, Mike Snitzer wrote:
> > > > On Tue, Nov 05 2019 at  4:19pm -0500,
> > > > Maged Mokhtar <mmokhtar@petasan.org> wrote:
> > > >=20
> > > > > Gentle ping please.
> > > > >=20
> > > > > It could add flexibility in changing cache parameters after devic=
e
> > > > > creation.
> > > >=20
> > > > I'm inclined to _not_ take this type of change.
> > > >=20
> > > > Why isn't changing the config parameters via table reload viable fo=
r
> > > > you?
> > > >=20
> > >=20
> > >=20
> > > Hi Mike,
> > >=20
> > > Thank you for your response. The main issue is to enable setting
> > > some config parameters while the device is mounted and running and
> > > avoid calling target ctr() by sending parameter changes via
> > > messages. A similar setup was used in dm-cache.
> > >=20
> > > The reason is that tuning the write cache may require run time
> > > changes. If un-tuned we can observes periods of spikes and/or step
> > > like disk utilization on the slow device during writeback using
> > > iostat, and these spikes correspond to periods of increased client
> > > io latency. Utilization can be tuned by varying the number of active
> > > writeback jobs + the gap between high and low marks to achieve a
> > > smooth high utilization.  Such tuning is difficult to do when
> > > creating the cache device as it depends on the hardware and io
> > > workload. We are hoping to use some userspace monitoring and tuning
> > > tool to periodically adjust these values while the device is
> > > running.
> >=20
> > I think you're missing that any actively used DM device can be
> > suspended, table reloaded, resumed.  So the tuning at runtime is still
> > possible, it just requires more steps.
> >=20
> > And I'm saying that unless/until there is a better reason other than
> > "dm-cache allowed tuning via messages" I'm not interested in having
> > multiple methods for tuning dm-writecache.
> >=20
> > Mike
> >=20
> just for my understanding, does not table reload call _ctr() and
> re-initializes things like threads/read metadada ..?

Yes it does. But you don't have to unmount the filesystem when you reload=
=20
the table.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


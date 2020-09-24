Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 18FE3277670
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 18:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600964222;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tnXfBdrIaSwiiud/xJSynRyzRIOboQHzXv4JB4THo4U=;
	b=XwRbFr+j1PLNrGJNObrJXHuFGUb+NwATOMJaABOwjffFk4y6IaG4iQFga4xKVTGGGLyxTC
	w3dXEw0o1e/Y73hBBqjvyUSrWKJ2Dc0NC6d8lkHDuHWzH7zTybisE0gVBQD1TV1MJIvTO8
	n/LvC3HYWdKxXwooQyOpMPYkhREx5r0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-ImLWJCiBM1KrqW5X_qcC-w-1; Thu, 24 Sep 2020 12:16:49 -0400
X-MC-Unique: ImLWJCiBM1KrqW5X_qcC-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29562186DD35;
	Thu, 24 Sep 2020 16:16:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E33BA60C04;
	Thu, 24 Sep 2020 16:16:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A69F1826D2B;
	Thu, 24 Sep 2020 16:16:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGGSRY015257 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:16:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0BEAB55760; Thu, 24 Sep 2020 16:16:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2C455785;
	Thu, 24 Sep 2020 16:16:24 +0000 (UTC)
Date: Thu, 24 Sep 2020 12:16:24 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200924161624.GC14369@redhat.com>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-3-satyat@google.com>
	<20200922003255.GC32959@sol.localdomain>
	<20200924011438.GD10500@redhat.com>
	<20200924071721.GA1883346@google.com>
	<20200924134649.GB13849@redhat.com>
	<20200924154550.GA1266@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200924154550.GA1266@sol.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] dm: add support for passing through
 inline crypto support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24 2020 at 11:45am -0400,
Eric Biggers <ebiggers@kernel.org> wrote:

> On Thu, Sep 24, 2020 at 09:46:49AM -0400, Mike Snitzer wrote:
> > > > Can you help me better understand the expected consumer of this code?
> > > > If you have something _real_ please be explicit.  It makes justifying
> > > > supporting niche code like this more tolerable.
> > >
> > > So the motivation for this code was that Android currently uses a device
> > > mapper target on top of a phone's disk for user data. On many phones,
> > > that disk has inline encryption support, and it'd be great to be able to
> > > make use of that. The DM device configuration isn't changed at runtime.
> > 
> > OK, which device mapper target is used?
> 
> There are several device-mapper targets that Android can require for the
> "userdata" partition -- potentially in a stack of more than one:
> 
> dm-linear: required for Dynamic System Updates
> (https://developer.android.com/topic/dsu)
> 
> dm-bow: required for User Data Checkpoints on ext4
> (https://source.android.com/devices/tech/ota/user-data-checkpoint)
> (https://patchwork.kernel.org/patch/10838743/)
> 
> dm-default-key: required for metadata encryption
> (https://source.android.com/security/encryption/metadata)

Please work with all google stakeholders to post the latest code for the
dm-bow and dm-default-key targets and I'll work through them.

I think the more code we have to inform DM core's implementation the
better off we'll be in the long run.  Could also help improve these
targets as a side-effect of additional review.

I know I largely ignored dm-bow before but that was more to do with
competing tasks, etc.  I'll try my best...

> We're already carrying this patchset in the Android common kernels since late
> last year, as it's required for inline encryption to work when any of the above
> is used.  So this is something that is needed and is already being used.
> 
> Now, you don't have to "count" dm-bow and dm-default-key since they aren't
> upstream; that leaves dm-linear.  But hopefully the others at least show that
> architecturally, dm-linear is just the initial use case, and this patchset also
> makes it easy to pass through inline crypto on any other target that can support
> it (basically, anything that doesn't change the data itself as it goes through).

Sure, that context really helps.

About "basically, anything that doesn't change the data itself as it
goes through": could you be a bit more precise?  Very few DM targets
actually change the data as associated bios are remapped.

I'm just wondering if your definition of "doesn't change the data"
includes things more subtle than the data itself?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


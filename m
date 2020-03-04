Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CBC491798EE
	for <lists+dm-devel@lfdr.de>; Wed,  4 Mar 2020 20:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583349844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1VwqVjNcObXigBZU+Xyly6TjowhKkiiFq0BJeha6IKY=;
	b=JvTlshrYMrkQu1wq8t/W3AwC2xrk28V2jgwXBJPbm7ofqqmP4GuaiX+foLc9ZXaPHudPds
	cvEABkoaNI2vtB6TS8yT0AR38p2+pMf3AjZ9bXsW/vrP10ffR093pcBJT5yTVHUPVD6hIG
	bEnLNrcATYRRGlh3ZsdrbHnCsZ/uJVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-8VMnebYhPCmFEyyjePdTfw-1; Wed, 04 Mar 2020 14:24:00 -0500
X-MC-Unique: 8VMnebYhPCmFEyyjePdTfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4685C13E4;
	Wed,  4 Mar 2020 19:23:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 258505DA76;
	Wed,  4 Mar 2020 19:23:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C704886A04;
	Wed,  4 Mar 2020 19:23:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 024JNd5U004332 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Mar 2020 14:23:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B56F990CD6; Wed,  4 Mar 2020 19:23:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A8F91D68;
	Wed,  4 Mar 2020 19:23:36 +0000 (UTC)
Date: Wed, 4 Mar 2020 14:23:35 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200304192335.GA24296@redhat.com>
References: <20200304150257.GA19885@redhat.com>
	<CAHk-=wgP=q648JXn8Hd9q7DuNaOEpLmxQp2W3RO3vkaD2CS_9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgP=q648JXn8Hd9q7DuNaOEpLmxQp2W3RO3vkaD2CS_9g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Theodore Ts'o <tytso@mit.edu>, linux-block <linux-block@vger.kernel.org>,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Hou Tao <houtao1@huawei.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.6-rc5
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Mar 04 2020 at  2:06pm -0500,
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, Mar 4, 2020 at 9:03 AM Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > - Bump the minor version for DM core and all target versions that have
> >   seen interface changes or important fixes during the 5.6 cycle.
> 
> Can we please remove these pointless version markers entirely?
> 
> They make no sense. The kernel doesn't allow backwards incompatible
> changes anyway, so the whole point of using some kind of interface
> versioning is entirely bogus.
> 
> The way you test if a new feature exists or not is to just use it, and
> if you're running on an old kernel that doesn't support that
> operation, then it should return an error.

These versions are for userspace's benefit (be it lvm2, cryptsetup,
multipath-tools, etc).  But yes, these versions are bogus even for
that -- primarily because it requires userspace to know when a
particular feature/fix it cares about was introduced.  In addition: if
fixes, that also bump version, are marked for stable@ then we're quickly
in versioning hell -- which is why I always try to decouple version
bumps from fixes.

Others have suggested setting feature flags.  I expect you'd hate those
too.  I suspect I quickly would too given flag bits are finite and
really tedious to deal with.

I'll think further about this issue and consult with userspace
developers and see what we might do.

Thanks (for the needed kick in the ass).
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


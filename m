Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B28171AFA73
	for <lists+dm-devel@lfdr.de>; Sun, 19 Apr 2020 15:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587302397;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dZ8Ag1Dy/Cc6tfxozFwUre5YKDM3UnZ14Vj580r9yFo=;
	b=AzacYNWvBhPDB5iL+E/X3oL+YuOMlTz+rgDCeOOKRx+b7lc2kVZRpFGl2upWctkNw+3r9U
	3vgwSIujfO5Aya/esArDupNlHuHtiEVnrsqMMNOXmUx/Ua7kVws9xdjlexvaJrtf/xsijG
	Oj9OQ656m4mA8eSVvMzxsU/bl5/+4Tw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-pgyf1PXVMbC3hhkX4aTIQw-1; Sun, 19 Apr 2020 09:19:54 -0400
X-MC-Unique: pgyf1PXVMbC3hhkX4aTIQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C74DB20;
	Sun, 19 Apr 2020 13:19:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AC0F5D9CA;
	Sun, 19 Apr 2020 13:19:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7335E9350B;
	Sun, 19 Apr 2020 13:19:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03JDJD2b029291 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Apr 2020 09:19:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09DE910027C3; Sun, 19 Apr 2020 13:19:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A9D210027AD;
	Sun, 19 Apr 2020 13:19:10 +0000 (UTC)
Date: Sun, 19 Apr 2020 09:19:09 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Paul Wise <pabs3@bonedaddy.net>
Message-ID: <20200419131908.GA22398@redhat.com>
References: <20200419073026.197967-1-pabs3@bonedaddy.net>
MIME-Version: 1.0
In-Reply-To: <20200419073026.197967-1-pabs3@bonedaddy.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/3] dm raid/raid1: enable discard support
 when any devices support discard
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

On Sun, Apr 19 2020 at  3:30am -0400,
Paul Wise <pabs3@bonedaddy.net> wrote:

> This makes dm raid and dm raid1 (mirroring) consistent with md raid,
> which supports discard when only some of the devices support discard.
> 
> Another patch will be needed to fix the queue discard limits sysfs files,
> fixing `fstrim --fstab`, but these patches suffice to fix `fstrim /` and
> I haven't finished figuring out how the queue discard limits are set yet.
> 
> Paul Wise (3):
>   dm: add support for targets that allow discard when one device does
>   dm raid: only check for RAID 4/5/6 once during discard support setup
>   dm raid/raid1: enable discard support when any devices support discard
> 
>  drivers/md/dm-cache-target.c  |  2 +-
>  drivers/md/dm-clone-target.c  |  2 +-
>  drivers/md/dm-log-writes.c    |  2 +-
>  drivers/md/dm-raid.c          | 21 ++++++++++-----------
>  drivers/md/dm-raid1.c         |  1 +
>  drivers/md/dm-table.c         | 32 +++++++++++++++++++++-----------
>  drivers/md/dm-thin.c          |  8 ++++----
>  drivers/md/dm-zoned-target.c  |  2 +-
>  include/linux/device-mapper.h | 13 ++++++++-----
>  include/uapi/linux/dm-ioctl.h |  4 ++--
>  10 files changed, 50 insertions(+), 37 deletions(-)

You went overboard with implementation before checking to see if your
work would be well received.  Your 2/3 patch header shows you're
capable of analyzing past commits to explain the evolution of code,
etc.  But yet you make no mention of this commit header which explicitly
speaks to why what you're proposing is _not_ acceptable:

commit 8a74d29d541cd86569139c6f3f44b2d210458071
Author: Mike Snitzer <snitzer@redhat.com>
Date:   Tue Nov 14 15:40:52 2017 -0500

    dm: discard support requires all targets in a table support discards

    A DM device with a mix of discard capabilities (due to some underlying
    devices not having discard support) _should_ just return -EOPNOTSUPP for
    the region of the device that doesn't support discards (even if only by
    way of the underlying driver formally not supporting discards).  BUT,
    that does ask the underlying driver to handle something that it never
    advertised support for.  In doing so we're exposing users to the
    potential for a underlying disk driver hanging if/when a discard is
    issued a the device that is incapable and never claimed to support
    discards.

    Fix this by requiring that each DM target in a DM table provide discard
    support as a prereq for a DM device to advertise support for discards.

    This may cause some configurations that were happily supporting discards
    (even in the face of a mix of discard support) to stop supporting
    discards -- but the risk of users hitting driver hangs, and forced
    reboots, outweighs supporting those fringe mixed discard
    configurations.

    Cc: stable@vger.kernel.org
    Signed-off-by: Mike Snitzer <snitzer@redhat.com>

I haven't looked closely at MD raid in this area but if you trully think
underlying MD raid can cope with issuing discards to devices that don't
support them (or that it avoids issuing them?) then please update
dm-raid.c to conditionally set ti->discard_supported (if not all devices
support discard).  That is how to inform DM core that the target knows
better and it will manage discards issued to it.  It keeps the change
local to dm-raid.c without the flag-day you're proposing.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


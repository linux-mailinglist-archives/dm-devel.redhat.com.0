Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7F8CB172
	for <lists+dm-devel@lfdr.de>; Thu,  3 Oct 2019 23:46:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 387E981F0C;
	Thu,  3 Oct 2019 21:46:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F095D9DC;
	Thu,  3 Oct 2019 21:46:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9FE3D4A486;
	Thu,  3 Oct 2019 21:46:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x93LiP69013453 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Oct 2019 17:44:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D79160C18; Thu,  3 Oct 2019 21:44:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF82260BE1;
	Thu,  3 Oct 2019 21:44:22 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x93LiL9E023587; 
	Thu, 3 Oct 2019 16:44:21 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x93LiKnn023586;
	Thu, 3 Oct 2019 16:44:20 -0500
Date: Thu, 3 Oct 2019 16:44:20 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <20191003214420.GE25414@octiron.msp.redhat.com>
References: <e2b955d0-69ea-2c2b-9f0f-ccf3b5f369d0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2b955d0-69ea-2c2b-9f0f-ccf3b5f369d0@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>, Martin Wilck <mwilck@suse.com>
Subject: Re: [dm-devel] multipath-tools: RH-patches for upstream ???
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 03 Oct 2019 21:46:46 +0000 (UTC)

On Thu, Oct 03, 2019 at 08:28:06PM +0200, Xose Vazquez Perez wrote:
> Hi Benjamin,
> 
> 
> Is there any relevant RH-patch for upstream in fedora repo:
> https://src.fedoraproject.org/rpms/device-mapper-multipath/ ???
> 
> Maybe:
> 
> - https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0022-RH-Remove-the-property-blacklist-exception-builtin.patch
> 
>    Subject: [PATCH] RH: Remove the property blacklist exception builtin
> 
>     Multipath set the default property blacklist exceptions to	
>     (ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some internal
>     devices.  These devices may never have multiple paths, but it is nice
>     to be able to set multipath up on them all the same.  This patch simply
>     removes the default, and makes it so that if no property
>     blacklist_exception is given, then devices aren't failed for not matching
>     it.

Redhat doesn't include the udev rules file that sets ID_SCSI_VPD, so
there are some rare cases where this property blacklists valid devices.
Thus, it's easier for us to simply include this property line in the
default multipath.conf, and let users remove it if necessary. I would be
fine with this being included upstream, but I suspect it would mess with
other ditsros which are currently assuming that it is there.

> 
> 
> - https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch
> 
>    Subject: [PATCH] RH: add wwids from kernel cmdline mpath.wwids with -A
> 
>     This patch adds another option to multipath, "-A", which reads
>     /proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids it finds
>     to /etc/multipath/wwids.  While this isn't usually important during
>     normal operation, since these wwids should already be added, it can be
>     helpful during installation, to make sure that multipath can claim
>     devices as its own, before LVM or something else makes use of them.  The
>     patch also execs "/sbin/multipath -A" before running multipathd in
>     multipathd.service
> 

I posted this upstream and Hannes NAKed it a while back. We still find
it useful, since the default multipath.conf file for Redhat sets
find_multipaths to yes. You can currently avoid the race that this is
fixing by setting find_multipaths to smart, but there were objections to
using that as a default in Redhat. However, I never really understood
the objection to this patch, and I'd be fine with re-posting it.

> - https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0027-RH-warn-on-invalid-regex-instead-of-failing.patch
> 
>    Subject: [PATCH] RH: warn on invalid regex instead of failing
> 
>     multipath.conf used to allow "*" as a match everything regular expression,
>     instead of requiring ".*". Instead of erroring when the old style
>     regular expressions are used, it should print a warning and convert
>     them.

When multipath used its old regex code, "*" worked to match everything.
This patch just exists to make sure that customers didn't need to change
their configs when the regex code changed. Since it's been there posting
warning messages for a while, I plan to eventually drop it entirely, and
let anyone who has been ignoring the warning messages for years finally
have their config error. I see no reason to add it back to the upstream
code now.
 
> 
> - https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0028-RH-reset-default-find_mutipaths-value-to-off.patch
> 
>    Subject: [PATCH] RH: reset default find_mutipaths value to off
> 
>     Upstream has changed to default find_multipaths to "strict". For now
>     Redhat will retain the previous default of "off".

This is simply to retain the previous default behavior, for much the
same reason as the above patch. I see no reason to change this upstream.

> 
> - https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0029-RH-Fix-nvme-compilation-warning.patch
> 
>    Subject: [PATCH] RH: Fix nvme compilation warning
>

I assume that other people aren't seeing these compilation warnings, and
this it due to different options that redhat uses when compiling.  I
really should push this patch upstream, but that upstream isn't
multipath-tools, its nvme-cli, where we copied this file from. Once it's
changed there, we can pull the updated files back to multipath-tools.
 
>
> - https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0030-RH-attempt-to-get-ANA-info-via-sysfs-first.patch
> 
>    Subject: [PATCH] RH: attempt to get ANA info via sysfs first
> 
>     When the ANA prioritizer is run, first see if the "ana_state" sysfs file
>     exists, and if it does, try to read the state from there. If that fails,
>     fallback to using an ioctl.
> 

This won't do anything upstream. This requires a redhat specific kernel
patch that wasn't accepted in the upstream nvme kernel code.  It really
doesn't make much of a difference. It just makes multipath try to grab
ANA state info from sysfs, before failing back to the same ioctl that
upstream uses.

- Ben

> Thank you.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

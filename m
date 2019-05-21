Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDE125A3D
	for <lists+dm-devel@lfdr.de>; Wed, 22 May 2019 00:10:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CF983082A28;
	Tue, 21 May 2019 22:10:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C48F608C2;
	Tue, 21 May 2019 22:10:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD9E819725;
	Tue, 21 May 2019 22:10:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LM7dri000801 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 18:07:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 547546012E; Tue, 21 May 2019 22:07:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 235D6600C6;
	Tue, 21 May 2019 22:07:37 +0000 (UTC)
Date: Tue, 21 May 2019 18:07:36 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hans van Kranenburg <hans@knorrie.org>
Message-ID: <20190521220736.GB30736@redhat.com>
References: <5D8A23C5-B6AD-48EA-B0AD-AD1BD1A2B97B@gmail.com>
	<9d19e5b1-b76f-27da-fa4a-f3a83e6e2791@gmail.com>
	<2a12ef24-ab21-a9bb-af40-3743d0b8e2c7@knorrie.org>
	<33d155ac-9b09-c8b0-3df1-88063dac964f@knorrie.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33d155ac-9b09-c8b0-3df1-88063dac964f@knorrie.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-crypt@saout.de, device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>, Milan Broz <gmazyland@gmail.com>,
	Victor Helmholtz <victor.helmholtz@gmail.com>
Subject: Re: [dm-devel] Dm-integrity freeze
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 21 May 2019 22:10:43 +0000 (UTC)

On Tue, May 21 2019 at  4:33pm -0400,
Hans van Kranenburg <hans@knorrie.org> wrote:

> Hi,
> 
> On 5/21/19 10:43 AM, Hans van Kranenburg wrote:
> > Hi,
> > 
> > I'm seeing the same lockup, also 4.19. This is mdadm RAID10 on top of 4x
> > a partition with only dm-integrity.
> > 
> > It just happened out of the blue, no heavy load or anything. All IO to
> > it is frozen now.
> > 
> > [...]
> 
> There it is again... dmesg dump below. All cpus on 100% iowait.
> 
> It's triggered after a few minutes by running some Windows 2019 server
> install (ugh, don't ask) in a Xen HVM domU, which writes into a raw
> sparse file on a btrfs filesystem on LVM on mdadm RAID10 on 4x
> dm-integrity (wheeee!!)...
> 
> This morning it was triggered a few minutes after starting an old
> windows 2008 server image that I copied to this machine.
> 
> When running only other Linux vms, and when copying data onto
> filesystems that live in LVM logical volumes I haven't seen this problem
> yet, at all, in the last few weeks that this machine is running.
> 
> I noticed there's a "dm integrity: fix deadlock with overlapping I/O"
> fix in a later 4.19. Is there any chance this is related? I have no
> idea, but any hints or suggestions about what to try would be appreciated.

Yes, all your hung tasks are hung in wait_and_add_new_range().

Please use that later 4.19 or apply commit 4ed319c6ac08 ("dm integrity:
fix deadlock with overlapping I/O")

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

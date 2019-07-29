Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7037A2A0
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8075830C135E;
	Tue, 30 Jul 2019 07:55:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E64C310016EB;
	Tue, 30 Jul 2019 07:55:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CCF71972E;
	Tue, 30 Jul 2019 07:55:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TKb3QL029365 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 16:37:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60ADB600F8; Mon, 29 Jul 2019 20:37:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A68C60466
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:37:00 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED1043091753
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:36:57 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
	by len.romanrm.net (Postfix) with SMTP id 04387202D3;
	Mon, 29 Jul 2019 20:36:55 +0000 (UTC)
Date: Tue, 30 Jul 2019 01:36:55 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Message-ID: <20190730013655.229020ea@natsu>
In-Reply-To: <053c88e1-06ec-0db1-de8f-68f63a3a1305@canonical.com>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<20190730011850.2f19e140@natsu>
	<053c88e1-06ec-0db1-de8f-68f63a3a1305@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 29 Jul 2019 20:36:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 29 Jul 2019 20:36:58 +0000 (UTC) for IP:'91.121.75.85'
	DOMAIN:'len.romanrm.net' HELO:'len.romanrm.net'
	FROM:'rm@romanrm.net' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 91.121.75.85 len.romanrm.net 91.121.75.85
	len.romanrm.net <rm@romanrm.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 03:55:28 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
 block device is gone
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 30 Jul 2019 07:55:51 +0000 (UTC)

On Mon, 29 Jul 2019 17:27:15 -0300
"Guilherme G. Piccoli" <gpiccoli@canonical.com> wrote:

> Hi Roman, I don't think this is usual setup. I understand that there are
> RAID10 (also known as RAID 0+1) in which we can have like 4 devices, and
> they pair in 2 sets of two disks using stripping, then these sets are
> paired using mirroring. This is handled by raid10 driver however, so it
> won't suffer for this issue.
> 
> I don't think it's common or even makes sense to back a raid1 with 2
> pure raid0 devices.

It might be not a usual setup, but it is a nice possibility that you get with
MD. If for the moment you don't have drives of the needed size, but have
smaller drives. E.g.:

- had a 2x1TB RAID1;
- one disk fails;
- no 1TB disks at hand;
- but lots of 500GB disks;
- let's make a 2x500GB RAID0 and have that stand in for the missing 1TB
member for the time being;

Or here's for a detailed rationale of a more permanent scenario:
https://louwrentius.com/building-a-raid-6-array-of-mixed-drives.html

-- 
With respect,
Roman

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

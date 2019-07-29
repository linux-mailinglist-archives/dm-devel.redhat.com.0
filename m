Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D467A2A7
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 430B47FDF4;
	Tue, 30 Jul 2019 07:55:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17FB860BF7;
	Tue, 30 Jul 2019 07:55:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0360180BA9B;
	Tue, 30 Jul 2019 07:55:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TLEpGR004268 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 17:14:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D927110013A7; Mon, 29 Jul 2019 21:14:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D35A610016EA
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 21:14:49 +0000 (UTC)
Received: from mail.thelounge.net (mail.thelounge.net [91.118.73.15])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 648D281129
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 21:14:47 +0000 (UTC)
Received: from srv-rhsoft.rhsoft.net (Authenticated sender:
	h.reindl@thelounge.net) by mail.thelounge.net (THELOUNGE MTA)
	with ESMTPSA id 45yCBB733yzXPv; 
	Mon, 29 Jul 2019 23:14:37 +0200 (CEST)
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
	Roman Mamedov <rm@romanrm.net>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<20190730011850.2f19e140@natsu>
	<053c88e1-06ec-0db1-de8f-68f63a3a1305@canonical.com>
From: Reindl Harald <h.reindl@thelounge.net>
Openpgp: id=9D2B46CDBC140A36753AE4D733174D5A5892B7B8;
	url=https://arrakis-tls.thelounge.net/gpg/h.reindl_thelounge.net.pub.txt
Organization: the lounge interactive design
Message-ID: <01a849c9-0b9c-2ba7-f866-c92e7ebac1d5@thelounge.net>
Date: Mon, 29 Jul 2019 23:14:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <053c88e1-06ec-0db1-de8f-68f63a3a1305@canonical.com>
Content-Language: de-CH
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Mon, 29 Jul 2019 21:14:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Mon, 29 Jul 2019 21:14:47 +0000 (UTC) for IP:'91.118.73.15'
	DOMAIN:'mail.thelounge.net' HELO:'mail.thelounge.net'
	FROM:'h.reindl@thelounge.net' RCPT:''
X-RedHat-Spam-Score: -0.701  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS, SPF_PASS,
	UNPARSEABLE_RELAY) 91.118.73.15 mail.thelounge.net
	91.118.73.15 mail.thelounge.net <h.reindl@thelounge.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 30 Jul 2019 07:55:57 +0000 (UTC)



Am 29.07.19 um 22:27 schrieb Guilherme G. Piccoli:
>> If that's correct, then this seems to be a critical weak point in cases when
>> we have a RAID0 as a member device in RAID1/5/6/10 arrays.
> 
> Hi Roman, I don't think this is usual setup. I understand that there are
> RAID10 (also known as RAID 0+1) in which we can have like 4 devices, and
> they pair in 2 sets of two disks using stripping, then these sets are
> paired using mirroring. This is handled by raid10 driver however, so it
> won't suffer for this issue.
> 
> I don't think it's common or even makes sense to back a raid1 with 2
> pure raid0 devices.
if i would have been aware that RAID10 don't support "--write-mostly" to
make a hybrid HDD/SSD RAID (https://www.tansi.org/hybrid/) i would
likely have done exactly that to buy only 2 instead 4 x 2 TB SSD disks
here and frankly i have another 5 machines where this limitation of
RAID110 on linux sucks

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

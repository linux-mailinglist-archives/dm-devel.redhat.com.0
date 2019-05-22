Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A01B25ED8
	for <lists+dm-devel@lfdr.de>; Wed, 22 May 2019 09:54:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4CFC3082B22;
	Wed, 22 May 2019 07:54:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 201035ED20;
	Wed, 22 May 2019 07:53:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3688C5B423;
	Wed, 22 May 2019 07:53:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4M7qfuB004136 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 03:52:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7CCEE1001E6F; Wed, 22 May 2019 07:52:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F36610027BC;
	Wed, 22 May 2019 07:52:37 +0000 (UTC)
Received: from syrinx.knorrie.org (syrinx.knorrie.org [82.94.188.77])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE5973079B81;
	Wed, 22 May 2019 07:52:27 +0000 (UTC)
Received: from [IPv6:2001:980:4a41:fb::12] (unknown
	[IPv6:2001:980:4a41:fb::12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by syrinx.knorrie.org (Postfix) with ESMTPSA id D6CA14674ABEF;
	Wed, 22 May 2019 09:52:25 +0200 (CEST)
To: Mike Snitzer <snitzer@redhat.com>
References: <5D8A23C5-B6AD-48EA-B0AD-AD1BD1A2B97B@gmail.com>
	<9d19e5b1-b76f-27da-fa4a-f3a83e6e2791@gmail.com>
	<2a12ef24-ab21-a9bb-af40-3743d0b8e2c7@knorrie.org>
	<33d155ac-9b09-c8b0-3df1-88063dac964f@knorrie.org>
	<20190521220736.GB30736@redhat.com>
From: Hans van Kranenburg <hans@knorrie.org>
Message-ID: <ad69eefc-4237-e610-603a-1053d39f0a10@knorrie.org>
Date: Wed, 22 May 2019 09:52:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521220736.GB30736@redhat.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Wed, 22 May 2019 07:52:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Wed, 22 May 2019 07:52:31 +0000 (UTC) for IP:'82.94.188.77'
	DOMAIN:'syrinx.knorrie.org' HELO:'syrinx.knorrie.org'
	FROM:'hans@knorrie.org' RCPT:''
X-RedHat-Spam-Score: -0.008  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 82.94.188.77 syrinx.knorrie.org 82.94.188.77
	syrinx.knorrie.org <hans@knorrie.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 22 May 2019 07:54:27 +0000 (UTC)

On 5/22/19 12:07 AM, Mike Snitzer wrote:
> On Tue, May 21 2019 at  4:33pm -0400,
> Hans van Kranenburg <hans@knorrie.org> wrote:
> 
>> Hi,
>>
>> On 5/21/19 10:43 AM, Hans van Kranenburg wrote:
>>> Hi,
>>>
>>> I'm seeing the same lockup, also 4.19. This is mdadm RAID10 on top of 4x
>>> a partition with only dm-integrity.
>>>
>>> It just happened out of the blue, no heavy load or anything. All IO to
>>> it is frozen now.
>>>
>>> [...]
>>
>> There it is again... dmesg dump below. All cpus on 100% iowait.
>>
>> It's triggered after a few minutes by running some Windows 2019 server
>> install (ugh, don't ask) in a Xen HVM domU, which writes into a raw
>> sparse file on a btrfs filesystem on LVM on mdadm RAID10 on 4x
>> dm-integrity (wheeee!!)...
>>
>> This morning it was triggered a few minutes after starting an old
>> windows 2008 server image that I copied to this machine.
>>
>> When running only other Linux vms, and when copying data onto
>> filesystems that live in LVM logical volumes I haven't seen this problem
>> yet, at all, in the last few weeks that this machine is running.
>>
>> I noticed there's a "dm integrity: fix deadlock with overlapping I/O"
>> fix in a later 4.19. Is there any chance this is related? I have no
>> idea, but any hints or suggestions about what to try would be appreciated.
> 
> Yes, all your hung tasks are hung in wait_and_add_new_range().
> 
> Please use that later 4.19 or apply commit 4ed319c6ac08 ("dm integrity:
> fix deadlock with overlapping I/O")

Oh, silly me, that one is in 4.19.35 and I already have 4.9.37 based on
Debian in my repo, just rebooted the machine into it. Let's see what
happens today.

Thanks for confirming, sorry for the noise.

Hans

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

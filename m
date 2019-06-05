Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE5E358B0
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 10:37:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA26E3107B05;
	Wed,  5 Jun 2019 08:37:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827A360A35;
	Wed,  5 Jun 2019 08:37:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DDFF1806B0F;
	Wed,  5 Jun 2019 08:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x558a0RE031763 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Jun 2019 04:36:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D23C51B468; Wed,  5 Jun 2019 08:36:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.43.17.112] (unknown [10.43.17.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFD045F7C2;
	Wed,  5 Jun 2019 08:35:50 +0000 (UTC)
To: Stephen Boyd <swboyd@chromium.org>,
	Helen Koike <helen.koike@collabora.com>, dm-devel@redhat.com
References: <20190221203334.24504-1-helen.koike@collabora.com>
	<5cf5a724.1c69fb81.1e8f0.08fb@mx.google.com>
	<d6b4fb26-9a1b-0acd-ce4a-e48322a17e7d@collabora.com>
	<5cf6c7e6.1c69fb81.e1551.8ac4@mx.google.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Organization: Red Hat
Message-ID: <c5eae05c-f209-8578-f7fd-cd2feabb309c@redhat.com>
Date: Wed, 5 Jun 2019 10:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5cf6c7e6.1c69fb81.e1551.8ac4@mx.google.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com,
	linux-doc@vger.kernel.org, richard.weinberger@gmail.com,
	linux-kernel@vger.kernel.org, linux-lvm@redhat.com,
	enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v12] dm: add support to directly boot to a
 mapped device
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 05 Jun 2019 08:37:30 +0000 (UTC)

Dne 04. 06. 19 v 21:35 Stephen Boyd napsal(a):
> Quoting Helen Koike (2019-06-04 10:38:59)
>> On 6/3/19 8:02 PM, Stephen Boyd wrote:
>>>
>>> I'm trying to boot a mainline linux kernel on a chromeos device with dm
>>> verity and a USB stick but it's not working for me even with this patch.
>>> I've had to hack around two problems:
>>>
>>>   1) rootwait isn't considered
>>>
>>>   2) verity doesn't seem to accept UUID for <hash_dev> or <dev>
>>>
>>> For the first problem, it happens every boot for me because I'm trying
>>> to boot off of a USB stick and it's behind a hub that takes a few
>>> seconds to enumerate. If I hack up the code to call dm_init_init() after
>>> the 'rootdelay' cmdline parameter is used then I can make this work. It
>>> would be much nicer if the whole mechanism didn't use a late initcall
>>> though. If it used a hook from prepare_namespace() and then looped
>>> waiting for devices to create when rootwait was specified it would work.
>>
>> The patch was implemented with late initcall partially to be contained
>> in drivers/md/*, but to support rootwait, adding a hook from
>> prepare_namespace seems the way to go indeed.
> 
> Alright, great.
> 
>>
>>>
>>> The second problem is that in chromeos we have the bootloader fill out
>>> the UUID of the kernel partition (%U) and then we have another parameter
>>> that indicates the offset from that kernel partition to add to the
>>> kernel partition (typically 1, i.e. PARTNROFF=1) to find the root
>>> filesystem partition. The way verity seems to work here is that we need
>>> to specify a path like /dev/sda3 or the major:minor number of the device


Hi

As not a direct dm developer - isn't this going a bit too far ? -
This way you will need to soon move halve of the userspace functionality into 
kernel space.

IMHO would be way more progressive to start using initramdisk and let 
userspace resolve all the issue.

Clearly once you start to wait for some 'devices' to appear - then you will 
need to way for CORRECT device as well - since sda,sdb... goes in random 
order, so you would need to parse disk headers and so on.

What you are effectively doing at this moment is you are shifting/ballooning 
'ramdisk' code into kernel image - just to be named a kernel.

So why it is so big deal to start to use ramdisk on ChromeOS?
That would have solved most of problems you have or you will have instantly.

Regards

Zdenek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

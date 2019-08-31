Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4900EA43D7
	for <lists+dm-devel@lfdr.de>; Sat, 31 Aug 2019 11:56:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EA6318F351F;
	Sat, 31 Aug 2019 09:56:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45C025D6A3;
	Sat, 31 Aug 2019 09:56:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AD2C3CBF;
	Sat, 31 Aug 2019 09:56:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7V9tvsO020694 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 31 Aug 2019 05:55:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94F7B1001938; Sat, 31 Aug 2019 09:55:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 902281001925
	for <dm-devel@redhat.com>; Sat, 31 Aug 2019 09:55:55 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7339918C426C
	for <dm-devel@redhat.com>; Sat, 31 Aug 2019 09:55:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n2so8451654wmk.4
	for <dm-devel@redhat.com>; Sat, 31 Aug 2019 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tmon2nsCGGiTwTbCgX8RWnsXhZyAFWz+AeveDC+aGbk=;
	b=KSul85RTQRSGEvTDvrkeqaPSRe94xnK2N8zBndN5I0aZd9Okc+qdgWcH7Wj2ZEmSUQ
	YM6stiq0gq34koUtWwJ6oMadaMS7klo6cV5d6zrlobr1Np+Q8mLi1aj2Fa2n/D/vcZu8
	8gnjCrwsvLIxJEHw9G5IrOGLvqPTzgb1IgJydW+Ia1KobzsKYKVANgTcyyTVR1kNiuaU
	BQ1dJvfDKAuCEC1p2j0Lg/8Bf7RCRQL7NSvxO9h5p43DZib0hoo3TetZgknhgsT0dFA7
	C6v5LrgcUEu4hvc12N10Fq6RrvTEMtzJVydbAN2ORaDpKGSStWSBFHfiMSmdPReAt67R
	RyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tmon2nsCGGiTwTbCgX8RWnsXhZyAFWz+AeveDC+aGbk=;
	b=iimdowbIXCEbm6+1cO1ra2mTuDH0gPduUXnqRga82oFkOUfJOzJabSHpXBEtF1jcwm
	EA4AU83+gj3dG/o0mrLDXT8pK2OV0xwXLqGV5C6k5aDEULxGaRCuW2iuPOPlKodpfZKO
	Gl1aY1aR179jbYab6G+1okZbs5rPzG4U8BSJvh0ovr8MaUTGE+uQ5107/XyjLUkcXyMN
	3olwWRgotMNC74RR6Q1AawiyY4X08JcjBztW07Cv5+MjLjkGL4v7xbpXfPFbcadPzZH6
	XRXLvSBtDGxcC3PeBVAmbHmuFqyNiLHh7f/ZU4wwBUWgCSJedUYeWumfNyz2kXZEa2qv
	WENw==
X-Gm-Message-State: APjAAAUljXT4a99W++7W0PnF6k0ZRUy4emz6rszIXmmuRrLSkkl4/IGp
	aQdukI86O+AwwmMt96x0eHzg7A==
X-Google-Smtp-Source: APXvYqzBzU9E8plxTH5n+Pq+Ry1ViHSGxZexEizPo4IvC/Cftb8P2962a7CbUe3dTNBLfq6zqGtXzA==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr5014835wmb.107.1567245352030; 
	Sat, 31 Aug 2019 02:55:52 -0700 (PDT)
Received: from [192.168.1.103] (213.16.185.228.dsl.dyn.forthnet.gr.
	[213.16.185.228])
	by smtp.gmail.com with ESMTPSA id p10sm9834921wma.8.2019.08.31.02.55.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 31 Aug 2019 02:55:51 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20190709141522.29606-1-ntsironis@arrikto.com>
	<20190709141522.29606-2-ntsironis@arrikto.com>
	<20190829161929.GA34247@lobo>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <d33e472f-1413-d311-5659-94d2709b3fe1@arrikto.com>
Date: Sat, 31 Aug 2019 12:55:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829161929.GA34247@lobo>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.62]);
	Sat, 31 Aug 2019 09:55:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Sat, 31 Aug 2019 09:55:53 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 0  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, dm-devel@redhat.com, agk@redhat.com,
	iliastsi@arrikto.com
Subject: Re: [dm-devel] [RFC PATCH 1/1] dm: add clone target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Sat, 31 Aug 2019 09:56:29 +0000 (UTC)

On 8/29/19 7:19 PM, Mike Snitzer wrote:
> On Tue, Jul 09 2019 at 10:15am -0400,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> Add the dm-clone target, which allows cloning of arbitrary block
>> devices.
>>
>> dm-clone produces a one-to-one copy of an existing, read-only device
>> (origin) into a writable device (clone): It presents a virtual block
>> device which makes all data appear immediately, and redirects reads and
>> writes accordingly.
>>
>> The main use case of dm-clone is to clone a potentially remote,
>> high-latency, read-only, archival-type block device into a writable,
>> fast, primary-type device for fast, low-latency I/O. The cloned device
>> is visible/mountable immediately and the copy of the origin device to
>> the clone device happens in the background, in parallel with user I/O.
>>
>> When the cloning completes, the dm-clone table can be removed altogether
>> and be replaced, e.g., by a linear table, mapping directly to the clone
>> device.
>>
>> For further information and examples of how to use dm-clone, please read
>> Documentation/device-mapper/dm-clone.rst
>>
>> Suggested-by: Vangelis Koukis <vkoukis@arrikto.com>
>> Co-developed-by: Ilias Tsitsimpis <iliastsi@arrikto.com>
>> Signed-off-by: Ilias Tsitsimpis <iliastsi@arrikto.com>
>> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
>> ---
>>  Documentation/device-mapper/dm-clone.rst |  334 +++++
>>  drivers/md/Kconfig                       |   13 +
>>  drivers/md/Makefile                      |    2 +
>>  drivers/md/dm-clone-metadata.c           |  991 +++++++++++++
>>  drivers/md/dm-clone-metadata.h           |  158 +++
>>  drivers/md/dm-clone-target.c             | 2244 ++++++++++++++++++++++++++++++
>>  6 files changed, 3742 insertions(+)
>>  create mode 100644 Documentation/device-mapper/dm-clone.rst
>>  create mode 100644 drivers/md/dm-clone-metadata.c
>>  create mode 100644 drivers/md/dm-clone-metadata.h
>>  create mode 100644 drivers/md/dm-clone-target.c
>>
>> diff --git a/Documentation/device-mapper/dm-clone.rst b/Documentation/device-mapper/dm-clone.rst
>> new file mode 100644
>> index 000000000000..948b7ce31ce3
>> --- /dev/null
>> +++ b/Documentation/device-mapper/dm-clone.rst
>> @@ -0,0 +1,334 @@
>> +.. SPDX-License-Identifier: GPL-2.0-only
>> +
>> +========
>> +dm-clone
>> +========
>> +
>> +Introduction
>> +============
>> +
>> +dm-clone is a device mapper target which produces a one-to-one copy of an
>> +existing, read-only device (origin) into a writable device (clone): It presents
>> +a virtual block device which makes all data appear immediately, and redirects
>> +reads and writes accordingly.
>> +
>> +The main use case of dm-clone is to clone a potentially remote, high-latency,
>> +read-only, archival-type block device into a writable, fast, primary-type device
>> +for fast, low-latency I/O. The cloned device is visible/mountable immediately
>> +and the copy of the origin device to the clone device happens in the background,
>> +in parallel with user I/O.
>> +
>> +For example, one could restore an application backup from a read-only copy,
>> +accessible through a network storage protocol (NBD, Fibre Channel, iSCSI, AoE,
>> +etc.), into a local SSD or NVMe device, and start using the device immediately,
>> +without waiting for the restore to complete.
>> +
>> +When the cloning completes, the dm-clone table can be removed altogether and be
>> +replaced, e.g., by a linear table, mapping directly to the clone device.
>> +
>> +The dm-clone target reuses the metadata library used by the thin-provisioning
>> +target.
>> +
>> +Glossary
>> +========
>> +
>> +   Region
>> +     A fixed sized block. The unit of hydration.
>> +
>> +   Hydration
>> +     The process of filling a region of the clone device with data from the same
>> +     region of the origin device, i.e., copying the region from the origin to
>> +     the clone device.
>> +
>> +Once a region gets hydrated we redirect all I/O regarding it to the clone
>> +device.
> 
> There is a lot of awkward jargon that you're mixing into this target.
> 
> Why "region" and not "block"?  I can let "region" go but please be
> consistent (don't fall back to calling a region a block anywhere).
> 

I used the term "region" to avoid confusion with a device's
logical/physical block size. A "region" is the unit of copying from the
source to the destination device. dm-raid, also, uses the term "region".

But you are right that I should be consistent and never fall back to
calling it a block. I will fix this in v2.

> Why "hydration"?  Just needed to call it _something_?  I can let it go
> as long as it is a construct internal to the target's implementation.  I
> see no point making consumers of this target, that copies data from a
> source to destination, have to call something "hydration".
> 

Hydration refers to the process of filling an object, a region in the
case of dm-clone, with data from a data source, which is the source
device in our case.

Please see the below links for a more detailed definition of the term:

https://stackoverflow.com/questions/6991135/what-does-it-mean-to-hydrate-an-object/20787106#20787106
https://www.snaplogic.com/glossary/data-hydration

I think the term "hydration" is fit to what dm-clone is doing, but if
you insist I can change it to "background copying" both in the user
facing documentation and internally.

Please let me know what you think.

> And while we're at it why "origin" device instead of "source"?
> Why "clone" device instead of "dest" or "destination"?
> 

You are right. The terms "source" and "destination" are better and less
confusing than "origin" and "clone". I will rename both of these to
"source" and "destination" in v2.

> I can give the target name "dm-clone" a pass.. but dm-copy is less
> opaque IMHO.. I could go either way on those.
> 

I think the term "clone" describes the functionality of the target
better than the term "copy". Even if we disable the background copying,
the target exposes a "clone" of the source device, which can be used for
I/O right away, even if no regions have been cloned/copied to the
destination device yet.

Moreover, the term "clone" describes better the intended use case of the
target, i.e., to clone a read-only snapshot to a writable block device.

> 
>> +Background Hydration
>> +--------------------
>> +
>> +dm-clone copies continuously from the origin to the clone device, until all of
>> +the device has been copied.
>> +
>> +Copying data from the origin to the clone device uses bandwidth. The user can
>> +set a throttle to prevent more than a certain amount of copying occurring at any
>> +one time. Moreover, dm-clone takes into account user I/O traffic going to the
>> +devices and pauses the background hydration when there is I/O in-flight.
>> +
>> +A message `hydration_threshold <#sectors>` can be used to set the maximum number
>> +of sectors being copied, the default being 2048 sectors (1MB).
> 
> Think this should really be expressed in multiples of a region, e.g.:
> copy_threshold <# regions> (or clone_threshold)
> 

Ack, I will fix it in v2.

>> +dm-clone employs dm-kcopyd for copying portions of the origin device to the
>> +clone device. By default, we issue copy requests of size equal to the region
>> +size. A message `hydration_block_size <#sectors>` can be used to tune the size
>> +of these copy requests. Increasing the hydration block size results in dm-clone
>> +trying to batch together contiguous regions, so we copy the data in blocks of
>> +this size.
> 
> It is awkward to have 'hydration_block_size' vs target ctr
> provided "region size".  copy_batch_size <# regions>?  (or
> clone_batch_size)?
> 

You are right, I will fix this also in v2.

> Please take care of the external facing documentation to not use
> "hydration".  Of all the naming I dislike it the most.. sorry.
> 
> Also, please fold the following patch in before making any edits to the
> .c files for v2.
> 

Yes, of course. Thank you for the patch.

Nikos

> This review pass is the most trivial of the high level review, I'll be
> drilling in on other aspects of the implementation now.  But I suspect
> you've done a solid job with those details (based on what I've seen so
> far).
> 
> Thanks,
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

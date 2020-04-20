Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CA0FA1B0328
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 09:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587368171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s4xOyzZhXis1Jtk74aYOp3dZEyfKu4w9MtuJnf5LiPY=;
	b=fOQ4AcndFAxeTYvBVWd5gO0UHVrcS7Us1CKTBPMxEKYG5ym8fgZzAfmrxHV+zQxPmf6Wzz
	FJmLkElP3cxvF5MIDuZOtXHcJNUwM0m0sdT1qHbCZYH5yz7NQklJ92FECFC2xa7zsX8S5f
	zlyTnEfPsWZr3IR7lvU0rd/QpsdB28g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-85dVO9NjODOjzdUF86b0AQ-1; Mon, 20 Apr 2020 03:36:09 -0400
X-MC-Unique: 85dVO9NjODOjzdUF86b0AQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D94F107ACC9;
	Mon, 20 Apr 2020 07:36:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E8401001DC2;
	Mon, 20 Apr 2020 07:36:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0C2B938F3;
	Mon, 20 Apr 2020 07:35:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03K7Zk4J029626 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 03:35:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 261A460C84; Mon, 20 Apr 2020 07:35:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost.localdomain (unknown [10.40.194.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F8D760C63;
	Mon, 20 Apr 2020 07:35:39 +0000 (UTC)
To: dm-devel@redhat.com
References: <20200419073026.197967-1-pabs3@bonedaddy.net>
	<20200419131908.GA22398@redhat.com>
	<9cb6a39a43178be29af2f47a92c2e84754b62b69.camel@bonedaddy.net>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <6bbf9d94-2fbb-f96f-ea85-a480ba109c55@redhat.com>
Date: Mon, 20 Apr 2020 09:35:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9cb6a39a43178be29af2f47a92c2e84754b62b69.camel@bonedaddy.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Paul Wise <pabs3@bonedaddy.net>, linux-kernel@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 4/19/20 4:48 PM, Paul Wise wrote:
> On Sun, 2020-04-19 at 09:19 -0400, Mike Snitzer wrote:
> 
>> You went overboard with implementation before checking to see if your
>> work would be well received.  Your 2/3 patch header shows you're
>> capable of analyzing past commits to explain the evolution of code,
>> etc.  But yet you make no mention of this commit header which explicitly
>> speaks to why what you're proposing is _not_ acceptable:
>>
>> commit 8a74d29d541cd86569139c6f3f44b2d210458071
>> Author: Mike Snitzer <snitzer@redhat.com>
>> Date:   Tue Nov 14 15:40:52 2017 -0500
>>
>>      dm: discard support requires all targets in a table support discards
> 
> I do remember seeing this commit while working on this, I guess I
> ignored it in my attempts to get fstrim working on my rootfs, woops.
> 
>> I haven't looked closely at MD raid in this area but if you trully think
>> underlying MD raid can cope with issuing discards to devices that don't
>> support them (or that it avoids issuing them?) then please update
>> dm-raid.c to conditionally set ti->discard_supported (if not all devices
>> support discard).  That is how to inform DM core that the target knows
>> better and it will manage discards issued to it.  It keeps the change
>> local to dm-raid.c without the flag-day you're proposing.
> 
> On my system I have a HDD and an SSD, with /boot on MD RAID and / on
> ext4 on DM RAID on 2 DM crypt volumes. In this setup fstrim works on
> /boot but does not work on / and with my patches it works on / again.
> In addition I don't see any messages in dmesg or other issues when
> doing fstrim / with my patches.

Did you have discard allowed on both dm-crypt devices? dm-crypt (kernel) 
does not allow discards by default.

Regards O.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A312A1DBD64
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 20:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590000855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IAAblNljPdhuhIx7woR2Dopjz3zy07Mqquk8R4eIv7w=;
	b=RDWgWd3Vtt6j7A5W1Z5Y4gnbdjVvi6gVxcYth1qLuALbFlgGlKGUR4quebkaeaIXu/8AXM
	v4t5uiyXwpen0kV5qReSvTgO1ou3huDGTsRdgBiigP8kApk+Jf+L319ZoEVX/H1WzAvMVi
	0d96g/UTzeHFcJ3/IY2t/VMPGMUmFWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-Fd2HWGErODKqU3cx29w3jA-1; Wed, 20 May 2020 14:54:12 -0400
X-MC-Unique: Fd2HWGErODKqU3cx29w3jA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44885EC1A0;
	Wed, 20 May 2020 18:54:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0442179596;
	Wed, 20 May 2020 18:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4FCC4EDBB;
	Wed, 20 May 2020 18:53:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KIrcr4025748 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 14:53:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 364BC2C7B9; Wed, 20 May 2020 18:53:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72B6062932;
	Wed, 20 May 2020 18:53:35 +0000 (UTC)
Date: Wed, 20 May 2020 14:53:34 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200520185334.GA4926@redhat.com>
References: <20200519081424.103318-1-hare@suse.de>
	<BY5PR04MB6900CC6DA3FECFAC70AFDC26E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900CC6DA3FECFAC70AFDC26E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv2 0/6] dm-zoned: improve cache performance
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, May 19 2020 at  6:36pm -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> On 2020/05/19 17:14, Hannes Reinecke wrote:
> > Hi all,
> > 
> > here's an update to dm-zoned to separate out cache zones.
> > In the update to metadata version 2 the regular drive was split
> > in emulated zones, which were handled just like 'normal' random
> > write zones.
> > This causes a performance drop once these emulated zones have
> > been mapped, as typicall the random zones from the zoned drive
> > will perform noticeably slower than those from the regular drive.
> > (After all, that was kinda the idea of using a regular disk in
> > the first place ...)
> > 
> > So in this patchset I've introduced a separate 'cache' zone type,
> > allowing us to differentiate between emulated and real zones.
> > With that we can switch the allocation mode to use only cache
> > zones, and use random zones similar to sequential write zones.
> > That avoids the performance issue noted above.
> > 
> > I've also found that the sequential write zones perform noticeably
> > better on writes (which is all we're caching anyway), so I've
> > added another patch switching the allocation routine from preferring
> > sequential write zones for reclaim.
> > 
> > This patchset also contains some minor fixes like remving an unused
> > variable etc.
> > 
> > As usual, comments and reviews are welcome.
> 
> I ran this overnight with no problems. Throughput results attached.
> Reclaim seems to be a little too aggressive as it triggers very early. But we
> can tune that later if really needed: the combination of ext4 writing all over
> the place and the faster cache zones on SSD may simply result in a percentage of
> free cache zones becoming low very quickly, in which case, reclaim is working
> exactly as expected :)

I've staged this series for 5.8 in linux-next

Just to make sure no regressions due to all the metadata2 changes: Did
you happen to verify all worked as expected without using an extra
drive?

> Mike,
> 
> With the NVMe io_opt fix patch applied, the alignment warning for the target
> limits is gone.

OK

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


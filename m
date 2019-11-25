Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 508141094ED
	for <lists+dm-devel@lfdr.de>; Mon, 25 Nov 2019 22:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574716074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sEszJo1jgh6omksrcKZDuhWLirPFqo5ANL7hYzfhAMA=;
	b=K6AQ8A9QWuq5cuJBk30otC//3pgYMzHpUPEBmuiUtXkH8bLsVmi/NVgIgeOMYLpU8fkmw5
	XSNnC8IimZoWQSSgipil6jJQo5kHJ5QjLoHveXzFWLVQCNGpGuOqNAmiD/SgU7Gnrh4X61
	U6iQqWha05vvnzU1UxZh3ExZktK4C7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-9ZKVsXgvO_S_GQKeRGOORg-1; Mon, 25 Nov 2019 16:07:51 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B3471007BF0;
	Mon, 25 Nov 2019 21:07:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B2271001B08;
	Mon, 25 Nov 2019 21:07:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F7A87F20C;
	Mon, 25 Nov 2019 21:07:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPL7KcE003267 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 16:07:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC86B2026D69; Mon, 25 Nov 2019 21:07:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D830F2026D67
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 21:07:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A1528F71AB
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 21:07:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-178-xBkSVG-dOauiic-5xKbtmQ-1;
	Mon, 25 Nov 2019 16:07:12 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 2CD75B008;
	Mon, 25 Nov 2019 21:07:09 +0000 (UTC)
Message-ID: <a9b5e49f6c6ef0fedaa403ce02cf0d1b39912cff.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
To: Drew Hastings <dhastings@crucialwebhost.com>, dm-devel@redhat.com
Date: Mon, 25 Nov 2019 22:07:48 +0100
In-Reply-To: <CAN-y+E+65bgiUSL6VMvRJLd3AiqD7xApbm1nA69ue_M6tTsGrA@mail.gmail.com>
References: <CAN-y+EJOt=MRDEXCx9_U4zmDs+i9yXj364E4+z=xC=u8+Ao1PQ@mail.gmail.com>
	<329fd408ea605f1f14c0eebb46209fd3c46c3af8.camel@suse.de>
	<CAN-y+E+65bgiUSL6VMvRJLd3AiqD7xApbm1nA69ue_M6tTsGrA@mail.gmail.com>
User-Agent: Evolution 3.34.1
MIME-Version: 1.0
X-MC-Unique: xBkSVG-dOauiic-5xKbtmQ-1
X-MC-Unique: 9ZKVsXgvO_S_GQKeRGOORg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAPL7KcE003267
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] multipath - unable to use multiple active paths at
 once, and deprecated example in docs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-25 at 13:42 -0700, Drew Hastings wrote:
> On Mon, Nov 25, 2019 at 12:48 PM Martin Wilck <mwilck@suse.de> wrote:
> > I think you are seeing this FIXME:
> > 
> > https://elixir.bootlin.com/linux/v4.19.79/source/drivers/md/dm-mpath.c#L612
> > 
> > For your testing, perhaps you just remove that if(!pgpath)
> > condition.
> > 
> > Regards,
> > Martin
> 
> That's correct, thanks. It works as expected after removing that
> condition.
> 
> With some limited testing using fio, I don't see any obvious negative
> impacts of allowing choose_pgpath to run each bio mapping. I also
> don't see any significant increase in CPU usage or IO latency during
> benchmarking.
> 
> The FIXME comment acknowledges that this sort of defeats the
> balancing function of multipath, so I'm assuming this was removed for
> a good reason. Does anyone know why this was done? In my particular
> use case, I benefit from balancing the paths for throughput, so it's
> useful to me.

This originates from the former use of dm-multipath for NVMe devices,
the now obsolete "nvme" queue mode, and from the attempt to separate
dm-multipath from SCSI and its device handler model. See 8d47e65948dd
("dm mpath: remove unnecessary NVMe branching in favor of scsi_dh
checks").

It seems indeed strange to skip choosing the path in the absence of the
SCSI device handler, which is (with a grain of salt) responsible for
switching *path groups*, not paths inside a group. It's a corner case,
I don't think many real-world multipath setups deploy bio-based dm-
mpath without a device handler.

So, I suggest you submit a patch and discuss this with Mike :-)

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


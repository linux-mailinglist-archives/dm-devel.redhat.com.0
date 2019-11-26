Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E02EA10A15C
	for <lists+dm-devel@lfdr.de>; Tue, 26 Nov 2019 16:41:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574782899;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FPS5vuYar5hQnvYPTk7xPsFV0MHyrGJIEd2gjfFNpNs=;
	b=JeJo0/uFQiyP4uVWexkTN+srXyFJ1lMj6lVnVV47ttxpudRlOOK2LxgZXN095q0NLvhmNa
	9yaE/Fj9zpTQPgJeYPDa7LCG2JXGfhPEpnYXg59ZEoPY9Er16EwESzYqiwPm0kv/Wcc4f+
	vSyMhYBTO2Bg9p2JUMAK7w9AMaIjDuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-FUMEXoANPh-q2AeRQTth2A-1; Tue, 26 Nov 2019 10:41:36 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1817118557CD;
	Tue, 26 Nov 2019 15:41:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EFBB608BB;
	Tue, 26 Nov 2019 15:41:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B5944BB65;
	Tue, 26 Nov 2019 15:41:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQFdLMm013782 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 10:39:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 682DF600F4; Tue, 26 Nov 2019 15:39:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB47B600F2;
	Tue, 26 Nov 2019 15:39:18 +0000 (UTC)
Date: Tue, 26 Nov 2019 10:39:17 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Martin Wilck <mwilck@suse.de>
Message-ID: <20191126153917.GA2025@redhat.com>
References: <CAN-y+EJOt=MRDEXCx9_U4zmDs+i9yXj364E4+z=xC=u8+Ao1PQ@mail.gmail.com>
	<329fd408ea605f1f14c0eebb46209fd3c46c3af8.camel@suse.de>
	<CAN-y+E+65bgiUSL6VMvRJLd3AiqD7xApbm1nA69ue_M6tTsGrA@mail.gmail.com>
	<a9b5e49f6c6ef0fedaa403ce02cf0d1b39912cff.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <a9b5e49f6c6ef0fedaa403ce02cf0d1b39912cff.camel@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Drew Hastings <dhastings@crucialwebhost.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: FUMEXoANPh-q2AeRQTth2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Nov 25 2019 at  4:07pm -0500,
Martin Wilck <mwilck@suse.de> wrote:

> On Mon, 2019-11-25 at 13:42 -0700, Drew Hastings wrote:
> > On Mon, Nov 25, 2019 at 12:48 PM Martin Wilck <mwilck@suse.de> wrote:
> > > I think you are seeing this FIXME:
> > > 
> > > https://elixir.bootlin.com/linux/v4.19.79/source/drivers/md/dm-mpath.c#L612
> > > 
> > > For your testing, perhaps you just remove that if(!pgpath)
> > > condition.
> > > 
> > > Regards,
> > > Martin
> > 
> > That's correct, thanks. It works as expected after removing that
> > condition.
> > 
> > With some limited testing using fio, I don't see any obvious negative
> > impacts of allowing choose_pgpath to run each bio mapping. I also
> > don't see any significant increase in CPU usage or IO latency during
> > benchmarking.
> > 
> > The FIXME comment acknowledges that this sort of defeats the
> > balancing function of multipath, so I'm assuming this was removed for
> > a good reason. Does anyone know why this was done? In my particular
> > use case, I benefit from balancing the paths for throughput, so it's
> > useful to me.
> 
> This originates from the former use of dm-multipath for NVMe devices,
> the now obsolete "nvme" queue mode, and from the attempt to separate
> dm-multipath from SCSI and its device handler model. See 8d47e65948dd
> ("dm mpath: remove unnecessary NVMe branching in favor of scsi_dh
> checks").
> 
> It seems indeed strange to skip choosing the path in the absence of the
> SCSI device handler, which is (with a grain of salt) responsible for
> switching *path groups*, not paths inside a group. It's a corner case,
> I don't think many real-world multipath setups deploy bio-based dm-
> mpath without a device handler.
> 
> So, I suggest you submit a patch and discuss this with Mike :-)

Hindsight being 20/20: it was misplaced micro-optimization that
compromised the broader features provided by the configurable path
selectors.

I've just removed __map_bio_fast(), see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.5&id=dbaf971c9cdf10843071a60dcafc1aaab3162354

not sure when I'll send this to Linus.. likely in a couple weeks as part
of any other DM fixes (first batch of DM changes for 5.5 was already
merged yesterday).

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


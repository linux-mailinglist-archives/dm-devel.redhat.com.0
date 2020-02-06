Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D9A3C153C56
	for <lists+dm-devel@lfdr.de>; Thu,  6 Feb 2020 01:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580949693;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZLgPxtirFugKaWey85jdb2ht8jP4ysySSoiRsSHu0Tw=;
	b=bj0ghJsyUgHpNlXOxP2Ho0XTTtj7lPdydqemIpnrVnmFo4ZsSTKkBsp+mqmxTZbJKKTo+K
	nL+K+ccoSJpoVlPDGbIuV97uwTSaE37g4BhS6f+DFS/UE+HkCn/toIHa4d/GAEgBxuHRR7
	FGtxHmmPnsn+6FnZxWhwVoFE+9+XG0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-0_5hGfrVMKiNclAeNFyqEg-1; Wed, 05 Feb 2020 19:41:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60C9D1137841;
	Thu,  6 Feb 2020 00:41:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD0A18DC19;
	Thu,  6 Feb 2020 00:41:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 621FA8175A;
	Thu,  6 Feb 2020 00:41:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0160f1rt031200 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 19:41:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B6B872166B28; Thu,  6 Feb 2020 00:41:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B290C2166B27
	for <dm-devel@redhat.com>; Thu,  6 Feb 2020 00:40:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17B9A803876
	for <dm-devel@redhat.com>; Thu,  6 Feb 2020 00:40:59 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-125-BCeqz_T0PPuMDWuSKF2wGA-1; Wed, 05 Feb 2020 19:40:56 -0500
Received: by mail-ot1-f65.google.com with SMTP id h9so3846569otj.11
	for <dm-devel@redhat.com>; Wed, 05 Feb 2020 16:40:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2wKAh9wuYiuc5W6sTWogwjdscmPsuVFsTNX4yHQsFIQ=;
	b=ZZFdF4sFyeok34haMnMox7E4I8XOhPi6JhR5kictCxq5RNw37yjH/6oOhX4+jOSvFv
	n+Xsslh/5QbDdCw7UUEas/uwcdOsT0K6r0esIrfrXkFg5Wky28huydsbdQ2twEMxxsrD
	YIdHGguDMD/DpP5MIk62Gxr5Uso1w4Hf7CkiueyfeozGn98dGn3vPqH/racy2wgwZqTH
	GykPdEKUNx6QZ7J/xWwxQ1yUVWg1wBobg66SpAAivmcAnZu8N+DdI2vQ5jvyO4qxHZUA
	9oI3/10FgWeCxltvvWY23bd3vRNkNylX6Dj/ROZ0zOR9PC4MLZ8pzu3B5XyacadXiKFT
	L8/A==
X-Gm-Message-State: APjAAAWYjYFAEb1WNDsIp8nmT+LmMXKntm+k9xGpB3v2F9lJJmsU/tiN
	SrpZQNNLm62T/kd3x7ZWvc8PvlD8SdkQr0K2ZIQzVg==
X-Google-Smtp-Source: APXvYqyKZ7yhH4qQ9POMbzWU+GRmK/2Uv1thD8dauL6GIvGQJ18ctO/qrHQMqFzNWYo5JVYYzySS+tO87KVxX3Ho1aw=
X-Received: by 2002:a9d:4e99:: with SMTP id v25mr29141169otk.363.1580949655787;
	Wed, 05 Feb 2020 16:40:55 -0800 (PST)
MIME-Version: 1.0
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-2-vgoyal@redhat.com>
	<20200205183050.GA26711@infradead.org>
	<20200205200259.GE14544@redhat.com>
In-Reply-To: <20200205200259.GE14544@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 5 Feb 2020 16:40:44 -0800
Message-ID: <CAPcyv4iY=gw86UDLqpiCtathGXRUuxOMuU=unwxzA-cm=0x+Sg@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-MC-Unique: BCeqz_T0PPuMDWuSKF2wGA-1
X-MC-Unique: 0_5hGfrVMKiNclAeNFyqEg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0160f1rt031200
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>
Subject: Re: [dm-devel] [PATCH 1/5] dax,
	pmem: Add a dax operation zero_page_range
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 5, 2020 at 12:03 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Wed, Feb 05, 2020 at 10:30:50AM -0800, Christoph Hellwig wrote:
> > > +   /*
> > > +    * There are no users as of now. Once users are there, fix dm code
> > > +    * to be able to split a long range across targets.
> > > +    */
> >
> > This comment confused me.  I think this wants to say something like:
> >
> >       /*
> >        * There are now callers that want to zero across a page boundary as of
> >        * now.  Once there are users this check can be removed after the
> >        * device mapper code has been updated to split ranges across targets.
> >        */
>
> Yes, that's what I wanted to say but I missed one line. Thanks. Will fix
> it.
>
> >
> > > +static int pmem_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> > > +                               unsigned int offset, size_t len)
> > > +{
> > > +   int rc = 0;
> > > +   phys_addr_t phys_pos = pgoff * PAGE_SIZE + offset;
> >
> > Any reason not to pass a phys_addr_t in the calling convention for the
> > method and maybe also for dax_zero_page_range itself?
>
> I don't have any reason not to pass phys_addr_t. If that sounds better,
> will make changes.

The problem is device-mapper. That wants to use offset to route
through the map to the leaf device. If it weren't for the firmware
communication requirement you could do:

dax_direct_access(...)
generic_dax_zero_page_range(...)

...but as long as the firmware error clearing path is required I think
we need to do pass the pgoff through the interface and do the pgoff to
virt / phys translation inside the ops handler.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


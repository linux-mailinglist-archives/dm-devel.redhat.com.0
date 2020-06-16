Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4311FC871
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jun 2020 10:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592382084;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9CEvhCThl0uGU3u6WwTfhleaSUks2ZiNuKiRuLsEVfg=;
	b=QknSP1t0+trvF+dmHT16wtL6R4VNb5HoVLemivVqlt64VeL9T4/bjENFmETEj8vvIiMYm8
	lyW9jwsj7lqxiwlCq01LqYY+WySNOkodcd4KzBQMO2ijSontnB3Q5meLNi11cRxnexpxbV
	2LO9Mlsu0x73RLnc9OTQyNnRkGt6NME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-RW9StuKqNjOfdC9yPMsA1A-1; Wed, 17 Jun 2020 04:21:21 -0400
X-MC-Unique: RW9StuKqNjOfdC9yPMsA1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7722418A266E;
	Wed, 17 Jun 2020 08:21:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 560A55C1BD;
	Wed, 17 Jun 2020 08:21:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D2DF833C6;
	Wed, 17 Jun 2020 08:21:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GNOQhQ020465 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 19:24:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B190E202696C; Tue, 16 Jun 2020 23:24:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD13E2026DFD
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 23:24:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17BCA1859162
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 23:24:24 +0000 (UTC)
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-178-ALPiMYuJO2if9SaErFaQVA-1;
	Tue, 16 Jun 2020 19:24:21 -0400
X-MC-Unique: ALPiMYuJO2if9SaErFaQVA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
	include these headers.
From: Marius Bakke <marius@devup.no>
To: Martin Wilck <mwilck@suse.com>, dm-devel@redhat.com
In-Reply-To: <d909fc0a2383f028ae7c3ad00c142193ca8d9ae7.camel@suse.com>
References: <20200516175508.12412-1-marius@devup.no>
	<d909fc0a2383f028ae7c3ad00c142193ca8d9ae7.camel@suse.com>
Date: Wed, 17 Jun 2020 01:17:57 +0200
Message-ID: <87d05yeh22.fsf@gnu.org>
MIME-Version: 1.0
X-Spam-Score: -0.10
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 17 Jun 2020 04:20:55 -0400
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH] multipath-tools: Fix compiler warnings when
	built without systemd.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Martin Wilck <mwilck@suse.com> writes:

> Hello Marius,
>
> On Sat, 2020-05-16 at 19:55 +0200, Marius Bakke wrote:
>> ---
>>  libmultipath/config.c |  2 +-
>>  multipathd/main.c     | 19 +++++++++++++------
>>  2 files changed, 14 insertions(+), 7 deletions(-)
>> 
>
> thank you for the patch, and sorry for the late reply.
> Thanks to Xose, too, for making me aware of it.
>
> This patch needs some improvements, see remarks below.
>
> In general, please note that the development and in particular the
> testing of multipath-tools has been done almost exclusively on systems
> using systemd for several years now. The compilation issues you
> encountered may only be the tip of the iceberg. In particular, the udev
> rules shipped with multipath-tools rely on systemd for proper device
> setup.

Thanks for reviewing.  I'm mainly here for 'kpartx' anyway, but "good"
to know that multipath-tools may need extra care outside of systemd.

I'm hardly a C programmer, so thanks for bearing with me.  Adding just
plain old ifdef guards is much clearer than sprinkling __attribute__
around.

V2 sent in a separate message.

Thanks,
Marius

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


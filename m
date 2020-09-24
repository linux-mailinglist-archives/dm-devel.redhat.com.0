Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E600C2775B9
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 17:47:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-9Kos1XhnNDSfyjGHGEaMBw-1; Thu, 24 Sep 2020 11:47:10 -0400
X-MC-Unique: 9Kos1XhnNDSfyjGHGEaMBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 529241882FC0;
	Thu, 24 Sep 2020 15:47:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B1578831;
	Thu, 24 Sep 2020 15:46:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 933F21826D2D;
	Thu, 24 Sep 2020 15:46:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OFk1fP010024 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 11:46:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15895114CA9; Thu, 24 Sep 2020 15:46:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FAB0114CF0
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 15:45:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACA5918AE949
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 15:45:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-425-rsjrjaiyMF-AGbIiPDtDzA-1;
	Thu, 24 Sep 2020 11:45:54 -0400
X-MC-Unique: rsjrjaiyMF-AGbIiPDtDzA-1
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 48A352220C;
	Thu, 24 Sep 2020 15:45:52 +0000 (UTC)
Date: Thu, 24 Sep 2020 08:45:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200924154550.GA1266@sol.localdomain>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-3-satyat@google.com>
	<20200922003255.GC32959@sol.localdomain>
	<20200924011438.GD10500@redhat.com>
	<20200924071721.GA1883346@google.com>
	<20200924134649.GB13849@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924134649.GB13849@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Satya Tangirala <satyat@google.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] dm: add support for passing through
 inline crypto support
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 09:46:49AM -0400, Mike Snitzer wrote:
> > > Can you help me better understand the expected consumer of this code?
> > > If you have something _real_ please be explicit.  It makes justifying
> > > supporting niche code like this more tolerable.
> >
> > So the motivation for this code was that Android currently uses a device
> > mapper target on top of a phone's disk for user data. On many phones,
> > that disk has inline encryption support, and it'd be great to be able to
> > make use of that. The DM device configuration isn't changed at runtime.
> 
> OK, which device mapper target is used?

There are several device-mapper targets that Android can require for the
"userdata" partition -- potentially in a stack of more than one:

dm-linear: required for Dynamic System Updates
(https://developer.android.com/topic/dsu)

dm-bow: required for User Data Checkpoints on ext4
(https://source.android.com/devices/tech/ota/user-data-checkpoint)
(https://patchwork.kernel.org/patch/10838743/)

dm-default-key: required for metadata encryption
(https://source.android.com/security/encryption/metadata)

We're already carrying this patchset in the Android common kernels since late
last year, as it's required for inline encryption to work when any of the above
is used.  So this is something that is needed and is already being used.

Now, you don't have to "count" dm-bow and dm-default-key since they aren't
upstream; that leaves dm-linear.  But hopefully the others at least show that
architecturally, dm-linear is just the initial use case, and this patchset also
makes it easy to pass through inline crypto on any other target that can support
it (basically, anything that doesn't change the data itself as it goes through).

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


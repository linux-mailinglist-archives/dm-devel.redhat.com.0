Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A763113B6C1
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jan 2020 02:23:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579051412;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dZWFqoZ0Hf8q2rOGMVznOmqAvEHxc17PmPaqz+CvMp0=;
	b=f+kDGGUbGC6GFrX3m0jFlOAmPGw7c/mA/cq3Zazl5JSEeTOn4QByn95pVZsGNi0HHeqbqH
	+NjrK3fGcbOufag9lIODflU49Aw6DFaeEfWzqaN8iY/qUSdXdpuP7tXd3qIPH8d/+XNewh
	6GugtbEGLMy5yTJKYIvDsLf6w0D2gME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-xK2pszZVN2mdL4uJ4Rl7jA-1; Tue, 14 Jan 2020 20:23:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCCAF8024DF;
	Wed, 15 Jan 2020 01:23:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74643272A9;
	Wed, 15 Jan 2020 01:23:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CD311809567;
	Wed, 15 Jan 2020 01:23:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F1MqsG023989 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 20:22:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9092A2166B2B; Wed, 15 Jan 2020 01:22:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C92A2166B28
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 01:22:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 942C110192A7
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 01:22:50 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-58-MJuNPVc4N8KswuK5sSZ1AQ-1; Tue, 14 Jan 2020 20:22:48 -0500
Received: by mail-pf1-f195.google.com with SMTP id q10so7557387pfs.6;
	Tue, 14 Jan 2020 17:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PM6QWDHPmw5kdiIrgY1FxbT/e0QV+PJ//rAEZB27p4g=;
	b=c+hHAd6DEc/IznMa6GCvUJCNzSb8nOgu/dNdHsG1u8LWGaoi+UlEKFrQGXkaDsZCHv
	0ipEfw4dYmclBheC6o/7Yegmn6O9SEwxPpxlNg/qbgHfogsgtyM3UfyA5z0zSHDlS4T/
	dybWKIsLNiYeFkBRmE5jc+CQBoXkvBXYc82v8xo5oNd12Fxr8SwTu6ikeVL/7ZNnkwb3
	Eq+cB6nDdnprQElbNZ0TqNaunu4IiyIvskXGI+dW5wOWms9ABk/z9QjJNEvGmRRfrOgg
	3r1MkYTZhQiE2emfU7nDoPpuQFOT2thWSoJYPBPIo/wmIn10AFICThDt4fVSxId7ejnb
	1pYQ==
X-Gm-Message-State: APjAAAWq3MEXvY7OyTdnSn2dCVJWBKg4X8SU4uVH7BKexGhbooarXg5L
	cxMacHnfDMF8Fuop2Xv7hQGnap1idP8AWyuHZrc=
X-Google-Smtp-Source: APXvYqxZMHGMze09A1aQd5eSXisuAxZshcmQ/9sybd+Y4BM/S2H6Kgx1F9iT/EF5GhK8yU6xerE8uo3UBLJrLuj4LS4=
X-Received: by 2002:aa7:8f3d:: with SMTP id y29mr29328628pfr.183.1579051367083;
	Tue, 14 Jan 2020 17:22:47 -0800 (PST)
MIME-Version: 1.0
References: <alpine.LRH.2.11.1909251814220.15810@mx.ewheeler.net>
	<alpine.LRH.2.11.1912201829300.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912270137420.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912271946380.26683@mx.ewheeler.net>
	<20200107103546.asf4tmlfdmk6xsub@reti>
	<20200107104627.plviq37qhok2igt4@reti>
	<20200107122825.qr7o5d6dpwa6kv62@reti>
	<20200114215248.GK41220@gmail.com>
In-Reply-To: <20200114215248.GK41220@gmail.com>
From: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 14 Jan 2020 20:22:35 -0500
Message-ID: <CAMM=eLfODVMDtGahspZsGsBM5Ty_dt+8idJVTyeudzHZQqsDdA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-MC-Unique: MJuNPVc4N8KswuK5sSZ1AQ-1
X-MC-Unique: xK2pszZVN2mdL4uJ4Rl7jA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00F1MqsG023989
X-loop: dm-devel@redhat.com
Cc: Eric Wheeler <dm-devel@lists.ewheeler.net>, markus.schade@gmail.com,
	device-mapper development <dm-devel@redhat.com>,
	LVM2 development <lvm-devel@redhat.com>,
	linux-block <linux-block@vger.kernel.org>, Joe Thornber <ejt@redhat.com>,
	Joe Thornber <joe.thornber@gmail.com>
Subject: Re: [dm-devel] kernel BUG at
	drivers/md/persistent-data/dm-space-map-disk.c:178
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 14, 2020 at 4:53 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Tue, Jan 07, 2020 at 12:28:25PM +0000, Joe Thornber wrote:
> > On Tue, Jan 07, 2020 at 10:46:27AM +0000, Joe Thornber wrote:
> > > I'll get a patch to you later today.
> >
> > Eric,
> >
> > Patch below.  I've run it through a bunch of tests in the dm test suite.  But
> > obviously I have never hit your issue.  Will do more testing today.
> >
> > - Joe
> >
> >
> >
> > Author: Joe Thornber <ejt@redhat.com>
> > Date:   Tue Jan 7 11:58:42 2020 +0000
> >
> >     [dm-thin, dm-cache] Fix bug in space-maps.
> >
> >     The space-maps track the reference counts for disk blocks.  There are variants
> >     for tracking metadata blocks, and data blocks.
> >
> >     We implement transactionality by never touching blocks from the previous
> >     transaction, so we can rollback in the event of a crash.
> >
> >     When allocating a new block we need to ensure the block is free (has reference
> >     count of 0) in both the current and previous transaction.  Prior to this patch we
> >     were doing this by searching for a free block in the previous transaction, and
> >     relying on a 'begin' counter to track where the last allocation in the current
> >     transaction was.  This 'begin' field was not being updated in all code paths (eg,
> >     increment of a data block reference count due to breaking sharing of a neighbour
> >     block in the same btree leaf).
> >
> >     This patch keeps the 'begin' field, but now it's just a hint to speed up the search.
> >     Instead we search the current transaction for a free block, and then double check
> >     it's free in the old transaction.  Much simpler.
> >
>
> I happened to notice this patch is on the linux-dm/for-next branch
> (https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=for-next&id=2137c0dcc04b24efb4c38d4b46b7194575718dd5)
> and it has:
>
>         Reported-by: Eric Biggers <ebiggers@google.com>
>
> This is wrong, I didn't report this.  I think you meant to put:
>
>         Reported-by: Eric Wheeler <dm-devel@lists.ewheeler.net>
>
> - Eric (the other one)

Fixed it up, not sure how that happened, sorry about that!


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


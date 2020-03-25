Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id DC469192EAD
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 17:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585155219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9wdXcMFpJ5rUAodvtsoP2zCiGBc3EmM6/h6YXg4GZcQ=;
	b=Ij+M5UbVwFriAD3hWxg1WOulwAl13jN/dxx46MysKeypgiQeBrQeEUTX4HTMV1iyF2ZVx7
	uebbTjQCr9l+b7QIXacvI9fyNnGKVLK3oLl4p27QDkCoNkhku7JDniVaNNo+SKl+SP2moE
	IHwbhaX7KeRLgQlWXF8i/6kTPo8/jSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-ZAk_aNeCOdKiT5Izi4ivvQ-1; Wed, 25 Mar 2020 12:53:37 -0400
X-MC-Unique: ZAk_aNeCOdKiT5Izi4ivvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11F588017CE;
	Wed, 25 Mar 2020 16:53:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AEE15D9CA;
	Wed, 25 Mar 2020 16:53:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5982218089C8;
	Wed, 25 Mar 2020 16:53:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PGrANF015251 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 12:53:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF82F1108FD; Wed, 25 Mar 2020 16:53:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB5741108CA
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 16:53:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB86C8FF668
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 16:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-342-kGVlNMpkMFOwOMbJNGbEaA-1; Wed, 25 Mar 2020 12:53:03 -0400
X-MC-Unique: kGVlNMpkMFOwOMbJNGbEaA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jH8x5-0000SZ-H8; Wed, 25 Mar 2020 16:32:23 +0000
Date: Wed, 25 Mar 2020 09:32:23 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200325163223.GA27156@infradead.org>
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
	<e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
	<69c0b8a4-656f-98c4-eb55-2fd1184f5fc9@virtuozzo.com>
	<67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
	<20200319102819.GA26418@infradead.org> <yq1tv2k8pjn.fsf@oracle.com>
	<20200325162656.GJ29351@magnolia>
MIME-Version: 1.0
In-Reply-To: <20200325162656.GJ29351@magnolia>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PGrANF015251
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com, sagi@grimberg.me,
	Christoph Hellwig <hch@infradead.org>, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
	dsterba@suse.com, bvanassche@acm.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org, tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v7 0/6] block: Introduce REQ_ALLOCATE flag
 for REQ_OP_WRITE_ZEROES
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Mar 25, 2020 at 09:26:56AM -0700, Darrick J. Wong wrote:
> > That said, I do think that we have traditionally put emphasis on the
> > wrong part of these operations. All we ever talk about wrt. discard and
> > friends is the zeroing aspect. But I actually think that, semantically,
> > the act of allocating and deallocating blocks is more important. And
> > that zeroing is an optional second order effect of those operations. So
> > if we could go back in time and nuke multi-range DSM TRIM/UNMAP, I would
> > like to have REQ_OP_ALLOCATE/REQ_OP_DEALLOCATE with an optional REQ_ZERO
> > flag. I think that would be cleaner. I have a much easier time wrapping
> > my head around "allocate this block and zero it if you can" than "zero
> > this block and do not deallocate it". But maybe that's just me.
> 
> I'd love to transition to that.  My brain is not good at following all
> the inverse logic that NOUNMAP spread everywhere.  I have a difficult
> time following what the blockdev fallocate code does, which is sad since
> hch and I are the primary stuckees^Wmeddlers^Wauthors of that function. :/

I am very much against that for the following reason:

 - the current REQ_OP_DISCARD is purely a hint, and implementations can
   (and do) choose to ignore it
 - REQ_OP_WRITE_ZEROES is an actual data integrity operation with
   everything that entails

Going back to mixing these two will lead to a disaster sooner or later.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel


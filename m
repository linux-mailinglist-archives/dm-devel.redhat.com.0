Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id C50C0193C54
	for <lists+dm-devel@lfdr.de>; Thu, 26 Mar 2020 10:54:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585216451;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Apme9BJnxlP8adBpjH/7MvA5DK2Ujq3wr5opnPmAr0c=;
	b=hozpV898evaExYsQrXdVGCe2m5q4qU0HHo/+DMsomVS5YutK1onJ2EpPBm5wcuxwLutGB4
	+hb2YAvddGwnE6hrE6b8XsE29zATIxXjV8salHwtn+wY6drUuKE4EPtIP9F52M+9dSJhji
	7vy0F1+LGdDPwfXDYS0n0u4ywTHVZE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-scD-cQrpNwW31Xicd3Lm0Q-1; Thu, 26 Mar 2020 05:54:09 -0400
X-MC-Unique: scD-cQrpNwW31Xicd3Lm0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A17CE18C8C00;
	Thu, 26 Mar 2020 09:54:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94357790E0;
	Thu, 26 Mar 2020 09:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 493988A030;
	Thu, 26 Mar 2020 09:53:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02Q9rala015189 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 05:53:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3265A2026D67; Thu, 26 Mar 2020 09:53:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EACC20316E0
	for <dm-devel@redhat.com>; Thu, 26 Mar 2020 09:53:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 158BE8007AC
	for <dm-devel@redhat.com>; Thu, 26 Mar 2020 09:53:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-326-x1w0akJ_Pza3e74XPfo9ew-1; Thu, 26 Mar 2020 05:53:30 -0400
X-MC-Unique: x1w0akJ_Pza3e74XPfo9ew-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jHOpT-0001iz-SO; Thu, 26 Mar 2020 09:29:35 +0000
Date: Thu, 26 Mar 2020 02:29:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20200326092935.GA6478@infradead.org>
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
	<e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
	<69c0b8a4-656f-98c4-eb55-2fd1184f5fc9@virtuozzo.com>
	<67d63190-c16f-cd26-6b67-641c8943dc3d@virtuozzo.com>
	<20200319102819.GA26418@infradead.org> <yq1tv2k8pjn.fsf@oracle.com>
	<20200325162656.GJ29351@magnolia>
	<20200325163223.GA27156@infradead.org> <yq1d090jqlm.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <yq1d090jqlm.fsf@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02Q9rala015189
X-loop: dm-devel@redhat.com
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com, sagi@grimberg.me,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Christoph Hellwig <hch@infradead.org>, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, Kirill Tkhai <ktkhai@virtuozzo.com>,
	dsterba@suse.com, bvanassche@acm.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Mar 25, 2020 at 01:23:33PM -0400, Martin K. Petersen wrote:
> 
> Christoph,
> 
> > I am very much against that for the following reason:
> >
> >  - the current REQ_OP_DISCARD is purely a hint, and implementations can
> >    (and do) choose to ignore it
> >
> >  - REQ_OP_WRITE_ZEROES is an actual data integrity operation with
> >    everything that entails
> 
> If you want to keep emphasis on the "integrity operation" instead of the
> provisioning aspect, would you expect REQ_ALLOCATE (which may or may not
> zero blocks) to be considered a deterministic operation or a
> non-deterministic one? Should this depend on whether the device
> guarantees zeroing when provisioning blocks or not?

That's why I don't like the whole flags game very much.  I'd rather
have REQ_OP_WRITE_ZEROES as the integrity operation that gurantees
zeroing, and a REQ_ALLOCATE that doesn't guarantee zeroing, just some
deterministic state of the blocks.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

